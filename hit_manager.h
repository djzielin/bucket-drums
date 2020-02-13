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
	int counter=0;
	//float delay_tunings[8]={1117, 1187, 1277, 1361, 1423, 1489, 1559, 1619}; 
	
	simple_moving_average *sma;
	//hit hit_pool[POOL_SIZE];
	int state=STATE_WAITING;

public:
	hit *current_hit;
    float sma_multiplier=1.0f;	
    
    //parameters from midi controller
    float pitch_bend=0.5f;
    float gate_time=1.0f;    
	float hit_threshold=0.1f; 
	
    int retrig_max=0;
    int retrig_length=3000;
    float distortion_amount=1.0f;
    float volume=1.0f;
    
    unsigned int total_samples=0;
    float sample_rate;
    float current_sma=0;
    
  	hit_manager(float _sample_rate);
    void hit_happened();
	float tick(float input);

};