/**/
class FiguraNegra {

  //------------------------------------------  PROPIEDADES ----------------------------------------------

  //POSIBLE ARRAYLIST PARA LOS ARREGLOS DE IMAGENES 
  //arreglas de imagenes
  PImage [] figuraNegra = new PImage [1];//numero de figuras negras
 
  //posiciones, desde CORNER, fijadas en coordenadas cercnas al centro del lienzo
  float x, y;
  //tamaño, depende del TIEMPO de duración del sonido, LARGO O CORTO
  float tamano;
  //angulo de rotación RADIANES
  int angulo;
  //si se dibuja o no la figura, depende de el ESTADO ANTERIOR Y UN IF
  boolean dibujar;

  //------------------------------------------  INICADOR ---------------------------------------------- 

  // iniciar la figura en una posición 
  FiguraNegra () {

     imageMode(CORNER);
    /*for ( int j = 0; j < figuraNegra.length; j++ )
      figuraNegra [j]  = loadImage("negras"+ j +".png");
      */
    
    //posición
    x= //x.figuraBase; //Tomar como parametro de figuraBase
    y= random (height); //Tomar como parametro de figuraBase
    tamano = 100; //asumiendo que todos son cuadrados
    //inicia sin dibujarse
    dibujar = false;
    angulo = int(random(30, 120));
  }

  //------------------------------------------  MÉTODOS ---------------------------------------------- 

  void dibujar(int tinte, int opacidad) { // color

    if (dibujar == true) {
      noStroke();
      rotate(radians(angulo)); // para definir el angulo de inclinacion RADIANES radians(random(30, 120))
      //image( figuraNegra[tinte], x, y, tamano, tamano); // esta opacidad es un valor mapeado o escalado que se da con la interaccion
    } else if (dibujar == false) {
    }
  }

  void crecer() {
    if (dibujar == true) {

      tamano = tamano + 1; //aqui va el valor que le agreguemos en la interactividad con mouse

      //      FALTA AÑADIR LOS OTROS MODOS DE INTERACCIÓN Y CRECIMIETO, DEBEN DEFINIRSE CON
      //      DEBEN DEFINIRSE CON EL MOUSE, SUGUIERO UNA CALSE INTERACTIVIDAD QUE ENTREGA BOOLEANS ACÁ
    } else if (dibujar == false) {
    }
  }

  void reciclar() {
    if (/*contadorFinalizo == true &&*/  dibujar == true) {

      //      ESTO HAY QUE IR PROBANDO COMO, NO PUDE ENCONTRARLE LA VUELTA AÚN 
      //      así como está se va a borrar la figura superior cuando salga la siguiente, podemos usar un contador

      dibujar = false;
    } else if (dibujar == true) {
    }
    //      VOLVEMOS LA FUNCIÓN A 0 PARA QUE SE PUEDA VOLVER A USAR Y LANCE OTRA LINEA
  }
}
