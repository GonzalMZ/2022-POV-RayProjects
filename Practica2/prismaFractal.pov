#include "textures.inc"  
#include "colors.inc"      
#include "math.inc"


#declare Glass= 
material {
    texture{
	pigment{rgbft<0,0,1,0.3,0.2>}
	finish{specular 0.8 roughness 0.0001 reflection 0.2}
	}
    interior{ior 2.5 dispersion 1.1 dispersion_samples 25}
        
}
   
// Objeto base
#declare obelisco = 
merge{
    prism{
    linear_sweep
    linear_spline
    0,
    7,
    5,
    <-1,-1>,<-1,1>,<1,1>,<1,-1>,<-1,-1> 
    material { Glass }  
   }   
   difference{
    box{<-1,0,-1>,<1,1,1>    
    material { Glass }    
    }
    plane{ x-y,  -sqrt(2)/2}
    plane{ -x-y, -sqrt(2)/2}
    plane{ z-y,  -sqrt(2)/2}
    plane{ -z-y, -sqrt(2)/2}  
    material { Glass }    
    translate<0,7,0>
   }
}
                   
#declare prismafractal=object{obelisco}     

                                              

#macro myfractal (s, centro, rotacion, recursividad, direccion)
	#if(recursividad>0)
	    #if(s<1) 
	        #declare prismafractal=union{
    	        object{prismafractal}
    	        object {obelisco scale s rotate rotacion translate centro} 
	        }
	    #end
	    #if(VEq(direccion, y))
    		myfractal (s/2, centro + 8*(s/2)*y +(s/2)*z,   x*90, recursividad-1,  z)         
    		myfractal (s/2, centro + 8*(s/2)*y +(s/2)*-z, -x*90, recursividad-1, -z) 
    		myfractal (s/2, centro + 8*(s/2)*y +(s/2)*-x,  z*90, recursividad-1, -x)         
    		myfractal (s/2, centro + 8*(s/2)*y +(s/2)*x,  -z*90, recursividad-1,  x)        
    		
    	#elseif(VEq(direccion,x))     
    		myfractal (s/2, centro + 8*(s/2)*x +(s/2)*z,   x*90, recursividad-1,  z)         
    		myfractal (s/2, centro + 8*(s/2)*x +(s/2)*-z, -x*90, recursividad-1, -z) 
    		myfractal (s/2, centro + 8*(s/2)*x +(s/2)*y,      0, recursividad-1,  y)         
    		myfractal (s/2, centro + 8*(s/2)*x +(s/2)*-y, z*180, recursividad-1, -y)  
    		
    	#elseif(VEq(direccion,z))   
    		myfractal (s/2, centro + 8*(s/2)*z +(s/2)*-y, x*180, recursividad-1, -y)         
    		myfractal (s/2, centro + 8*(s/2)*z +(s/2)*y,      0, recursividad-1,  y) 
    		myfractal (s/2, centro + 8*(s/2)*z +(s/2)*-x,  z*90, recursividad-1, -x)         
    		myfractal (s/2, centro + 8*(s/2)*z +(s/2)*x,  -z*90, recursividad-1,  x)    
    		
    	#elseif(VEq(direccion,-y))  
    		myfractal (s/2, centro + 8*(s/2)*-y +(s/2)*-z, -x*90, recursividad-1,-z)         
    		myfractal (s/2, centro + 8*(s/2)*-y +(s/2)*z,   x*90, recursividad-1, z) 
    		myfractal (s/2, centro + 8*(s/2)*-y +(s/2)*-x,  z*90, recursividad-1,-x)         
    		myfractal (s/2, centro + 8*(s/2)*-y +(s/2)*x,  -z*90, recursividad-1, x)    
    		
    	#elseif(VEq(direccion,-x))                                        
    		myfractal (s/2, centro + 8*(s/2)*-x +(s/2)*z,   x*90, recursividad-1, z)         
    		myfractal (s/2, centro + 8*(s/2)*-x +(s/2)*-z, -x*90, recursividad-1,-z) 
    		myfractal (s/2, centro + 8*(s/2)*-x +(s/2)*-y, z*180, recursividad-1,-y)         
    		myfractal (s/2, centro + 8*(s/2)*-x +(s/2)*y,      0, recursividad-1, y)
    		
    	#else                                                    
    		myfractal (s/2, centro + 8*(s/2)*-z +(s/2)*y,      0, recursividad-1, y)         
    		myfractal (s/2, centro + 8*(s/2)*-z +(s/2)*-y, x*180, recursividad-1,-y) 
    		myfractal (s/2, centro + 8*(s/2)*-z +(s/2)*-x,  z*90, recursividad-1,-x)         
    		myfractal (s/2, centro + 8*(s/2)*-z +(s/2)*x,  -z*90, recursividad-1, x) 
    	#end
    	
	#else      
    	#declare prismafractal=union{
	        object{prismafractal}
	        object { obelisco scale s rotate rotacion translate centro} 
	    }
	#end 
#end
 
myfractal (1, 0, y, 4 /*Iteraciones del fractal*/, y)  