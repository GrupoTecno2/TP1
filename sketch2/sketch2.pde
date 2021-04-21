String crecer;
int num;
GestorDeInteraccion g;
Dir_y_Vel mouse;

// declaro un objeto forma de tipo azul
Forma azul, amarillo, rojo;

//declaro arreglo azul, amarillo, rojos y trazos(?
PImage arrayAzul[], arrayAmarillo[], arrayRojo[];

void setup(){
 size(1200,600); 
 
 g = new GestorDeInteraccion();
 mouse = new Dir_y_Vel();
 
 //// declaración de arreglos (un arreglo por color)

  arrayAzul =new PImage[20];//-------------- ARREGLO AZUL!!!!!!
  for (int i =1; i<20; i ++) {
   arrayAzul [i]=loadImage("azul"+i+".png");
  }

  arrayAmarillo =new PImage[6];//-------------- ARREGLO AMARILLO!!!!!!
  for (int i =1; i<6; i ++) {
    arrayAmarillo [i]=loadImage("amarillo"+i+".png");
  }
   arrayRojo =new PImage[11];//-------------- ARREGLO ROJO!!!!!!
   for (int i =1; i<11; i ++) {
   arrayRojo [i]=loadImage("rojo"+i+".png");
   }
   
}

void draw(){
  g.actualizar();
 // background(255);
  //para determinar la direccion(arriba,abajo,derecha,izquierda)
  if(g.arriba){
    println("arriba");
    
    amarillo.dibujar( random(45, 190),random(0.2,0.4),random (0.4*width, width*0.6),random(0.4*height,height*0.6));
  }
  if(g.abajo){
    println("abajo");
   azul.dibujar(random(45, 190),random(0.2,0.4),random (0.4*width, width*0.6),random(0.4*height,height*0.6));
  }
  if(g.derecha){
    println("derecha");
    rojo.dibujar(random(45, 190),random(0.2,0.4),random (0.4*width, width*0.6),random(0.4*height,height*0.6));
  }
  if(g.izquierda){
    println("izquierda");
    amarillo.dibujar(random(45, 190),random(0.2,0.4),random (0.4*width, width*0.6),random(0.4*height,height*0.6));
  }
  
    //INICIALIZACIÓN DE OBJETOS
  amarillo = new Forma (arrayAmarillo[int(random(1, 6))]);// Forma (objeto) + Array amarillo = formas amarillas
  azul = new Forma (arrayAzul[int(random(1, 20))]);// Forma (objeto) + Array azul = formas azules
  rojo = new Forma (arrayRojo[int(random(1, 11))]);// Forma (objeto) + Array azul = formas azules

  
  
}
  
