
PImage [] rojo = new PImage [11];//numero de figuras de rojo
PImage [] amarillo = new PImage [6];//numero de figuras de rojo
PImage [] azul = new PImage [20];//numero de figuras de rojo
int valorRojo, valorAzul, valorAmarillo;
int fondo;
float x, y;
float tam;
GestorDeInteraccion g;

void setup() {

  size( 800, 800 );
  colorMode(HSB, 360, 100, 100);
  fondo = int(random(3, 8));
  background(57, fondo, 97);

  x =random(0.25 * width, 0.75 * width);
  y =random(0.25 *height, 0.75 * height);
  g = new GestorDeInteraccion();
  tam =100;
  
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
  
  background(57, fondo, 97);
  imageMode(CENTER);
  image(rojo[valorRojo], x, y, tam, tam);

  g.actualizar();


  if (g.arriba) {
    println("arriba");
  } else if (g.abajo) {
    println("abajo");
  }
  if (g.derecha) {
    println("derecha");
  } else if (g.izquierda) {
    println("izquierda");
  }

  //para la parte de velocidad(grande o pequena)
  if (g.movGrande) {
    tam++;
    ;
  } else if (g.movPeque) {
    tam =(tam-1);
  }
}
