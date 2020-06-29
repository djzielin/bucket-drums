#include <Bela.h>
#include <libraries/sndfile/sndfile.h>
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
        rendered_samples=new float[(int)(2*our_manager->sample_rate)]; //TODO: be more careful about this
        
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
        playing=true;
        samples_played=0;
        samples_available=0;
        total_played=0;
        
        requested_delay_clear=false;
        
        foundZeroCrossing=false;
        zeroCrossing=0;

        //max_transient_sample=0.0f;
        stut_hits_occured=0;
        
        base_pitch=our_manager->base_pitch;
        stut_length=our_manager->stut_length;
        advance_amount=base_pitch;
        
        rendered_speed=1.0f;
        delay_hits_occured=0;
	}
	
	bool hit::is_playing()
	{
	    return playing;
	}
	
	void hit::add_sample(float sample)
	{
		if(playing==false)
		   return;
		   
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
		
		if(rec_index==0)
		{
		   if(sample>0.0f)
		      initialPositive=true;
		   else
			  initialPositive=false;
			  
		   rt_printf("initialPositive is: %d\n", initialPositive);
		}
		
		if(foundZeroCrossing==false && rec_index>0)
		{
		   	bool currentPositive;
		   	if(sample>0.0f)
		   	   currentPositive=true;
		   	else
		   	   currentPositive=false;
		   	   
		   	
		   	if(initialPositive!=currentPositive)
		   	{
		   		rt_printf("saw first zero crossing at: %d\n",rec_index);
		   		foundZeroCrossing=true;
		   		if(rec_index<20)
		   		{
		   			rt_printf("RIM\n");
		   		}
		   		else
		   		{
		   			rt_printf("HEAD\n");
		   		}
		   	}
		}

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
	       float expo=exp(-1.0f*percent_complete);

           if(our_manager->bend_up==false)
		      advance_amount=base_pitch*expo;
		   else
		      advance_amount=1.0f-expo+(base_pitch-0.5f);
		      
		   if(advance_amount<our_manager->lowest_pitch)
		      advance_amount=our_manager->lowest_pitch;
		   if(advance_amount>1.0)
		      advance_amount=1.0;
        }
        
	 	return sample;
	}
	
bool hit::handle_stuts()
{

        if(samples_played>stut_length)
		{
			stut_hits_occured++;
			
			if(our_manager->is_stut_pmod_up) base_pitch+=our_manager->stut_pitch_mod;
		    else                             base_pitch-=our_manager->stut_pitch_mod;
		       
		    advance_amount=base_pitch;
		       
		    if(our_manager->is_stut_lmod_up) stut_length=stut_length*=our_manager->stut_length_mod;   //1 to 0
		    else                             stut_length=stut_length*=((1.0f-our_manager->stut_length_mod)+1.0f); //1.0 to 2.0
		    
		    
		    int sp=samples_played;
		    play_index=0; //go back to beginning of sample
		   	samples_played=0;
		  
		    if(stut_hits_occured>our_manager->stut_max_count)
		    {
		    	rt_printf("setting playing=false. stuts_played: %d out of max: %d done playing at sample: %d. stut length: %d\n",stut_hits_occured,our_manager->stut_max_count,total_played,stut_length);
		        return false;
		    }
		    else
		    {
		    	//rt_printf("stuts played: %d\n",stut_hits_occured);
		    }
		}
   return true;
}

void hit::end_playback()
{
	playing=false;
}

float hit::tick()
{
	float sample=0.0;
	
	if(our_manager->final_gate_time!=-1) //do gating
    {
	     if(total_played>(our_manager->final_gate_time))  
	      {
	   	    	end_playback();
	   	    	
	   	    	if(requested_delay_clear==false){ //make sure we only do this once
	   	    	   our_manager->hit_completed();
	   	    	   requested_delay_clear=true;
	   	    	}
	   	    

	      }
	}
	    
		
	if(playing==false){
		total_played++; //to make final gating (above) work properly	 
	   return 0.0f;
	}
	   
	if(delay_hits_occured==0)
	{
		
		 if(our_manager->stut_max_count!=0.0f)
    		  if(handle_stuts()==false) //done with stuts
    		  {
    	         sample=0.0;
    	         if(our_manager->delay_count==0) //no delay_count 
    	         {
    	         	rt_printf("stuts are done, so end playback");
    	         	playing=false;
    	            return sample;
    	         }
    		  }
		if(play_index>samples_available) //out of samples, ending playback
		{   
     	   rt_printf("done playing at sample: %d\n",samples_played);
           sample=0;
       
          if(our_manager->stut_max_count==0.0f && our_manager->delay_count==0) //if we aren't doing stuts or delay this is the end of the li
          {
          	rt_printf("  we have no stuts or delays, so stopping playback here\n");
          	end_playback();
          }
	    }    
        else
          sample=calc_normal_sample();
	    
	   sample=distortion_clamp(sample*our_manager->boost_amount)*our_manager->volume;
		
       if(our_manager->gate_time!=-1) //do gating
     	{
	      if(samples_played>(our_manager->gate_time))  
	      {
	   	    sample=0.0f;
	      }
	    }
	

	   rendered_samples[total_played]=sample; //store for later
	   rendered_sample_count=total_played;
	   
	  samples_played++;
	  
	}
	
	if(our_manager->delay_count>0)
	{
		if(delay_hits_occured>0)
		{
			sample=rendered_samples[(int)play_index]; //TODO: do interpolation
			play_index+=rendered_speed;
		}
		
		if((total_played % our_manager->delay_length==0) && total_played!=0)
		{
		   delay_hits_occured++;
		   rt_printf("moving on to delay hit: %d\n",delay_hits_occured);
		   play_index=0; //reset to begining of rendered sample
		   rendered_speed-=our_manager->delay_pitch_mod; //drop pitch of successive delay_hits_occured
		   
		   if(delay_hits_occured>our_manager->delay_count)
		   {
		   	rt_printf("out of delays. ending playback\n");
		   	 end_playback();
		   }
		}
	}

	
	
	total_played++;
		
	return sample; 
}
