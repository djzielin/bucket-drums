/***** wave_generator.h *****/
#ifndef DJZ_WAVE_GENERATOR
#define DJZ_WAVE_GENERATOR

#define TAU 6.283185307179586 //2*M_PI

class wave_generator //TODO support more waveforms (and also blend between square and sine)
{
public:
   wave_generator(float sample_rate_param);

   void set_pitch(float hz_param);
   void set_phase(float percent);
  
   void reset();
   float tick_sine(float scale);
   float tick_sine_fast(float scale);
   float tick_square(float scale);
   float tick_saw(float scale);
   
   float get_hz() {return hz; }

private:
   float sample_rate;
   float hz;
   float inc_amount;
   float t;
   float inc_precompute;

   void increment_wave(float scale);	
};

#endif