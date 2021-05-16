import oscP5.*;

//-----Figuras

Paleta pRoja,pAzul,pAmarilla;
Caminante fRoja,fAzul,fAmarilla;

//----CALIBRACION

float MIN_AMP = 60;
float MAX_AMP = 80;

float MIN_PITCH = 60;
float MAX_PITCH = 90;

float GRADO_VARIACION = 10;

float fAmortiguacion = 0.9;

boolean monitor = false;

//---------

float amp, pitch;

OscP5 osc;

GestorSenial gAmp, gPitch;

//------- propiedades de set up---------

color fondo ;
int paleta;

void setup(){
  size( 800 , 600, P3D ); 
  colorMode(HSB, 360, 100, 100);

   //-----Carga de paletas-----------
   pRoja = new Paleta("rojo.jpeg");
   pAzul = new Paleta("azul.jpeg");
   pAmarilla = new Paleta("amarillo.jpeg");
   
    //-----Carga de caminantes-----------
   fRoja= new Caminante(pRoja.darUnColor());
   fAzul= new Caminante(pAzul.darUnColor());
   fAmarilla= new Caminante(pAmarilla.darUnColor());
   
   paleta = int(random(1, 4));
   color(61,random(5,10),random(95,100));
   background(fondo);
  
  osc = new OscP5(this, 12345);
  
  gAmp = new GestorSenial(MIN_AMP, MAX_AMP, fAmortiguacion);
  gPitch = new GestorSenial(MIN_PITCH, MAX_PITCH, fAmortiguacion);
  
}
void draw(){
  
  gAmp.actualizar(amp);
  gPitch.actualizar(pitch);
  
  if(paleta==1){
  fRoja.actualizar(gAmp.filtradoNorm(), gPitch.derivadaNorm());
  fRoja.dibujarTrazo();
  
  } if(paleta==2){
  fAzul.actualizar(gAmp.filtradoNorm(), gPitch.derivadaNorm());
  fAzul.dibujarTrazo();
  
  }if(paleta==3){
  fAmarilla.actualizar(gAmp.filtradoNorm(), gPitch.derivadaNorm());
  fAmarilla.dibujarTrazo();
  }
  
  if(monitor){
   //gAmp.imprimir(50, 100);
   //gPitch.imprimir(50, 220, 500, 100, false, true);  
  }
}

void oscEvent ( OscMessage m ){

  if(m.addrPattern().equals("/amp")){
  
    amp = m.get(0).floatValue();
  }
  if(m.addrPattern().equals("/pitch")){
  
    pitch = m.get(0).floatValue();
  }
}
