class Figura{

//------------------------------------------  PROPIEDADES ----------------------------------------------
  //PImage tono;
float x, y;
float tam;
GestorDeInteraccion g;

Figura() {

  x =random(0.25 * width, 0.75 * width);
  y =random(0.25 *height, 0.75 * height);
  g = new GestorDeInteraccion();
  tam =100;
}
  
  //------------------------------------------  MÉTODOS ---------------------------------------------- 

  
  void dibujar (PImage[] tono, int valores) {
    
  imageMode(CENTER);
  image(tono[valores], x, y, tam, tam);

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

}
