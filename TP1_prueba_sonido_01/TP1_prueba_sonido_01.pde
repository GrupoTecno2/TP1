//caminante que avanza con el movimiento del mouse (o con los sonidos), 
//al hacer click cambia de direccio, tono, opacidad, tamaño y saturacion.
// El usuario tiene 40 segundos para interactuar
// luego de ese tiempo, el programa se congela, y despues de 5segundos se reinicia
// vuelve a empezar al hacer click
GestorDeInteraccion g;
Dir_y_Vel mouse;
Figura fRoja,fAzul,fAmarilla;
Paleta pRoja,pAzul,pAmarilla;
int paleta;
float cont2 = 0;
String estado2;
color fondo ;
//---------prueba con sonido------------

import oscP5.*;
OscP5 osc;
float amp, pitch;

boolean haySonido = false;
boolean antesHabiaSonido = false;

//-----CALIBRACION-----

float umbralAmp = 42;
float MIN_AMP = umbralAmp;
float MAX_AMP = 95;

float MIN_PITCH= 50;
float MAX_PITCH = 80;


//--------------------------------------
void setup() {
  size(800, 1000,P3D);
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
  estado2 ="inicio";
  
  //---------prueba con sonido------------
  osc = new OscP5 (this, 12345);
  //--------------------------------------
  
   pRoja = new Paleta("rojo.jpeg");
   pAzul = new Paleta("azul.jpeg");
   pAmarilla = new Paleta("amarillo.jpeg");
   fRoja= new Figura(pRoja.darUnColor());
   fAzul= new Figura(pAzul.darUnColor());
   fAmarilla= new Figura(pAmarilla.darUnColor());
   paleta = int(random(1, 4));
   background(fondo);
   
   
   g = new GestorDeInteraccion();
   mouse = new Dir_y_Vel();
   
   fondo = color(61,random(5,10),random(95,100));
   background(fondo);
}

void draw() {
   
  //---------prueba con sonido------------
  boolean empezoElSonido = haySonido && !antesHabiaSonido;
  boolean terminoElSonido = !haySonido && antesHabiaSonido;
  
  haySonido = amp > umbralAmp;
  if (empezoElSonido) {//---------------------------> HAY SONIDO
   //---evento dibujar
 if(paleta==1){
  fRoja.texturizar();
  //---evento mover
  fRoja.mov();
 } if(paleta==2){
   fAzul.texturizar();
   //---evento mover
   fAzul.mov();
 }if(paleta==3){
   fAmarilla.texturizar();
   //---evento mover
   fAmarilla.mov();
 }
  }
  if (terminoElSonido){//---------------------------> NO HAY SONIDO
   if(paleta==1){
  fRoja.cambio(pRoja.darUnColor());
 }else if(paleta==2){
   fAzul.cambio(pAzul.darUnColor());
 }else if(paleta==3){
   fAmarilla.cambio(pAmarilla.darUnColor());
 }
  }
  
  //----------------fin prueba----------------------
  
  
//-------------------contador------------
 println(paleta);
 cont2= cont2+0.05; //contador que reinicia la paleta y el lienzo
 if (cont2>=40) {
      estado2 ="reinicio";
      if (estado2.equals("reinicio")&& cont2>=45) {
        paleta = int(random(1, 4));
        reiniciar();  
        background(fondo);
      }
    }
}
void reiniciar(){
  
  if (cont2>=50) {
      cont2=0; 
      estado2 ="inicio";
      reiniciar();
    }
}
void oscEvent(OscMessage m){
  if (m.addrPattern().equals("/amp")){
    amp=m.get (0).floatValue();
  }
   if (m.addrPattern().equals("/pitch")){
    pitch=m.get (0).floatValue();
  }
  
}
