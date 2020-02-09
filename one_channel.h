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
	//hit hit_pool[POOL_SIZE];
	int state=STATE_WAITING;

 
   
    //wave_generator *our_tremolo_wave;
    
    //comb_filter our_comb;
    //chorus *our_chorus;
    
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

		//rt_printf("had to find oldest one at: index: %d time%d\n",oldest_index,oldest_time);		
		//if we made it here, no free slots found, so lets take over the oldest one
		return oldest_index;
         

	}      	*/ 

	

public:
	hit *current_hit;
    float sma_multiplier=1.0f;	
    
    //parameters from midi controller
    float pitch_bend=0.5f;
    float gate_time=1.0f;    
	float hit_threshold=0.1f; 
	
    int retrig_max=0;
    int retrig_length=3000;
    float distortion_amount=1.0f;
    float volume=1.0f;
    
    unsigned int total_samples=0;
    float sample_rate;
    float current_sma=0;

    
  	one_channel(float _sample_rate)
	{
		sma=new simple_moving_average(2000);
        sample_rate=_sample_rate;
        current_hit=new hit();
	}

    void hit_happened()
    {
    	rt_printf("hit happened!\n");
    	state=STATE_HIT;
		counter=0;
		current_hit->reset();
		current_hit->set_channel(this);
		current_hit->set_advance_amount(0.5f); //pitch shift amount here
    }

	float tick(float input)
	{
		current_sma=sma->tick(fabs(input)*sma_multiplier); //question: power or fabs of input?
		//current_sma=sma->tick(fabs(input*input)*5.0f); //question: power or fabs of input?
		
		if(state==STATE_WAITING )
		{
			if(fabs(input)>(current_sma+hit_threshold))
		    {
		    	hit_happened();
		    }
		}
      
		if(state==STATE_HIT)
		{
			if(counter>=10000)
      	 	{	
      	 		current_hit->add_sample(input);
      	 		state=STATE_WAITING;
      		  	current_hit->recording_done();
      	 	}
      	 	else if(counter>=1500) //wait for transient to go away to allow next hit. TODO: do this in terms of time not samples!!
      	 	{
      	 		if(fabs(input)>(current_sma+hit_threshold))
      	 		{
      	 			hit_happened();
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
		
	
        float  out=current_hit->tick(); 
       

         return out;
	}
};