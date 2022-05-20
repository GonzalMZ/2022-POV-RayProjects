#include "colors.inc"      
#include "math.inc" 


#declare Metal=    
material {
    texture{pigment{BrightGold}
    finish{phong 1 specular 0.8 roughness 0.0001}}
        
}

//objecto base
#declare aro =   
    torus{
    1,0.1
    material{Metal}
} 
#declare arofractal=
    object{aro rotate x*90}              
                                                            

#macro myfractal (s, centro, recursividad, direccion) 
    #if(s<1)    
        #declare arofractal=union{
            object{arofractal}
            object{aro scale s rotate direccion*90 translate centro}  
        }    
    #end
    #if(recursividad>0)
        #if((VEq(direccion, x) & s=1) | (VEq(direccion, z)& s<1))      
            myfractal(s/2, centro+z*s, recursividad-1, y) 
            myfractal(s/2, centro-z*s, recursividad-1, y)
            myfractal(s/2, centro+y*s, recursividad-1, x)
            myfractal(s/2, centro-y*s, recursividad-1, x)         
        #elseif(VEq(direccion, y))           
            myfractal(s/2, centro+z*s, recursividad-1, z) 
            myfractal(s/2, centro-z*s, recursividad-1, z)
            myfractal(s/2, centro+x*s, recursividad-1, x)
            myfractal(s/2, centro-x*s, recursividad-1, x)
        #else                                           
            myfractal(s/2, centro+x*s, recursividad-1, y) 
            myfractal(s/2, centro-x*s, recursividad-1, y)
            myfractal(s/2, centro+y*s, recursividad-1, z)
            myfractal(s/2, centro-y*s, recursividad-1, z)
        #end                   
	#end 
#end
 
myfractal (1,0, 5 /*Iteraciones del fractal*/, z)       

#declare baculo=object{union{
    object{arofractal}
    cylinder{   
    <0,-4,0>, <0,-1,0>, 0.1
    material{Metal}
    }
}}  