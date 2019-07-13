/***** one_channel.h *****/
#define MAXIMUM_LENGTH 44100
#define STATE_WAITING  0
#define STATE_HIT      1

#include "hit.h"
#include "simple_moving_average.h"
#include "wave_generator.h"
#include "chorus.h"
 

 
#define POOL_SIZE 7

class one_channel
{
	
	
private:
	int counter=0;
	float delay_tunings[8]={1117, 1187, 1277, 1361, 1423, 1489, 1559, 1619}; 
	
	simple_moving_average *sma;
	hit hit_pool[POOL_SIZE];
	int state=STATE_WAITING;
	hit *current_hit;
    wave_generator *our_tremolo_wave;
    
    //comb_filter our_comb;
    chorus *our_chorus;
    
    //TODO or look for oldest hit
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

		//rt_printf("had to find oldest one at: index: %d time%d\n",oldest_index,oldest_time);		
		//if we made it here, no free slots found, so lets take over the oldest one
		return oldest_index;
         

	}      	 

	

public:
    //parameters from midi controller
	float hit_threshold=0.1f; 
    
    int env_time=5000; //TODO
    bool env_do_gate=false;
    bool env_do_exponential=false;
    
    int retrig_max=0;
    int retrig_length=3000;
    float distortion_amount=1.0f;
    float volume=1.0f;
    unsigned int total_samples=0;
    float sample_rate;

    
    void set_tremolo_speed(float hz)
    {
       our_tremolo_wave->set_pitch(hz);
    }
    
	one_channel(float _sample_rate)
	{
		sma=new simple_moving_average(5);
        sample_rate=_sample_rate;
	    our_tremolo_wave=new wave_generator(sample_rate);
	    our_tremolo_wave->set_pitch(440);
	    
	   
	       our_chorus=new chorus(sample_rate);
	       our_chorus->set_delay_length(delay_tunings[7]);
	       our_chorus->set_lfo_hz(1000);

	    //printf("Done initing channel\n");
	}


	float tick(float input)
	{
		if(state==STATE_WAITING )
		{
			float pow_sample=input*input;

			//TODO sma tick here
			float current_avg=sma->tick(pow_sample);
			
			if(current_avg>hit_threshold)
		    {
				state=STATE_HIT;
				counter=0;
       
				int free_slot=find_free_slot();
				//int free_slot=0; //make monophonic
				current_hit=&hit_pool[free_slot];
				current_hit->reset();
				//current_hit->set_low_pass(0.0f);
				current_hit->set_channel(this);
				current_hit->set_advance_amount(0.5f); //pitch shift amount here
				
				//rt_printf("HIT! at time: %d\n",total_samples);
		    }
		}
      
		if(state==STATE_HIT)
		{
			current_hit->add_sample(input);

			if(counter>=2500) 
      	 	{	
      	 		state=STATE_WAITING;
      		  	current_hit->recording_done();
          		//rt_printf("  Counter expired, returning to STATE_WAITING\n");
          		
          	    //reset sma
      	 	}
      	 	
      	 	counter++;
		}   
        
         float out=0.0f;
         for(int i=0;i<POOL_SIZE;i++) 
         {
               out+=hit_pool[i].tick();
         }
         
         total_samples++;
         
         //out+=our_chorus->tick(out);
         if(our_tremolo_wave->get_hz()>0.0f)
           out=out*our_tremolo_wave->tick_square(1.0); //*2.0f-1.0f;
         return out;
	}
};