class Forma {
  //atributos
  float x, y;
  float rotacion = random(45, 190);
  PImage color_;

  //constructor
  Forma(PImage colorDeForma) {
    imageMode(CENTER);// esto es por ahora, despues va a cambiar con el rotate
    x=random(width);
    y=random(height);
    scale(0.05);
    color_= colorDeForma;// cuando creemos un objeto nuevo aca va una imagen o arreglo de imagenes
  }

  //metodos
 
 void dibujar(float rotacion_, float tamanio_,float x_,float y_) {
    pushMatrix();
    translate(x_, y_);
    rotate(rotacion_);
    scale(tamanio_);
    image(color_, 0, 0);//+ opacidad random(50,100)
    popMatrix();
  }
  
  
}
