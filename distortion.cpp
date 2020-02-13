/***** distortion.cpp *****/
#include<distortion.h>

const float atan_scaler=2.0/M_PI;


float distortion_atan(float input)
{
	return atan(input)*atan_scaler; //keep within -1 to 1
}

//TODO, add atan neon (fast) ?

float distortion_clamp(float input)
{
   if(input>1.0f)
      return 1.0f;
   if(input<-1.0f)
      return -1.0f;
	
   return input; 
}
