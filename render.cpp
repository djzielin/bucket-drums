#include <Bela.h>
#include <libraries/sndfile/sndfile.h>
#include <stdio.h>
#include <string.h>
#include <cmath>
#include <libraries/Midi/Midi.h>
#include <libraries/Scope/Scope.h>

#include "distortion.h"
#include "tapped_delay_line.h"
#include "freeverb.h"
#include "hit_manager.h"

unsigned int sample_rate;

freeverb *ourReverb;
float reverbMix=0.0f;
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

void process_midi_cc(int cc, int val)
{
		float float_val=(float)val/127.0f;
        bool bool_val=(val==127);

		rt_printf("cc message received: %d %d\n",cc,val);
   
		switch (cc)
		{
			case 1:
			    rt_printf("cc%d: hi pitch: %.02f\n",cc,float_val);
		     	snare_channel->set_base_pitch(float_val);
        		break;
        	case 2:
        		rt_printf("cc%d: low pitch: %.02f\n",cc,float_val);
		     	kick_channel->set_base_pitch(float_val);
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
		    	rt_printf("cc%d: delay length: %.02f\n",cc,float_val);
				snare_channel->set_delay_length(float_val);
				kick_channel->set_delay_length(float_val);
				break;		
			case 7:
			    rt_printf("cc%d: delay pmod: %.02f\n",cc,float_val);
				snare_channel->set_delay_pmod(float_val);
				kick_channel->set_delay_pmod(float_val);
				break;		
			case 8:
			    rt_printf("cc%d: rev len: %.02f\n",cc,float_val);
			    ourReverb->set_delay_times(snare_channel->map_to_range(float_val,1.0f,10.0f));
				break;		
			case 9:
			    rt_printf("cc%d: rev mix: %.02f\n",cc,float_val);
			    reverbMix=float_val;
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
                break;
			case 15:
			    rt_printf("cc%d: stut length mmod: %.02f\n",cc,float_val);
				snare_channel->set_stut_length_mod(float_val);
				kick_channel->set_stut_length_mod(float_val);
				break;
			case 16:
			    rt_printf("cc%d: delay count: %.02f\n",cc,float_val);
				snare_channel->set_delay_count(float_val);
				kick_channel->set_delay_count(float_val);
				break;
			case 17:
			    rt_printf("cc%d: delay smod: %.02f\n",cc,float_val);
				snare_channel->set_delay_smod(float_val);
				kick_channel->set_delay_smod(float_val);
				break;
			case 18:
			    rt_printf("cc%d: rev feedback: %.02f\n",cc,float_val);
			    ourReverb->set_feedback(snare_channel->map_to_range(float_val,0.84f,1.0f));
				break;
			case 21:
		        rt_printf("cc%d: do_bend: %s\n",cc,bool_val?"ON":"OFF");
		     	snare_channel->set_pitch_bend(bool_val?0.5f:0.0f);
		     	break;
         	case 22:
         	    rt_printf("cc%d: do_bend: %s\n",cc,bool_val?"ON":"OFF");
		     	kick_channel->set_pitch_bend(bool_val?0.5f:0.0f);
				break;
			case 25:
			    rt_printf("cc%d: stut lmod_up: %s\n",cc,bool_val?"ON":"OFF");
			    snare_channel->set_stut_lmod_up_button(bool_val);
			    kick_channel->set_stut_lmod_up_button(bool_val);
				break;
			 case 31:
			    rt_printf("cc%d: hi pitch up: %s\n",cc,bool_val?"ON":"OFF");
			    snare_channel->set_bend_up(bool_val);
				break;
		    case 32:
			    rt_printf("cc%d: low pitch up: %s\n",cc,bool_val?"ON":"OFF");
			    kick_channel->set_bend_up(bool_val);
				break;
		   case 35:
			    rt_printf("cc%d: stut pmod_up: %s\n",cc,bool_val?"ON":"OFF");
			    snare_channel->set_stut_pmod_up_button(bool_val);
			    kick_channel->set_stut_pmod_up_button(bool_val);
				break;
			case 38:
			    rt_printf("cc%d: reverb hold: %s\n",cc,bool_val?"ON":"OFF");
			    ourReverb->set_hold(bool_val);
				break;
			default:
			 	break;
		} 
}

void midiMessageCallback(MidiChannelMessage message, void* arg)
{
	if(message.getType() == kmmControlChange)
	{
		int cc=	 message.getDataByte(0);
		int val= message.getDataByte(1);
		
	    process_midi_cc(cc,val);
	}
	if(message.getType()==kmmSystem)
	{
		rt_printf("getting system message!\n");
	}
}

void zero_all_cc()
{
	for(int i=0;i<40;i++)
	{
		process_midi_cc(i,0);
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
	cc_write(21,127);
	sample_rate=context->audioSampleRate;
	rt_printf("sample rate is: %d\n",(int)sample_rate);
	
	printf("about to setup snare channel...\n");
	snare_channel=new hit_manager(sample_rate,1000);
    snare_channel->sma_multiplier=1.5f;
    snare_channel->lowest_pitch=0.0f;

    printf("about to setup kick channel...\n");
    kick_channel=new hit_manager(sample_rate,1000);
    kick_channel->sma_multiplier=2.0f;
    kick_channel->lowest_pitch=0.0f;

    ourReverb=new freeverb(sample_rate);

    scope.setup(4, context->audioSampleRate);
    
    zero_all_cc();
    
    rt_printf("setup complete");

	return true;
}    

bool skip_first_samples=false;
unsigned int skip_count=0;

void render(BelaContext *context, void *userData)
{

	for(unsigned int n = 0; n < context->audioFrames; n++) 
	{   
		float snare_sample=audioRead(context, n, 1);
		float kick_sample= audioRead(context, n, 0);
		
	    float snare_out = snare_channel->tick(snare_sample);
		float kick_out  = kick_channel->tick(kick_sample);
		
		float rev=ourReverb->tick(snare_out);
		
        audioWrite(context,n,1,distortion_clamp(snare_out*(1.0-reverbMix) + rev*reverbMix)); //keep within -1 to 1
        audioWrite(context,n,0,distortion_clamp(kick_out)); //keep within -1 to 1
        
        scope.log(fabs(snare_sample), snare_channel->current_sma, snare_channel->current_hit->advance_amount, snare_out );
        //scope.log(fabs(kick_sample), kick_channel->current_sma, kick_channel->current_hit->advance_amount, kick_out );
   }
   
}

void cleanup(BelaContext *context, void *userData)
{
	
}

