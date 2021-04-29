//caminante que avanza con el movimiento del mouse (o con los sonidos), 
//al hacer click cambia de direccio, tono, opacidad, tamaño y saturacion.
// El usuario tiene 40 segundos para interactuar
// luego de ese tiempo, el programa se conngela, y despues de 5segundos se reinicia
// vuelve a empezar al hacer click


Figura f;

void setup() {
  size(1000, 1000, P3D);
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
  
 
  f= new Figura();

  background(255, 0, 100);
}

void draw() {

  f.texturizar ();
  f.dibujar();


 
}
void mouseMoved(){
  f.mov();

}
void mousePressed() {
  f.cambio();
}
