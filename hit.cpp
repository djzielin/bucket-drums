#include <Bela.h>
#include <sndfile.h>
#include <stdio.h>
#include <string.h>
#include <cmath>

#include "hit.h"
#include "hit_manager.h"
#include "distortion.h"

//TODO fix indenting

    void hit::set_manager(hit_manager *oc)
    {
        our_manager=oc;	
    }
    
    hit::hit()
    {
        samples_available=MAXIMUM_LENGTH;
        content=new float[(int)samples_available];
        //printf("initing single_hit\n");
        set_low_pass(0.0f);
        advance_amount=1.0f;
        reset();
       
    }
    
    void hit::recording_done()
    {
        samples_available=rec_index;
        //samples_to_play=samples_available/advance_amount;
    }
    
    void hit::set_low_pass(float amount)
    {
    	low_pass_A=amount;
    	low_pass_B=1.0f-low_pass_A;
    }
    
   	void hit::reset()
	{
		low_pass_prev=0.0;
        play_index=0;
        rec_index=0;
        playing=false;
        samples_played=0;
        samples_available=2500;
        time_running=0;
        retrig_count=0;
        max_transient_sample=0.0f;
        delay_hits_occured=0;
        base_pitch=0.7f;
	}
	
	bool hit::is_playing()
	{
	    return playing;
	}
	
	void hit::set_advance_amount(float adv)
	{
		advance_amount=base_pitch;
	}
	
	void hit::add_sample(float sample)
	{
		//float low_passed=low_pass_prev*low_pass_A+sample*low_pass_B;
		//low_pass_prev=low_passed;
		//content[rec_index]=low_passed;
		
		if(rec_index<500) //first 10ms (transient) TODO - don't have sample rate specific constants like this! Dangerous!
		{
			float sample_fabs=fabs(sample);
			if(sample_fabs>max_transient_sample)
			{
				max_transient_sample=sample_fabs;
			}
		}

		content[rec_index]=sample;
		rec_index++;
		playing=true;
		
		//TODO bounds checking, to make sure we don't go over...
		
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
		
        /*float sample=content[(int)play_index]; //no interpolation
		play_index+=0.5f;
		
		if(play_index2<samples_available )
		{
		  sample+=content[(int)play_index2];
		  play_index2+=0.77777;
		}*/
		play_index+=advance_amount;

        if(our_manager->pitch_bend!=0.0f)
        {
           float inv_p=1.0f-our_manager->pitch_bend; //todo: cache - only recompute on parameter change
           inv_p=inv_p*0.5f;
           
		   float percent_complete=samples_played/(inv_p*20000.0f); //TODO - dont have in terms of samples!!
		   if(percent_complete>1.0f)
	       	percent_complete=1.0f;
		
	       float expo=exp(-1.0f*percent_complete);
		   advance_amount=base_pitch*expo;
        }
        
	 	return sample;
		
		
	}
	
    bool hit::is_positive(float a)
	{
	   if(a>0)
	      return true;
	   else
	   	  return false;
	}
	
	float hit::tick()
	{
		
		time_running++;

		
		float sample=0.0;
		
		if(playing==false) 
			return 0.0f;
		
	
		   if(delay_hits_occured<delay_hits_max)
		   {
		      if(time_running%delay_hits_spacing==0)
		      {
		      	  base_pitch-=0.05f;
		   	      play_index=0;
		   	      samples_played=0;
		   	      delay_hits_occured++;
		      }
		   }
		
		if(play_index>=samples_available )
		{   
			if(delay_hits_occured>delay_hits_max)
			   playing=false;
		 	return 0.0f;
		}    
		

	    sample=calc_normal_sample();
	    
		//sample=distortion_clamp(sample*our_channel->distortion_amount)*our_channel->volume;
		samples_played++;
		
		if(our_manager->gate_time<1.0f)     //DO GATING
		   if(samples_played>(our_manager->gate_time*20000)) //TODO - dont do in terms of samples! 
		      sample=0;
		
		return sample; 
	}
