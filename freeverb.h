/***** reverb.h *****/

#ifndef DJZ_FREEVERB_H

#include "allpass_filter.h"
#include "feedback_comb_filter.h"

//reimplimentation of freeverb algorithm 
class freeverb
{
private:
   float sampleRate;

   float delay_times[8]={1116.0f/44100.0f,
                         1188.0f/44100.0f,
                         1277.0f/44100.0f,
                         1356.0f/44100.0f,
                         1422.0f/44100.0f,
                         1491.0f/44100.0f, 
                         1557.0f/44100.0f,
                         1617.0f/44100.0f};
                      
   float allpass_times[4]={225.0f/44100.0f,
                           556.0f/44100.0f,
                           441.0f/44100.0f,
                           341.0f/44100.0f};

   feedback_comb_filter *fbcf[8];
   allpass_filter *apf[4];
   bool is_holding=false;
   
   float old_feedback;
   float old_lowpass;
   
   float current_feedback;
   float current_lowpass;

public:
   void set_delay_times(float factor);
   void set_feedback(float val);
   void set_lowpass(float val);
   void set_hold(bool val);
   void clear_memory();
   
   freeverb(float sample_rate);
   float tick(float in);
};

#endif