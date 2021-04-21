//acá esta guardado lo que ya funcionó
float x, y;
float tam;
PImage [] rojo = new PImage [11];//numero de figuras de rojo
int objeto;
GestorDeInteraccion g;

void setup() {

  size( 800, 800 );
  colorMode(HSB);
  background(57, int(random(1,5)), 97);
  
   for ( int j = 1; j < rojo.length; j++ )
    rojo [j]  = loadImage("rojo"+ j +".png");
    objeto = int(random(1, 11));
  
  x =random(0.25 * width, 0.75 * width);
  y =random(0.25 *height, 0.75 * height);
  g = new GestorDeInteraccion();
  tam =100;
  /*
  surface.setTitle("Viaje en el Tiempo 2000");
   surface.setResizable(true);
   surface.setLocation(100, 100);
   */
}

void draw () {
  background(255);
  imageMode(CENTER);
  image(rojo[objeto], x , y, tam, tam);

  g.actualizar();
    

if(g.arriba){
    println("arriba");
}
  else if(g.abajo){
    println("abajo");
}
  if(g.derecha){
    println("derecha");
  }
  else if(g.izquierda){
    println("izquierda");
  }
  
  //para la parte de velocidad(grande o pequena)
  if(g.movGrande){
    tam++;;
  }else if(g.movPeque){
    tam =(tam-1);
  }
  
}
