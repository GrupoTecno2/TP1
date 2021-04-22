  PImage [] rojo = new PImage [11];
  PImage [] amarillo = new PImage [6];//numero de figuras de rojo
  PImage [] azul = new PImage [20];//numero de figuras de rojo
  int valorRojo, valorAzul, valorAmarillo;
  float estado;

float x, y,w;
float spdX,spdY,theta,rotSpd;
float cornerRadiusOffset, dynamicRadius, collisionTheta;

int contador = 150;
int contadorQueSeDetiene = 300;
color c = color(random(255), random(255), random(255));
color c2 = color(random(255), random(255), random(255));
float tam,tam2;

void setup(){
  size(800,800);
  w = 250;
  spdX= 0.5;
  spdY=0.5;
  rotSpd = PI/180;
  estado = int(random(1, 4));
  
  for ( int j = 1; j < rojo.length; j++ ) {
      rojo [j]  = loadImage("rojo"+ j +".png");
    }
    for ( int j = 1; j < amarillo.length; j++ ) {
      amarillo [j]  = loadImage("amarillo"+ j +".png");
    } 
    for ( int j = 1; j < azul.length; j++ ) {
      azul [j]  = loadImage("azul"+ j +".png");
    }
    valorRojo = int(random(1, 11));
    valorAzul = int(random(1, 20));
    valorAmarillo = int(random(1, 6));
}
void draw(){
  background(255);
  translate(width/2.0,height/2.0);
  float angulo = map(mouseX,0,width,0,360);
  float dx = cos(radians(angulo));
  float dy = sin(radians(angulo));
  
  x = x+dx;
  y = y+dy;
  tam = map(mouseX,0,width,0,360);//x+dx;
  tam2 = y+dy;
  if(contador<=0){
    c = color(random(255), random(255),random(255));
    tam = map(mouseX,0,width,0,360);
    contador = 150;
  }
  
  if(estado==1){
    pushMatrix();
   translate(x,y);
   rotate(theta);
   fill(c);
   //tint(c);
   image(rojo[valorRojo],-w/2,-w/2,tam,tam);
   popMatrix();
  } else if (estado==2) {
    pushMatrix();
    translate(x,y);
    rotate(theta);
    fill(c);
    //tint(c);
    image(azul[valorAzul],-w/2,-w/2,tam,tam);
    popMatrix();
 } else if (estado==3) {
   pushMatrix();
    translate(x,y);
    rotate(theta);
    fill(c);
    //tint(c);
    image(amarillo[valorAmarillo],-w/2,-w/2,tam,tam);
  popMatrix();
   x+= spdX;
  y+= spdY;
  theta +=rotSpd;
  //Colision();
  
  if(contadorQueSeDetiene>=0){
    c2 = color(random(255),random(255),random(255));
    tam = map(mouseX,0,width,0,360);
  }
  //pushMatrix();
  translate(x,y);
  rotate(theta);
  fill(c2);
  rect(x+100,y,tam,tam);
  //popMatrix();
  contador--;
  contadorQueSeDetiene--;
 }
  
}
void espacioToroidal(){
  if(x>=width){
    x=0;
  }
  if(x<=0){
    x=width-1;
  }
  if(y>=height){
    y=0;
  }
  if(y<=0){
    y=height-1;
  }
}

/*void Colision(){
  
  cornerRadiusOffset = w/2/cos(PI/4)-w/2;
  dynamicRadius = abs(sin(collisionTheta)*cornerRadiusOffset);
  if(x>width - w/2 - dynamicRadius){
    spdX *=-1;
    rotSpd *=-1;
  }
  else if(x<w/2+ dynamicRadius){
    spdX *=-1;
    rotSpd *=-1;
  }
  if(y>height - w/2 - dynamicRadius){
    spdY *=-1;
    rotSpd *=-1;
  }
  else if(y <w/2 + dynamicRadius){
    spdY *=-1;
    rotSpd *=-1;
  }
  collisionTheta +=rotSpd *2;
}*/
