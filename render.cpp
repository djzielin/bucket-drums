#include <Bela.h>
#include <sndfile.h>
#include <stdio.h>
#include <string.h>
#include <cmath>
#include <Midi.h>
#include <Scope.h>

#include "distortion.h"
#include "tapped_delay_line.h"

unsigned int sample_rate;


#include "hit_manager.h"
hit_manager *snare_channel;
hit_manager *kick_channel;
Scope scope;

Midi midi;
const char* gMidiPort0 = "hw:1,0,0";

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
			case 1:
			    rt_printf("cc%d: pitch bend1 - %.02f\n",cc,float_val);
        		snare_channel->pitch_bend=float_val; 
        		break;
        	case 2:
        		rt_printf("cc%d: pitch bend2 - %.02f\n",cc,float_val);
        		kick_channel->pitch_bend=float_val; 
        		break;
    		case 3:
				rt_printf("cc%d: gate time - %.02f\n",cc,float_val);
				snare_channel->gate_time=float_val; 
        		kick_channel->gate_time=float_val; 
				break;
    		case 4:
				//kick_channel->env_time=val*150;
				break;	 
			case 5:
				//snare_channel->retrig_max=(int)(float_val*20.0f);
				break;	
			case 6:
				//kick_channel->retrig_max=(int)(float_val*20.0f);
				break;		
			case 7:
				//snare_channel->retrig_length=500+val*20;
				//rt_printf("snare retrig length: %d\n",snare_channel->retrig_length);
				break;		
			case 8:
				//kick_channel->retrig_length=500+val*20;
				//rt_printf("kick retrig length: %d\n",kick_channel->retrig_length);
				break;			
			case 9:
				//snare_channel->distortion_amount=1.0f+float_val*100;
				break;		
			case 11:
			    //snare_channel->hit_threshold=float_val; 
				//kick_channel->distortion_amount=1.0f+float_val*100;
				break;			
			case 12:
				break;		
			case 13:
				break;		
			case 15:
				//if(val==127)
				//   kick_channel->retrig_length=calc_cycle_length(26); //D
				break;
			case 16:
				//if(val==127)
				//   kick_channel->retrig_length=calc_cycle_length(31); //G
				break;
			case 17:
				//if(val==127)
				//   kick_channel->retrig_length=calc_cycle_length(34); //Bb
				break;
			case 18:
				//if(val==127)
				//   kick_channel->retrig_length=calc_cycle_length(27); //Eb
				break;
			case 19:
				//if(val==127)
				//   kick_channel->retrig_length=calc_cycle_length(29); //F
				break;

				
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
	snare_channel=new hit_manager(sample_rate);
    snare_channel->sma_multiplier=1.0f;

    
    printf("about to setup kick channel...\n");
    kick_channel=new hit_manager(sample_rate);
    kick_channel->sma_multiplier=2.0f;

    /*td1=new tapped_delay_line(sample_rate,1.0f,100);
	
	for(int i=0;i<100;i++)
	{
		float tap_time=(float)rand()/(float)RAND_MAX*0.100f; //0ms to 100ms;
		td1->set_tap_time(tap_time,i);
	}*/
	
    scope.setup(4, context->audioSampleRate);

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
		
        audioWrite(context,n,1,distortion_atan(snare_out*1.0f)); //keep within -1 to 1
        audioWrite(context,n,0,distortion_atan(kick_out*1.0f )); //keep within -1 to 1
        
        scope.log(fabs(snare_sample), snare_channel->current_sma, snare_channel->current_hit->advance_amount, snare_out );

   }
   
}

void cleanup(BelaContext *context, void *userData)
{
	
}

