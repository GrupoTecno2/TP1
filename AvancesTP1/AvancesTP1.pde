//acá esta guardado lo que ya funcionó
Figura figura;

PImage [] rojo = new PImage [11];//numero de figuras de rojo
PImage [] amarillo = new PImage [6];//numero de figuras de rojo
PImage [] azul = new PImage [20];//numero de figuras de rojo
int valorRojo, valorAzul, valorAmarillo;
int fondo;

void setup() {

  size( 800, 800 );
  colorMode(HSB,360, 100, 100);
  fondo = int(random(3, 8));
  background(57, fondo, 97);

for ( int j = 1; j < rojo.length; j++ )
    rojo [j]  = loadImage("rojo"+ j +".png");
  for ( int j = 1; j < amarillo.length; j++ )
    amarillo [j]  = loadImage("amarillo"+ j +".png");
  for ( int j = 1; j < azul.length; j++ )
    azul [j]  = loadImage("azul"+ j +".png");

  valorRojo = int(random(1, 11));
  valorAzul = int(random(1, 20));
  valorAmarillo = int(random(1, 6));

}

void draw() {
  
  figura.dibujar(rojo, valorRojo);
  
}
