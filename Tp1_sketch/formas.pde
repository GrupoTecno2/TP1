class Forma {
  //atributos
  float x, y;
  float rotacion = random(45, 190);
  float tamanio = random(0.2, 0.5);
  PImage color_;

  //constructor
  Forma(PImage colorDeForma) {
    imageMode(CENTER);// esto es por ahora, despues va a cambiar con el rotate
    x=width/2;
    y=height/2;
    scale(0.05);
    color_= colorDeForma;// cuando creemos un objeto nuevo aca va una imagen o arreglo de imagenes
  }

  //metodos
  void dibujar() {
    pushMatrix();
    translate(x, y);
    rotate(rotacion);
    scale(tamanio);
    image(color_, 0, 0);//+ opacidad random(50,100)
    popMatrix();
  }
}
