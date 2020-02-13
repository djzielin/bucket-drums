/***** wave_position.h *****/
#ifndef DJZ_WAVE_POSITION
#define DJZ_WAVE_POSITION

#include <stdio.h>

class wave_position
{
public:
   wave_position();
   ~wave_position();

   void reset();
   void increment(float i);

   wave_position & operator= (const wave_position & rhs)
   {
        //printf("in assignment operator\n");

        whole_part=rhs.whole_part;
        fractional_part=rhs.fractional_part;
        
        return *this;
    }
    
    wave_position& operator+=(const float& rhs)
    {
       this->increment(rhs);
       return *this;

    }

   unsigned int whole_part;
   float fractional_part;
};

#endif