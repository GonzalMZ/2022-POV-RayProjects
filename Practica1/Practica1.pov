#include "woods.inc"
#include "colors.inc"
#include "textures.inc" 
#include "metals.inc"
#include "rand.inc" 

camera {
 location <1.4,7,-12>
 look_at <0,2,0>
}                    

light_source {
 <-2,30,30>
 color rgb <1,1,1>
}   
plane{y,0
pigment{White}
} 
plane{z,10
pigment{Black}  
rotate<45,-15,0>
}                 
  
  
  
  
  
//ESFERA

#declare Rnd = seed (1153); 

#declare NrX = 0;     // start
#declare EndNrX = 300;   // end

#declare MiniEsf=
union{
    #while (NrX < EndNrX+1)
        #local R_Sphere=VRand_In_Sphere(Rnd)*1.88;
        object{sphere{<0,2,0>, 0.06*rand(Rnd)+0.06
            pigment{filter 0.9}
            texture{T_Silver_5E}
            finish{phong 1}}
            translate R_Sphere}
    
        #declare NrX = NrX + 1;  //next Nr
    #end
}


#declare EsfGrande=sphere{
<0,2,0>,2
pigment{transmit 0.9}
texture{Ruby_Glass}
finish{phong 0.2 }
} 

#declare EsferaFinal=
union{
    object{MiniEsf}
    object{EsfGrande}
}

object{EsferaFinal
    scale<0.85,0.85,0.85>
    translate<-3.3,0,-3.3> }

//CUENCO

#declare base=sor{
   6,
   <0,0> 
  <0.6,0>  
  <0.6,0.000001>
  <0.55,0.3>  
  <0.55001,0.301> 
  <0.25,0.65> 
  pigment{White}
}   
#declare S=
sphere{<0,1.35,0>, 1.2
pigment{White}
}  

#declare plano=
plane{y, 1
pigment{White}}

#declare arriba=intersection{
object{S}
object{plano}
} 

#declare dif=
difference{
object{arriba}
sphere{<0,1.35,0>,1.12
pigment{White}}
}
    
#declare finalRedondo=difference{
torus{
1.11,0.04
translate<0,1,0>
pigment{White}
} 
object{plano}
}       
#declare CuencoFinal=
union{
object{base}
object{dif}
object{finalRedondo}
}

object{CuencoFinal
    scale<1.6,1.6,1.6>
    translate<1.8,0,-4>
    }

//PRISMA

#declare Prism1=prism{
    linear_sweep
    linear_spline
    0,
    5,
    5,
    <0.2,-2.38564>,<-0.2,-2.38564>,<-0.8,-1.38564>,<0.8,-1.38564>,<0.2,-2.38564>
    texture{Glass2}  
    pigment{White transmit 0.6}
}

#declare Prism2=prism{
    linear_sweep
    linear_spline
    0,
    4,
    5,
    <-0.8,-1.38564>,<-0.5,-1.88564>,<-1.02,-1.88564>,<-1.3,-1.37564>,<-0.8,-1.38564>
    texture{Glass2}
    pigment{White transmit 0.6}
}

#declare PrismaFinal=
merge{
    #for(X,0,5)
        object{Prism1 
            rotate<0,X*60,0>
            #if(mod(X,2)=0)
                scale<0,0.9,0>
            #end
        }
    
        object{Prism2
            rotate<0,X*60,0>
        }
    #end 
} 

object{PrismaFinal 
    scale<0.9,0.9,0.9>
    translate<-3.3,0,3.6>
    }

//AMBIENTADOR

#declare Caja=
box{<-1,-1,-0.75>,<1,1,0.75>
    texture{T_Wood13}
    rotate<0,0,90>
    translate<0,1,0> 
}


#declare Dif1=difference{
    object{Caja}
    cylinder{<0,1,-0.8>,<0,1,0.8>,0.6
        texture{T_Wood13}}
}

#declare Union=
union{
    difference{
        object{Dif1}
        cylinder{<0,1.5,0>,<0,2.1,0>, 0.3      
            texture{T_Wood13}}
    }

    difference{
        cylinder{<0,1.8,0>,<0,1.85,0>,0.29
            pigment{Grey}
        }
        cylinder{<0,1.79999,0>,<0,1.85001,0>,0.2
            pigment{Grey}
        }  
    }
}

#declare Union=
difference{
    object{Union}
    cylinder{<0,0.3,0>,<0,1.8,0>, 0.55
        texture{T_Wood13}
    }
} 

#declare Union=
union{
    object{Union}
    cylinder{<0,0.3,0>,<0,0.5,0>, 0.54 
        pigment{White filter 0.6}
    }
    
    difference{
        cylinder{<0,0.4509,0>,<0,1.8,0>,0.54
            texture{Glass3}
        }
        cylinder{<0,0.451,0>,<0,1.91,0>,0.53999
            texture{Glass3}
        }    
    }
} 

#declare Palo=
cylinder{<0,-2,0>,<0,3,0>, 0.04
    pigment{Green*0.2}
} 

#declare Palos=
union{
    object{Palo
        rotate<0,0,15>
        translate<-0.23,2.4,-0.1>
    }
    object{Palo
        rotate<0,0,-15>
        translate<0.23,2.4,0.1>
    }
    object{Palo
        rotate<15,0,0>
        translate<-0.1,2.4,0.23>
    }
}

#declare Ambientador=
union{
    object{Union}
    object{Palos}
}

object{Ambientador 
    rotate<0,7,0>
    scale<1.5,1.5,1.5> }