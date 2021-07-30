import fisica.*;

FWorld mundo;
//Nuevo


Bola fb;
ArrayList <Plataforma> plataformas;

void setup() {

  size(600, 800);

  Fisica.init(this);
  mundo = new FWorld();
  mundo.setEdges(color(#B7922A));

  //PERSONAJE
  fb = new Bola(50);
  fb.inicializar(width/2, height/2);
  mundo.add(fb);
  mundo.add(fb);

  //PISO INICIAL BASE
  Plataforma piso=new Plataforma (width, 30);
  piso.inicializar(width/2, height-15);
  mundo.add(piso);
  
  //PLATAFORMAS VARIAS
  plataformas = new ArrayList <Plataforma>();
  for (int i = 0; i < 6; i++){
    
    Plataforma p = new Plataforma(200,50);
    float _x = (i * random(0,200) - 50);
    float _y = (i * height/5 - 50);
    p.inicializar(_x, _y);
    // lo de arriba lo hice asi para que cuando se efectúe el primer contacto 
    //de la bola con la parte superior de un escalon, pasen a restar su posicion con cada frame
    // quedaria algo como _y=_y - 1; , de esta forma parece que suben o se van corriendo
    // Si no habria que investigar alguna funcion de la
    // libreria que haga que todos los escalones suban a unavelocidad constante y pareja
    mundo.add(p);
    plataformas.add(p);
  }
 
  

}

void draw() {
  background(#B7922A);


  mundo.step();
  mundo.draw();
 



}
void keyPressed(){
  if (key=='a'){
    //atraer();
   repelerIzq();
   println("Repele desde la IZQ");
  }
  if (key=='d'){
   repelerDer(); 
   println("Repele desde la DER");
  }
}
