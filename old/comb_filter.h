/***** comb_filter.h *****/
#include "wave_generator.h"
#include "wave_position.h"

#define MAX_COMB_LENGTH 1000000
class comb_filter
{
private:	
   float buffer[MAX_COMB_LENGTH];
   wave_position read_index;
   int write_index=0;
  
public:
   float feedback=0.5f;
   unsigned int length=10000;
   float read_inc=1.0f; 
      
   float tick(float in)
   {
   	   float read_out=buffer[read_index.whole_part]; //just get floor for now, ideally do interpolation of some sort...
   	   
   	   buffer[write_index]=in+read_out*feedback;
   	   
   	   write_index=(write_index+1)%length;
   	   
   	   read_index+=read_inc; //read out rate can vary (ie via LFO)
   	   
   	   while(read_index.whole_part>=length) //handle wrap around
   	       read_index.whole_part-=length;
   
       return read_out;   
   }
};