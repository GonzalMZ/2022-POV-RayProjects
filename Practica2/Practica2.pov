#include "arosFractal.pov"  
#include "prismaFractal.pov"
#include "cuboFractal.pov"

camera {
location <0,3,-6> look_at <0,2,0>
}
                                              
light_source {< -200, 160, -100> color White }
light_source {< 200, 160, -100> color White }    

plane{<0,1,0>,1 hollow  
      
        texture{ pigment {color rgb<0.1,0.3,0.75>*0.7}
                 finish {emission 1 diffuse 0}
               } 

        texture{ pigment{ bozo turbulence 0.75
                          octaves 6  omega 0.7 lambda 2 
                          color_map {
                          [0.0  color rgb <0.95, 0.95, 0.95> ]
                          [0.05  color rgb <1, 1, 1>*1.25 ]
                          [0.15 color rgb <0.85, 0.85, 0.85> ]
                          [0.55 color rgbt <1, 1, 1, 1>*1 ]
                          [1.0 color rgbt <1, 1, 1, 1>*1 ]
                          } 
                         translate< 3, 0,-1>
                         scale <0.3, 0.4, 0.2>*3
                        }
                 finish {emission 0.9 diffuse 0}
               } 
       scale 10000
     } 
     
fog{ fog_type   2
     distance   1000
     color      rgb<1,1,1>*0.9
     fog_offset 0.1
     fog_alt    20
     turbulence 1.8
   }
      
plane{<0,1,0>,0
      texture{pigment{checker
              color Green color rgb<0,0.6,>} 
              finish{reflection 0.2 diffuse 0.7}
      }
}  
              

object{baculo scale 0.8 translate y*3.2} 
object{prismafractal scale 0.35 rotate y*70 translate <-1.8,0,-0.6>}
object{cubofractal rotate y*70 translate <1.8,0,-0.5>}