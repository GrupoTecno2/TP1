
//cuadrilatyeros que cambian su tamaño al mover el mouse
// comparten un vertice (podrian compartir mas)

Figura f, f1, f2, f3;
int cual=int(random(1, 4));
float newValue =random(-5, 5);

void setup() {
  size(1000, 600);
  colorMode(HSB, 360, 100, 100);
  f = new Figura(cual);
  f1 = new Figura(cual);
  f2 = new Figura(cual);
  f3 = new Figura(cual);
}

void draw() {
  background(#FEFFF0);
  f.dibujar();
  f1.dibujar();
  f2.dibujar();
  f3.dibujar();
}
void mouseMoved() {
  f.mover();
  f1.mover();
  f2.mover();
  f3.mover();
}
//void mouseReleased() {
//  f.actualizarXY(random(-1, 0));
//  f1.actualizarXY(random(-1, 0));
//  f2.actualizarXY(random(-1, 0));
//}
