#include <Bela.h>
#include <sndfile.h>
#include <stdio.h>
#include <string.h>
#include <cmath>
#include <Midi.h>
#include "distortion.h"
#include <Scope.h>
#include "tapped_delay_line.h"
unsigned int sample_rate;


#include "one_channel.h"
one_channel *snare_channel;
one_channel *kick_channel;
Scope scope;

Midi midi;
const char* gMidiPort0 = "hw:1,0,0";

/*	float hit_threshold=0.1f;          //14   18
    int env_time=5000;                 //2    6
    
    bool env_do_gate=false;            //33  37
    bool env_do_exponential=false;     //23  27
    
    int retrig_count=0;                //15  19
    int retrig_length=3000;            //3    7
    
    float distortion_amount=1.0f;      //16   20
    float volume=1.0f;                 //4    8
*/


float calc_cycle_length(int midi_note)
{
	float hz=(440.0f*pow(2.0f,((float)midi_note-69.0f)/12.0f));
    return 44100.0f/hz;  	
}

void cc_write(midi_byte_t cc,  midi_byte_t val)
{
    midi_byte_t bytes[3] = {0xB0, cc, val}; 
    midi.writeOutput(bytes, 3);
    midi.writeTo(gMidiPort0);
}

void midiMessageCallback(MidiChannelMessage message, void* arg)
{
	if(message.getType() == kmmControlChange)
	{
		int cc=	 message.getDataByte(0);
		int val= message.getDataByte(1);
		float float_val=(float)val/127.0f;
		
		//rt_printf("cc message received: %d %d\n",cc,val);
		
		switch (cc)
		{
			case 14:
        		snare_channel->hit_threshold=float_val; //TODO - don't need whole range
        		break;
        	case 18:
        		kick_channel->hit_threshold=float_val;
        		break;
    		case 2:
				//snare_channel->env_time=val*150;
				break;
    		case 6:
				//kick_channel->env_time=val*150;
				break;	 
			case 15:
				snare_channel->retrig_max=(int)(float_val*20.0f);
				break;	
			case 19:
				kick_channel->retrig_max=(int)(float_val*20.0f);
				break;		
			case 3:
				snare_channel->retrig_length=500+val*20;
				rt_printf("snare retrig length: %d\n",snare_channel->retrig_length);
				break;		
			case 8:
				kick_channel->retrig_length=500+val*20;
				rt_printf("kick retrig length: %d\n",kick_channel->retrig_length);
				break;			
			case 16:
				snare_channel->distortion_amount=1.0f+float_val*100;
				break;		
			case 20:
				kick_channel->distortion_amount=1.0f+float_val*100;
				break;			
			case 4:
				snare_channel->volume=float_val;
				break;		
			case 9:
				kick_channel->volume=float_val;
				break;		
			case 28:
				if(val==127)
				   kick_channel->retrig_length=calc_cycle_length(26); //D
				break;
			case 38:
				if(val==127)
				   kick_channel->retrig_length=calc_cycle_length(31); //G
				break;
			case 29:
				if(val==127)
				   kick_channel->retrig_length=calc_cycle_length(34); //Bb
				break;
			case 39:
				if(val==127)
				   kick_channel->retrig_length=calc_cycle_length(27); //Eb
				break;
			case 30:
				if(val==127)
				   kick_channel->retrig_length=calc_cycle_length(29); //F
				break;
			case 40:
				if(val==127)
				   kick_channel->retrig_length=calc_cycle_length(24); //C
				break;	
				
			case 24:
				if(val==127)
				   snare_channel->retrig_length=calc_cycle_length(35); //B
				break;
			case 34:
				if(val==127)
				   snare_channel->retrig_length=calc_cycle_length(41); //F
				break;
			
			case 25:
				if(val==127)
				   snare_channel->retrig_length=calc_cycle_length(23); //B
				break;
			case 35:
				if(val==127)
				   snare_channel->retrig_length=calc_cycle_length(29); //F
				break;
				/*
			case 26:
				if(val==127)
				   snare_channel.retrig_length=calc_cycle_length(29); //F
				break;
			case 36:
				if(val==127)
				   snare_channel.retrig_length=calc_cycle_length(24); //C
				break;	*/
				
			default:
			 	break;
		}   
     
	}
}


tapped_delay_line *td1;

bool setup(BelaContext *context, void *userData)
{
	midi.readFrom(gMidiPort0);
	midi.writeTo(gMidiPort0);
	midi.enableParser(true);
	midi.setParserCallback(midiMessageCallback, (void*) gMidiPort0);
	
	sample_rate=context->analogSampleRate;
	
	printf("about to setup snare channel...\n");
	snare_channel=new one_channel(sample_rate);
    snare_channel->sma_multiplier=1.0f;

    
    printf("about to setup kick channel...\n");
    kick_channel=new one_channel(sample_rate);
    kick_channel->sma_multiplier=2.0f;

    /*td1=new tapped_delay_line(sample_rate,1.0f,100);
	
	for(int i=0;i<100;i++)
	{
		float tap_time=(float)rand()/(float)RAND_MAX*0.100f; //0ms to 100ms;
		td1->set_tap_time(tap_time,i);
	}*/
	
    scope.setup(3, context->audioSampleRate);

	return true;
}    

bool skip_first_samples=false;
unsigned int skip_count=0;

void render(BelaContext *context, void *userData)
{

	for(unsigned int n = 0; n < context->audioFrames; n++) 
	{   
		float snare_sample=distortion_clamp(audioRead(context, n, 1)); //keep within -1 to 1
		float kick_sample= distortion_clamp(audioRead(context, n, 0)); //keep within -1 to 1
		
		float snare_out = snare_channel->tick(snare_sample);
		float kick_out  = kick_channel->tick(kick_sample);
		
		//float raw_snare=snare_out;
		//snare_out=td1->tick(raw_snare)*0.1f+raw_snare*0.75;
		
        audioWrite(context,n,1,distortion_atan(snare_out*2.0f)); //keep within -1 to 1
        audioWrite(context,n,0,distortion_atan(kick_out*2.0f )); //keep within -1 to 1
        
        scope.log(fabs(snare_sample), snare_channel->current_sma, snare_channel->current_hit->advance_amount );

   }
   
}

void cleanup(BelaContext *context, void *userData)
{
}

