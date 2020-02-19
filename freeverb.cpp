/***** reverb.cpp *****/
#include <Bela.h>
#include "freeverb.h"

void freeverb::set_hold(bool val)
{
	
	if(is_holding==false && val==true) //false to true
	{
		old_feedback=current_feedback;
		set_feedback(1.0f);
		
		old_lowpass=current_lowpass;
		set_lowpass(1.0f);
	}
	else if(is_holding==true && val==false) //true to false
	{
		set_feedback(old_feedback); //restore value
		set_lowpass(old_lowpass);
	}
	
	is_holding=val;
	
}

void freeverb::set_delay_times(float factor)
{
	rt_printf("setting reverb delay lines to factor: %f\n",factor);
	
	for(int i=0;i<8;i++)
	{
      fbcf[i]->set_delay_time(delay_times[i]*factor);
	}
}

void freeverb::set_feedback(float val)
{
	rt_printf("setting reverb feedback to: %f\n",val);
	
	for(int i=0;i<8;i++)
	{
      fbcf[i]->set_feedback(val);
	}
	
	current_feedback=val;
}

void freeverb::set_lowpass(float val)
{
	rt_printf("setting reverb lowpass to: %f\n",val);
	
	for(int i=0;i<8;i++)
	{
      fbcf[i]->set_lowpass(val);
	}
	
	current_lowpass=val;
}


freeverb::freeverb(float sample_rate)
{
	sampleRate=sample_rate;
	
	for(int i=0;i<8;i++)
	{
       fbcf[i]=new feedback_comb_filter(sampleRate, 1.0f);
	}
	
	set_delay_times(1.0f);
	set_feedback(0.84f);
   
	for(int i=0;i<4;i++)
	{
		apf[i]=new allpass_filter(sampleRate,1.0f);
	    apf[i]->set_delay_time(allpass_times[i]);
	    apf[i]->set_feedback(0.5f);
	}	
}

float freeverb::tick(float in)
{
	 float out=0.0f;
	 
	 if(is_holding)
	    in=0.0f;
	
	 for(int i=0;i<8;i++) //PROCESS PARRALLELFEEDBACK COMB FILTERS
	    out+=fbcf[i]->tick(in)*0.1f;
	    
	 for(int i=0;i<4;i++) //PROCESS ALL PASS FILTERS
	    out=apf[i]->tick(out);
	    
	 return out;
	    
}

