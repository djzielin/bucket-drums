/***** chorus.h *****/
#include "comb_filter.h"

class chorus
{
private:
   comb_filter *cf;
   wave_generator *wg;
   float sample_rate;
   
public:   
   chorus(float _sample_rate)
   {
   	  sample_rate=_sample_rate;
   	  cf=new comb_filter();
   	  wg=new wave_generator(sample_rate);
   }
   
   void set_delay_length(int val)
   {
      cf->length=val;	
   }
   
   void set_lfo_hz(float val)
   {
   	  wg->set_pitch(val);
   }
   
   float tick(float in)
   {
   	  float out=cf->tick(in);
   	  cf->read_inc=wg->tick_sine_fast(1.0f) + 1.0f; //0 to 2 (lfo depth)
   	  return out; 
   }
};