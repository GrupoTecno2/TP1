/**/
class FiguraColores {

  //------------------------------------------  PROPIEDADES ----------------------------------------------

  //POSIBLE ARRAYLIST PARA LOS ARREGLOS DE IMAGENES 
  //arreglas de imagenes
  PImage [] rojo = new PImage [1];//numero de figras de rojo
  PImage [] amarillo = new PImage [1];//numero de figras de rojo
  PImage [] azul = new PImage [1];//numero de figras de rojo
  //posiciones, desde CORNER, fijadas en coordenadas cercnas al centro del lienzo
  float x, y;
  //tamaño, depende del TIEMPO de duración del sonido, LARGO O CORTO
  float tamano;
  //angulo de rotación RADIANES
  int angulo;
  //opacidad, depende de la INTENSIDAD, ALTO Y BAJO
  int opacidad;
  //si se dibuja o no la figura, depende de el ESTADO ANTERIOR Y UN IF
  boolean dibujar;

  //------------------------------------------  INICADOR ---------------------------------------------- 

  // iniciar la figura en una posición 
  FiguraColores () {

    imageMode(CORNER);
    /*for ( int j = 0; j < rojo.length; j++ )
      rojo [j]  = loadImage("rojo"+ j +".png");
      for ( int j = 0; j < amarillo.length; j++ )
      amarillo [j]  = loadImage("amarillo"+ j +".png");
      for ( int j = 0; j < azul.length; j++ )
      azul [j]  = loadImage("azul"+ j +".png");
      */
    //posicion
    x= //random  (width*0,25, width*0,75 );
    y= random (height);
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
      //tint
      //image( figuraColor[tinte], x, y, tamano, tamano, opacidad); // esta opacidad es un valor mapeado o escalado que se da con la interaccion
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
