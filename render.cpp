#include <Bela.h>
#include <sndfile.h>
#include <stdio.h>
#include <string.h>
#include <cmath>
#include <libraries/Midi/Midi.h>
#include <libraries/Scope/Scope.h>

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
}

void sysexCallback(std::vector<unsigned char>* v)
{
    rt_printf("got sysex message size: %d\n",v->size());
    
   if((*v)[6]==0x5F)
   {
   	  if((*v)[7]==0x4F)
   	     rt_printf("scene was switched to: %d!\n", (*v)[8]+1);
   
   }
   
   for(int i=6;i<v->size();i++)
   {
   	   rt_printf("%02X ",(*v)[i]);
   }
   rt_printf("\n");
}


void midiMessageCallback(MidiChannelMessage message, void* arg)
{
	if(message.getType() == kmmControlChange)
	{
		int cc=	 message.getDataByte(0);
		int val= message.getDataByte(1);
		float float_val=(float)val/127.0f;
		
		rt_printf("cc message received: %d %d\n",cc,val);
   
		switch (cc)
		{
			case 1:
			    rt_printf("cc%d: pitch bend1: %.02f\n",cc,float_val);
        		snare_channel->set_pitch_bend(float_val);
        		break;
        	case 2:
        		rt_printf("cc%d: pitch bend2: %.02f\n",cc,float_val);
        		kick_channel->set_pitch_bend(float_val); 
        		break;
    		case 3:
				rt_printf("cc%d: gate time: %.02f\n",cc,float_val);
				snare_channel->set_gate_time(float_val); 
        		kick_channel->set_gate_time(float_val);
				break;
    		case 4:
    		     rt_printf("cc%d: stut length: %.02f\n",cc,float_val);
				 snare_channel->set_stut_length(float_val);
                 kick_channel->set_stut_length(float_val);
			case 5:
			    rt_printf("cc%d: stut pitch mod: %.02f\n",cc,float_val);
				snare_channel->set_stut_pitch_mod(float_val);
				kick_channel->set_stut_pitch_mod(float_val);
				break;	
			case 6:
				break;		
			case 7:
				break;		
			case 8:
				break;			
			case 9:
				break;		
			case 11:
			    rt_printf("cc%d: hi threshold: %.02f\n",cc,float_val);
			    snare_channel->set_hit_threshold(float_val);
				break;			
			case 12:
		     	rt_printf("cc%d: low threshold: %.02f\n",cc,float_val);
				kick_channel ->set_hit_threshold(float_val);
				break;		
			case 13:
			    rt_printf("cc%d: boost: %.02f\n",cc,float_val);
			    snare_channel->set_boost(float_val);
			    kick_channel->set_boost(float_val);
				break;
			case 14:
			    rt_printf("cc%d: stut count: %.02f\n",cc,float_val);
			    snare_channel->set_stut_max_count(float_val);
                kick_channel->set_stut_max_count(float_val);
			case 15:
			    rt_printf("cc%d: stut length mmod: %.02f\n",cc,float_val);
				snare_channel->set_stut_length_mod(float_val);
				kick_channel->set_stut_length_mod(float_val);
				break;
			default:
			 	break;
		}   
	}
	if(message.getType()==kmmSystem)
	{
		rt_printf("getting system message!\n");
	}
}


tapped_delay_line *td1;

bool setup(BelaContext *context, void *userData)
{
	midi.readFrom(gMidiPort0);
	midi.writeTo(gMidiPort0);
	
	midi.enableParser(true);
	midi.setParserCallback(midiMessageCallback, (void*) gMidiPort0);
	//midi.setSysExCallback(sysexCallback);
	
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
    
    rt_printf("setup complete");

	return true;
}    

bool skip_first_samples=false;
unsigned int skip_count=0;

void render(BelaContext *context, void *userData)
{

	for(unsigned int n = 0; n < context->audioFrames; n++) 
	{   
		float snare_sample=distortion_clamp(audioRead(context, n, 1)); //keep within -1 to 1 //TODO: check if that is really a problem!
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

