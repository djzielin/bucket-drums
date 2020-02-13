#ifndef HIT_DJZ_H
#define HIT_DJZ_H


class hit_manager;

class hit
{
private:

	bool playing=false;
	float env_precompute[15000];
	float low_pass_A;
	float low_pass_B;
	float low_pass_prev;
	

	
	hit_manager *our_manager;
	
	float *content;
	float samples_available;
	float play_index;
	//float play_index2;
	
	int rec_index;
	int samples_played;
	float max_transient_sample;
	
	float prev_sample;
	
	int delay_hits_max=0;
	int delay_hits_occured=0;
	int delay_hits_spacing=1000; 
	
    int transient_detection_time_samples;
	int retrig_count=0;
	float retrig_buffer[20000];
    float base_pitch=0.5f;
    const float atan_scaler=2.0/M_PI;
    
public:
     float advance_amount;

    void set_manager(hit_manager *oc);
  
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