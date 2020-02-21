/*#**** hit_manager.cpp *****/
#include <Bela.h>
#include <math.h>

#include "hit_manager.h"

hit_manager::hit_manager(float _sample_rate, float sma_length)
{
  sma = new simple_moving_average(sma_length);
  sample_rate = _sample_rate;

  max_samples_to_record=(int)(0.25f*sample_rate);
  printf("  max samples to record: %d\n",(int)max_samples_to_record);
  max_transient_samples=(int)(0.030f*sample_rate);
  
  current_hit = new hit(this);
}

float hit_manager::map_to_range(float input, float min, float max)
{
	float range=max-min;
   	float input_range_adjusted=input*range;
   	return min+input_range_adjusted;
}

void hit_manager::set_base_pitch(float knob)
{
   base_pitch=map_to_range(knob, 1.0, 0.5);	
}


void hit_manager::set_pitch_bend(float knob)    
{ 
   pitch_bend=knob*0.250f*sample_rate;

   rt_printf("   computed pitch bend: %.02f\n",pitch_bend);
}
    
void hit_manager::set_hit_threshold(float knob)
{ 
   	hit_threshold=map_to_range(knob,0.05f,0.15f); 
   	rt_printf("   computed threshold: %.02f\n",hit_threshold);

}

void hit_manager::set_gate_time(float knob) 
{ 
	gate_time=map_to_range(knob,1.0f,0.030f)*sample_rate;
	
	if(knob==0.0f)
	  gate_time=-1;
	  
	rt_printf("   computed gate time: %.02f\n",gate_time);
}
    
void hit_manager::set_boost(float knob)
{ 
    boost_amount=map_to_range(knob,1.0f,10.0f);
    
    //float volume=1.0f; //TODO: in future back volume off as distortion increases?
    
    rt_printf("   computed boost: %.02f\n",boost_amount);
}
   
void hit_manager::set_stut_length(float knob) 
{ 
     stut_length=map_to_range(knob,0.006f*sample_rate,0.050f*sample_rate);	
      rt_printf("   computed stut_length: %d\n",stut_length);
}
    
void hit_manager::set_stut_max_count(float knob) 
{ 
     stut_max_count=map_to_range(knob,0.0f,20.0f);	
      rt_printf("   computed stut_max_count: %d\n",stut_max_count);
}
    
void hit_manager::set_stut_pitch_mod(float knob) 
{
      stut_pitch_mod=map_to_range(knob,0.0,0.05f);
       rt_printf("   computed stut_pitch_mod: %.02f\n",stut_pitch_mod);
}
    
void hit_manager::set_stut_length_mod(float knob) 
{ 
    stut_length_mod=map_to_range(knob,1.0f,0.9f);
}

void hit_manager::set_delay_length(float knob) 
{ 

}

void hit_manager::set_delay_count(float knob) 
{ 

}

void hit_manager::set_delay_pmod(float knob) 
{ 

}

void hit_manager::set_delay_smod(float knob) 
{ 

}

void hit_manager::set_stut_lmod_up_button(bool value)
{
	is_stut_lmod_up=value;
}

void hit_manager::set_stut_pmod_up_button(bool value)
{
	is_stut_pmod_up=value;
}

void hit_manager::set_bend_up(bool value)
{
	bend_up=value;
}

void hit_manager::hit_happened()
{
  rt_printf("hit happened!\n");
  state = STATE_HIT;
  counter = 0;
  current_hit->reset();
  //current_hit->set_manager(this);
}

float hit_manager::tick(float input)
{
  current_sma = sma->tick(fabs(input) * sma_multiplier); // question: power or fabs of input?

  if (state == STATE_WAITING)
  {
    if (fabs(input) > (current_sma + hit_threshold))
    {
      hit_happened();
    }
  }

  if (state == STATE_HIT)
  {
    if (counter >= max_samples_to_record)
    {
    	rt_printf("recorded too many samples: %d\n",counter);
      current_hit->add_sample(input);
      state = STATE_WAITING;
      //current_hit->recording_done();
    }
    else if (counter >= max_transient_samples) // wait for transient to go away to allow next.
    {
      if (fabs(input) > (current_sma + hit_threshold))
      {
      	rt_printf("another hit interrupted!\n");
        hit_happened();
        current_hit->add_sample(input);
        counter++;
      }
      else
      {
      	 current_hit->add_sample(input);
         counter++;
      }
    }
    else
    {
      current_hit->add_sample(input);
      counter++;
    }
  }

  float out = current_hit->tick();

  return out;
}


/* //TODO or look for oldest hit
   int find_free_slot()
   {
           bool blank_found=false;
           unsigned int oldest_time=0;
           unsigned int oldest_index=0;

           for(int i=0;i<POOL_SIZE;i++) //make number of entries a DEFINE
           {
                   if(hit_pool[i].is_playing()==false)
                   {
           blank_found=true;
                   return i;
                   }
                   else
                   {
                           if(hit_pool[i].time_running>oldest_time)
                           {
                                   oldest_time=hit_pool[i].time_running;
                                   oldest_index=i;
                           }

                   }
           }

           //rt_printf("had to find oldest one at: index: %d
   time%d\n",oldest_index,oldest_time);
           //if we made it here, no free slots found, so lets take over the
   oldest one
           return oldest_index;


   }      	*/