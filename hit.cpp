#include <Bela.h>
#include <sndfile.h>
#include <stdio.h>
#include <string.h>
#include <cmath>

#include "hit.h"
#include "hit_manager.h"
#include "distortion.h"

//TODO fix indenting

  
    
    hit::hit(hit_manager *hm)
    {
    	our_manager=hm;	
        samples_available=our_manager->max_samples_to_record*2;
        printf("  trying to allocate hit huffer: %d samples\n",samples_available);
        content=new float[(int)samples_available];
        if(content==NULL)
        {
        	printf("ERROR: couldn't create hit buffer!\n");
        }
        reset();
       
    }
    
   /* void hit::set_low_pass(float amount)
    {
    	low_pass_A=amount;
    	low_pass_B=1.0f-low_pass_A;
    }*/
    
   	void hit::reset()
	{
        play_index=0;
        rec_index=0;
        playing=false;
        samples_played=0;
        samples_available=0;
        total_played=0;

        //max_transient_sample=0.0f;
        stut_hits_occured=0;
        
        base_pitch=our_manager->base_pitch;
        stut_length=our_manager->stut_length;
        advance_amount=base_pitch;
	}
	
	bool hit::is_playing()
	{
	    return playing;
	}
	

	
	void hit::add_sample(float sample)
	{
		//float low_passed=low_pass_prev*low_pass_A+sample*low_pass_B;
		//low_pass_prev=low_passed;
		//content[rec_index]=low_passed;
		
		//for hit strength detection
		/*if(rec_index<500) //first 10ms (transient) TODO - don't have sample rate specific constants like this! Dangerous!
		{
			float sample_fabs=fabs(sample);
			if(sample_fabs>max_transient_sample)
			{
				max_transient_sample=sample_fabs;
			}
		}*/

		content[rec_index]=sample;
		rec_index++;
		playing=true;
		samples_available=rec_index;
	}
	
	float hit::calc_normal_sample()
	{
		
		//float env= env_precompute[samples_played];
		
		float index_floored=floor(play_index);
		float percent_current_sample=1.0f-(play_index-index_floored);
		float percent_next_sample=1.0f-percent_current_sample;
		
		int ind1=(int)index_floored;
		int ind2=ind1+1;
		
		float sample=(content[ind1]*percent_current_sample+content[ind2]*percent_next_sample); //TODO - do better then linear interpolation (ie cubic)
		
		play_index+=advance_amount;

        if(our_manager->pitch_bend!=0)
        {
		   float percent_complete=(float)samples_played/(float)our_manager->pitch_bend;
		   if(percent_complete>1.0f)
	       	 percent_complete=1.0f;
		
	       float expo=exp(-1.0f*percent_complete);
		   advance_amount=base_pitch*expo;
        }
        
	 	return sample;
	}
	

float hit::tick()
{
	float sample=0.0;
		
	if(playing==false) 
	   return 0.0f;
		
	
	if(our_manager->stut_max_count!=0.0f) //do stutters!!
	{
        if(samples_played>stut_length)
		{
			stut_hits_occured++;
			
		    base_pitch-=our_manager->stut_pitch_mod;
		    //stut_length-=our_manager->stut_length_mod;
		    play_index=0;
		   	samples_played=0;
		  
		    if(stut_hits_occured>our_manager->stut_max_count)
		    {
		        playing=false;
		        return 0.0f;
		    }
		}
	}

		  
		
	if(play_index>samples_available) //out of samples, ending playback
	{   
       playing=false;
	   return 0.0f;
	}    

	sample=calc_normal_sample();
	    
	sample=distortion_atan(sample*our_manager->boost_amount)*our_manager->volume;
		

		
    if(our_manager->gate_time!=-1) //do gating
	{
	   if(total_played>(our_manager->gate_time))  
	      sample=0;
	}
	
	samples_played++;
	total_played++;
		
	return sample; 
}
