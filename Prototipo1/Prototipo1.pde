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
 rojo = loadImage("img1.png");
 }else if(num==1){
 rojo = loadImage("img2.png");
 }else if (num==2){
 rojo = loadImage("img3.png");
 }else if(num==3){
 rojo = loadImage("img4.png");
 }else if(num==4){
 rojo = loadImage("img5.png");
 }else if (num==5){
 rojo = loadImage("img6.png");
 }else if (num==6){
 rojo = loadImage("img7.png");
 }else if (num==7){
 rojo = loadImage("img8.png");
 }else if (num==8){
 rojo = loadImage("img9.png");
 }else if (num==9){
 rojo = loadImage("img10.png");
 }else if (num==10){
 rojo = loadImage("img11.png");
 }
 
}

void draw(){
  g.actualizar();
  background(255);
     
  if (mouseX>=width/2){
    if(mouseY>=height/2){
    image (rojo,random(width/2,width),random(0,height/2));
  }
  }else if(mouseX<=width/2){
    if(mouseY<=height/2){
      image (rojo,random(0,width/2),random(height/2,height));
    }
  }
  
  /*if(g.arriba){
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
  }*/
  
  
   }
  
