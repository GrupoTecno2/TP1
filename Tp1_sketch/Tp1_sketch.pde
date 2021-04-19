// declaro un objeto forma de tipo azul
Forma azul, amarillo, rojo;

//declaro arreglo azul, amarillo, rojos y trazos(?
PImage arrayAzul[], arrayAmarillo[], arrayRojo[];




void setup() {
  size(1200, 600);

  //// declaración de arreglos (un arreglo por color)

  //arrayAzul =new PImage[8];//-------------- ARREGLO AZUL!!!!!!
  //for (int i =0; i<8; i ++) {
  //  arrayAzul [i]=loadImage("azul"+nf (i, 2)+".png");
  //}

  arrayAmarillo =new PImage[6];//-------------- ARREGLO AMARILLO!!!!!!
  for (int i =0; i<6; i ++) {
    arrayAmarillo [i]=loadImage("amarillo"+nf (i, 2)+".png");
  }
  /* arrayRojo =new PImage[10];//-------------- ARREGLO ROJO!!!!!!
   for (int i =0; i<10; i ++) {
   arrayRojo [i]=loadImage("rojo"+nf (i, 2)+"PNG");
   }*/

  //INICIALIZACIÓN DE OBJETOS
  //azul = new Forma (arrayAzul[int(random(0, 7))]);// Forma (objeto) + Array azul = formas azules
  amarillo = new Forma (arrayAmarillo[int(random(0, 5))]);// Forma (objeto) + Array amarillo = formas amarillas
}



void draw() {
  background(255);// esto es para que no se vea el de atras cuando varie el tamaño
  //azul.dibujar();
  //rojo.dibujar();
  amarillo.dibujar();
}
