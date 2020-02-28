#ifndef HIT_DJZ_H
#define HIT_DJZ_H


class hit_manager;

class hit
{
private:

	bool playing=false;

	//float low_pass_A;
	//float low_pass_B;
	//float low_pass_prev;
	
	hit_manager *our_manager;
	
	float *content;
	int samples_available;

    float *rendered_samples;
    int rendered_sample_count;

	int rec_index;
	int samples_played;
	int stut_length;
	
	int stut_hits_occured=0;
	
    float play_index;
    
    float base_pitch;
    	
    float calc_normal_sample();
    bool  handle_stuts();

public:
    float advance_amount; //advance play head at different rates to achieve pitch bends (need to make public so scope can get access)
	int total_played;

    hit(hit_manager *hm);
    void recording_done();
    //void set_low_pass(float amount);
   	void reset();
	bool is_playing();
	
	void add_sample(float sample);
    bool is_positive(float a);
	float tick();
	
	//unsigned int time_running;
};

#endif