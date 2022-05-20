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