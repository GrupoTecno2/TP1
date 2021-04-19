PImage rojo;
int num;
GestorDeInteraccion g;
Dir_y_Vel mouse;
void setup(){
 size(1200,600); 
 g = new GestorDeInteraccion();
 mouse = new Dir_y_Vel();

 //PImage [] rojo = new PImage [num];
 num = int(random(0,12));
 if(num==0){
 rojo = loadImage("img01.png");
 }else if(num==1){
 rojo = loadImage("img02.png");
 }else if (num==2){
 rojo = loadImage("img03.png");
 }else if(num==3){
 rojo = loadImage("img04.png");
 }else if(num==4){
 rojo = loadImage("img05.png");
 }else if (num==5){
 rojo = loadImage("img06.png");
 }else if (num==6){
 rojo = loadImage("img07.png");
 }else if (num==7){
 rojo = loadImage("img08.png");
 }else if (num==8){
 rojo = loadImage("img09.png");
 }else if (num==9){
 rojo = loadImage("img10.png");
 }else if (num==10){
 rojo = loadImage("img11.png");
 }
 
}

void draw(){
  g.actualizar();
  background(255);
     
  //Esta parte del codigo fue un intento de hacer aparecer las imagenes segun la 
  //ubicacion del mouse(fue antes de crear las dos clases) pero no funciona del todo 
  //bien pero lo dejo comentado por si la idea sirve en algun momento
  /*if (mouseX>=width/2){
    if(mouseY>=height/2){
    image (rojo,random(width/2,width),random(0,height/2));
  }
  }else if(mouseX<=width/2){
    if(mouseY<=height/2){
      image (rojo,random(0,width/2),random(height/2,height));
    }
  }*/
  
  
  //para determinar la direccion(arriba,abajo,derecha,izquierda)
  if(g.arriba){
    println("arriba");
  }
  if(g.abajo){
    println("abajo");
  }
  if(g.derecha){
    println("derecha");
  }
  if(g.izquierda){
    println("izquierda");
  }
  
  //para la parte de velocidad(grande o pequena)
  if(g.movGrande){
    background(255,0,0);
  }else if(g.movPeque){
    background(0,255,0);
  }
  
  
   }
  
