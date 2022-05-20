#include "colors.inc"   
#include "woods.inc"  
#include "rad_def.inc"  
#include "textures.inc"    
#include "metals.inc"
#include "glass.inc"
   
//Mesa        

#declare pata = box{<0,0.1,0>,<0.3,2.6,0.3>
 texture{T_Silver_1A
 finish{ambient 0.1
        diffuse 0.1
        specular 1
        reflection {0.1 metallic}
        roughness .1}}}

#declare mesa = union{
    object {pata translate<-3,0,0.35>}
    object {pata translate<-3,0,-0.65>}
    object {pata translate<2.7,0,0.35>}
    object {pata translate<2.7,0,-0.65>} 
    object{box{<-3.25,2.6,-1.1>,<3.25,2.7,0.9>}
     texture {
            pigment {
                wood
                turbulence 0.05
                color_map {
                    [0.00 rgb <0.58, 0.45, 0.23>]
                    [0.34 rgb <0.65, 0.45, 0.25>]
                    [0.40 rgb <0.33, 0.23, 0.13>]
                    [0.47 rgb <0.60, 0.40, 0.20>]
                    [1.00 rgb <0.25, 0.15, 0.05>]
                }
            }
            rotate y*90
            rotate x*90
            scale <0.01,0.01,0.01>
     finish {
        crand 0.02
        ambient 0.32
        diffuse 0.63
        phong 0.2
        phong_size 10
        specular 0.2
        roughness .1
     }
     normal { bumps 0.05 }
   }
}} 

//Libros

#include "Libro.inc"

//Libro negro
#declare Largo   = 20;
#declare Ancho   = 12 ;
#declare Grueso  = 4.5 ;
#declare Portada = "img/portada.jpg";
#declare Lomo    = "img/lomo.jpg";
#declare libroN=object{Libro(Largo,Ancho,Grueso, Portada, Lomo) 
   scale 0.05
   rotate x*90
   rotate y *30
   translate <-2, 2.97,0.4>
} 

//Libro blanco
#declare Portada = "img/portada2.jpg";
#declare Lomo    = "img/lomo2.jpg";
#declare libroB=object{Libro(Largo,Ancho,Grueso, Portada, Lomo) 
   scale 0.05
   rotate x*90
   rotate y *90
   translate <-2, 2.7, -0.2>
} 


//Portatil 

#include "ordenador/HP_Pavilion_Laptop_POV_geom.inc"        
#declare portatil=difference{
    object{
        HP_Pavilion_Laptop_ 
        scale 0.18
        rotate y*210
        translate <1.8,2.7,-0.3>
    }   
    plane{y,2.7}
} 

//Botella

#declare Plastico = finish {
      ambient 0.4
      diffuse 0.45
      reflection 0.15
      phong 0.3
      phong_size 20
}

#declare botella=object {
  union {
    intersection {
      merge {
        cylinder { < 0, 18.1, 0>
                   < 0, 20  , 0>  0.9 }
        cone     { < 0, 14  , 0>  2.9
                   < 0, 18.1, 0>  0.9 }
        sphere   { < 0, 12.5, 0>  3.3 }
        cylinder { < 0,  0  , 0>
                   < 0, 12  , 0>  3.2 }
      }
      merge {
        cylinder { < 0, 18  , 0>
                   < 0, 20.1, 0>  0.8 }
        cone     { < 0, 13.9, 0>  2.8
                   < 0, 18.0, 0>  0.8 }
        sphere   { < 0, 12.4, 0>  3.2 }
        cylinder { < 0,  6  , 0>
                   < 0, 12.5, 0>  3.1 }
        inverse
      }  
    
      texture { pigment{ rgbf<0.9,0.9,0.9,0.8>}
        normal { 
          bump_map {
            jpeg "img/botella_norm.jpg"
            map_type 2     // Clindro
            bump_size 1
          }
        }
        finish{
          ambient 0.2
          diffuse 0.3
          reflection 0.15
          phong 0.3
          phong_size 20
        }
        
        scale <15, 15, 15>
      } 
       interior{ior 1.5}
   }
   cylinder { < 0, 20, 0>
              < 0, 19, 0> 1.1  // Tapon
       texture {
         pigment {Blue}
         finish { Plastico }
       }  // fin Tapon
   }
  scale 0.07
  translate<-1.5,2.7,0.4>
  }
} 

//Vaso

#declare vaso=object {
   intersection {
   cone { <0, 0, 0> 2.5   <0, 7 ,  0> 2.9 }
   cone { <0, 4, 0> 2.45  <0, 7.5, 0> 2.8
          inverse }
   }
  texture { pigment { rgbf <1,1,1,0.7> }
    normal {
      bump_map {
        jpeg "img/vaso_norm.jpg"
        map_type 2     // Clindro
        bump_size  0.5
      }
    }
    finish{
          ambient 0.4
          diffuse 0
          reflection 0.15
          phong 0.3
          phong_size 20
        }
    scale <7,7,7>
  }
   interior{ior 1.5}
   scale 0.07
  translate<-1.7,2.7,-0.4>
}  


//Hoja    

#declare hoja=object {
  union{
  //Cara
      box { <0,1,0> <1,2,1>  
      texture { 
            
            pigment{ image_map { jpeg "img/hoja.jpg" }
            }
            finish { ambient 0.4 diffuse 0.6 }
            rotate x*90
      }}  
  //Bordes
     box { <0,0,0> <1,1,1>  pigment{ Black}  }
  }
  scale <1, 0.0005, 1.5>
  rotate y*-30 
  translate<-0.7,2.7,-1.2>
}  

//Cuaderno

#include "cuaderno/16734_notebook_v1_NEW_POV_geom.inc"
#declare cuaderno=object{ _16734_notebook_v1_NEW_
    scale 0.055
    rotate x*90
    rotate z*-1.5
    translate <0,2.8,0>} 
    
//Lapiz

#declare lapiz=object {
  union {
     cylinder { <0,0,0> <0,7.5,0> 0.3
        texture { DMFDarkOak  }
     }
     cylinder { <0,7.5,0> <0,8.5,0> 0.3
        texture { Gold_Metal }
     }
     cone { <0,0,0> 0.3 <0,-0.8,0> 0.1
        texture { White_Wood  }
     }
     cone { <0,-0.8,0> 0.1 <0,-1, 0> 0
        texture { pigment { Black } }
     }
  } 
  scale 0.07  
  rotate x*90
  rotate y*20
  translate <-1,2.73,-0.5>
}  

//Cubo fractal
#include "cuboFractal.inc"

#declare cubo=object{cubofractal scale 0.2 rotate y*70 translate <1.1,2.7,0.6>} 

#declare escritorio =
union{ 
    object{mesa}
    object{libroN}
    object{libroB}
    object{portatil}
    object{botella}
    object{vaso}
    object{hoja}
    object{cuaderno}
    object{lapiz}
    object{cubo}
}