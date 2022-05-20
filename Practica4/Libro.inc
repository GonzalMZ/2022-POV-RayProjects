#declare Epsil =   0.0001;

#declare TextureLibro = texture {
 pigment {
    gradient z
    color_map {
       [0.0 colour White ]
       [0.1 colour Gray90 ]
       [0.2 colour White ]
       [0.3 colour Gray95 ]
       [0.4 colour White ]
       [0.5 colour Gray80 ]
       [0.6 colour White ]
       [0.6 colour Gray95 ]
       [0.8 colour White ]
       [0.9 colour Gray90 ]
       [1.0 colour Gray85 ]
    }  // end colourmap;
  }  // end pigment;
  finish { ambient 0.3 diffuse 0.7 }
  scale <1, 1, 0.3>
}  // end Texture;

#macro Libro(Largo, Ancho, Grueso, Portada, Lomo)
 object {
  union {

    box { <0, 0, 0> <1,1,1>
      texture { TextureLibro }
      translate <-0.5, -0.5, -0.5>
    }

     // Portada del libro;
    box { <0,0, 0>  <1, 1, 1>
      texture {
         pigment{
            image_map {
            jpeg Portada once
            }
         }
       }
      translate <-0.5, -0.5, -0.5>
      scale <1-Epsil,
                1-Epsil, 1+Epsil>
    }  // end box;

     // Lomo del libro;
    box { <0,0,0 >   <1 ,1 ,1 >
      texture {
         pigment{
            image_map {
               jpeg Lomo once
            }
         }
      }
      translate <-0.5, -0.5, -0.5>
      scale <1-Epsil,
                1-Epsil, 1+Epsil>
      rotate y*90
    }  // end box;
  }  // end union
  translate <-0.5, -0.5, -0.5>
   // Centrar el cubo en <0,0,0>;
  scale <Ancho,Largo,
          Grueso>
}  // Fin 'Libro.inc';
#end