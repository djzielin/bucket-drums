/***** feedback_comb_filter.h *****/
#ifndef DJZ_FEEDBACK_COMB_FILTER
#define DJZ_FEEDBACK_COMB_FILTER

class feedback_comb_filter
{
public:
   feedback_comb_filter(float sample_rate, float max_delay_seconds);

   void set_delay_time(float dt);
   void set_delay_samples(int delay_samples);
   void set_feedback(float f);
   void set_lowpass(float val);
   void clear_memory();
   
   float tick(float input);
   

private:
   unsigned int _delay_line_max;
   float *_delay_line;

   float _sample_rate;
   int   _current_delay;
   float _feedback;
   float effectMix;
   int _read_pos;
   int _write_pos;
   int _clear_countdown;
    float lowpassA, lowpassB, prev_val;
};


#endif