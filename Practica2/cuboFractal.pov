#include "math.inc" 
#include "woods.inc" 
#include "colors.inc"    


#declare cubo =   
    box{<-0.45,0,-0.45>,<0.45,0.9,0.45>  
    texture{ T_Wood13}  
} 
    
// Objeto base
#declare rubik = 
union{                 
    //Parte de abajo
    object{cubo translate <-0.55,0,-0.55>  } 
    object{cubo translate <0.55,0,-0.55>   }
    object{cubo translate <0.55,0,0.55>    }
    object{cubo translate <-0.55,0,0.55>   }
    //Parte de arriba
    object{cubo translate <-0.55,1.1,-0.55>}   
    object{cubo translate <0.55,1.1,-0.55> }  //Cubo a dividir
    object{cubo translate <0.55,1.1,0.55>  }
    object{cubo translate <-0.55,1.1,0.55> }
}
                   
#declare cubofractal=object{rubik}                              

#macro myfractal (centro, recursividad, iteracion) 
    #if(recursividad>0)
    	#declare cubofractal=  
    	union{
    	    difference{ 
    	        object{cubofractal}
    	        object{cubo scale pow(0.45,iteracion) scale <1.005,1.01,1.005> translate centro translate <0,-pow(0.45,iteracion)*0.9*0.005,0>}
    	    }
    	    object{rubik scale pow(0.45,iteracion+1) translate centro}        
    	}
    	myfractal((centro+<0.9*(0.05*pow(0.45,iteracion)+0.5*pow(0.45,iteracion+1)),0.9*0.55*pow(0.45,iteracion),-(0.9*(0.05*pow(0.45,iteracion)+0.5*pow(0.45,iteracion+1)))>),recursividad-1,iteracion+1)   
	#end 
#end
 
myfractal (<0.55,1.1,-0.55>, 5 /*Iteraciones del fractal*/, 0)        