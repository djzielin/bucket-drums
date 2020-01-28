#include <Bela.h>
#include <sndfile.h>
#include <stdio.h>
#include <string.h>
#include <cmath>

#include "hit.h"
#include "one_channel.h"
#include "distortion.h"

//TODO fix indenting

    void hit::set_channel(one_channel *oc)
    {
        our_channel=oc;	
    }
    
    hit::hit()
    {
        samples_available=MAXIMUM_LENGTH;
        content=new float[(int)samples_available];
        //printf("initing single_hit\n");
        set_low_pass(0.0f);
        advance_amount=1.0f;
        reset();
        
        for(int i=0;i<3000;i++)
		{
		   if(i<1000)
		     env_precompute[i]=1.0f;
		  else if(i<5000)  
		     env_precompute[i]=1.0f-((float)i-1000.0f)/4000.0f;
    	  else
    		  env_precompute[i]=0.0f;
		}
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
		advance_amount=adv;
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
		
		float sample=(content[ind1]*percent_current_sample+content[ind2]*percent_next_sample);
		
        /*float sample=content[(int)play_index]; //no interpolation
		play_index+=0.5f;
		
		if(play_index2<samples_available )
		{
		  sample+=content[(int)play_index2];
		  play_index2+=0.77777;
		}*/
		play_index+=advance_amount;

		float percent_complete=samples_played/5000.0f;
		if(percent_complete>1.0f)
		percent_complete=1.0f;
		
		float expo=exp(-1.0f*percent_complete);
		advance_amount=base_pitch*expo;
		
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
		

		
		/*
		
		if(our_channel->retrig_max > 0) //TODO - store these in a retrig buffer
		{
			if(retrig_count==0)
			{
				sample=calc_normal_sample();
				sample=distortion_clamp(sample*our_channel->distortion_amount)*our_channel->volume;
				retrig_buffer[samples_played]=sample; //store for later
				samples_played++;
			}
			else
			{
			    sample=retrig_buffer[samples_played]; //look up from buffer
			    samples_played++;

			} 
			   
			if(retrig_count>our_channel->retrig_max)
			{
				playing=false;
		        return 0.0f;
			}
			if(samples_played>(our_channel->retrig_length))
			{
				retrig_count++;
				samples_played=0;
				play_index=0;
				
			}
		}
		*/
		///else //regular render
		{
			sample=calc_normal_sample();
			//sample=distortion_clamp(sample*our_channel->distortion_amount)*our_channel->volume;
			samples_played++;
			
		}
		
		return sample; 
	}
