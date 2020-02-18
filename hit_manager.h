/***** one_channel.h *****/
#define MAXIMUM_LENGTH 44100
#define STATE_WAITING  0
#define STATE_HIT      1

#include "hit.h"
#include "simple_moving_average.h"

#define POOL_SIZE 7

class hit_manager
{
	
	
private:
    float base_pitch=0.7f; //currently not exposed as parameter
    int max_samples_to_record;
    int max_transient_samples;
    
	int counter=0;
	//hit hit_pool[POOL_SIZE]; //TODO: use when we bring back polyphony
	
	simple_moving_average *sma;

	int state=STATE_WAITING;

   //parameters from midi controller
    float pitch_bend=0;
	float hit_threshold=0.1f; 
	
	float gate_time=1.0f;  
	float boost_amount=1.0f;
    float volume=1.0f;

    int stut_length=3000;
    int stut_max_count=0;
    float stut_pitch_mod=0.0;
    float stut_length_mod=0.0;
    bool is_stut_pmod_up=false;
    bool is_stut_lmod_up=false;
   
    int delay_count;
    int delay_length;
    float delay_pitch_mod;
    float delay_smod;
    
    float map_to_range(float input, float min, float max);
    
public:
	hit *current_hit;
    float sma_multiplier=1.0f;	
    
    void set_pitch_bend(float knob);
    void set_hit_threshold(float knob);
    void set_gate_time(float knob);
    void set_boost(float knob);
    
    void set_stut_length(float knob);
    void set_stut_max_count(float knob);
    void set_stut_pitch_mod(float knob);
    void set_stut_length_mod(float knob);
    
    void set_delay_length(float knob);
    void set_delay_count(float knob);
    void set_delay_pmod(float knob);
    void set_delay_smod(float knob);
    void set_stut_lmod_up_button(bool value);
    void set_stut_pmod_up_button(bool value);

  
    
    
    unsigned int total_samples=0;
    float sample_rate;
    float current_sma=0;
    
  	hit_manager(float _sample_rate);
    void hit_happened();
	float tick(float input);
	
	friend class hit;

};