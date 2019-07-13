/***** sine_generator.cpp *****/
#include <math.h>
#include <stdio.h>
#include "wave_generator.h"
# include <math_neon.h>

const float tau_precompute=2.0f/TAU;

wave_generator::wave_generator(float sample_rate_param)
{
   sample_rate=sample_rate_param;
   inc_precompute=TAU/sample_rate;
   reset();
   set_pitch(440.0f);
}

void wave_generator::reset()
{
   t=0.0f;
}

void wave_generator::set_pitch(float hz_param)
{
   hz=hz_param;
 
   inc_amount=inc_precompute*hz; //TAU*1.0f/samplerate*hz
   //printf("inc amount: %f\n",inc_amount);
   while(t>TAU) t-=TAU;

}

void wave_generator::set_phase(float percent)
{
   t+=TAU*percent;
   while(t>TAU) t-=TAU;
}

void wave_generator::increment_wave(float scale)
{
   t+=inc_amount*scale;  
   while(t>TAU) t-=TAU;
}

float wave_generator::tick_sine(float scale)
{
   float val= sin(t);
   
   increment_wave(scale);
   return val; 
}

float wave_generator::tick_sine_fast(float scale)
{
   float val= sinf_neon(t);
   
   increment_wave(scale);
   return val; 
}

//TODO sine fast

float wave_generator::tick_square(float scale)
{
	float val;
	
   	if(t<M_PI) val=1.0f;
    else       val=-1.0f;

	increment_wave(scale);
	return val;   
}

float wave_generator::tick_saw(float scale)
{
	float val=t*tau_precompute-1.0f;
  
  	increment_wave(scale);
	return val;   
}