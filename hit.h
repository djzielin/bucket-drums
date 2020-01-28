#ifndef HIT_DJZ_H
#define HIT_DJZ_H


class one_channel;

class hit
{
private:

	bool playing=false;
	float env_precompute[15000];
	float low_pass_A;
	float low_pass_B;
	float low_pass_prev;
	
	  float release_slope=112;
     float release_intercept=28;
	
	one_channel *our_channel;
	
	float *content;
	float samples_available;
	float play_index;
	//float play_index2;
	
	int rec_index;
	int samples_played;
	float max_transient_sample;
	
	float prev_sample;
	
	//int samples_to_play;
	//int output;
	
    int transient_detection_time_samples;
	int retrig_count=0;
	float retrig_buffer[20000];
	/*int extend_max=10;
	int extend_count;
	
    
    int extend_index;
    int extend_length;
    int sign_changes_found=0;
    */
    const float atan_scaler=2.0/M_PI;
    
public:
     float advance_amount;

	void set_release_parameters(float transient_detection_time, float slope, float intercept);
    void set_channel(one_channel *oc);
  
    hit();
    void recording_done();
    void set_low_pass(float amount);
   	void reset();
	bool is_playing();
	void set_advance_amount(float adv);
	void add_sample(float sample);
	float calc_normal_sample();
    bool is_positive(float a);
	float tick();
	unsigned int time_running;
};

#endif