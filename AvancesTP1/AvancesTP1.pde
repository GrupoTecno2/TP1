//acá esta guardado lo que ya funcionó
Figura figura;


int fondo;

void setup() {

  size( 800, 800 );
  colorMode(HSB, 360, 100, 100);
  fondo = int(random(3, 8));
  background(57, fondo, 97);
  
 
}

void draw() {

figura.dibujar();
}

void mouseMoved(){
  figura.mouse();
}
