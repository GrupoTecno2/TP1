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
color fondo = color(61,random(5,10),random(95,100));

void setup() {
  size(800, 1000,P3D);
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
  estado2 ="inicio";
  
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
}

void draw() {
 if(paleta==1){
  fRoja.texturizar();
 } if(paleta==2){
   fAzul.texturizar();
 }if(paleta==3){
   fAmarilla.texturizar();
 }
  println(paleta);
cont2= cont2+0.05; 
 if (cont2>=40) {
      estado2 ="reinicio";
      if (estado2.equals("reinicio")&& cont2>=45) {
        paleta = int(random(1, 4));
        reiniciar();
        fondo = lerpColor(fondo,color(61,random(5,15),random(90,100)),0.2);
        background(fondo);
      }
    }
}
void mouseMoved(){
  if(paleta==1){
  fRoja.mov();
 }else if(paleta==2){
   fAzul.mov();
 }else if(paleta==3){
   fAmarilla.mov();
 }
}
void mousePressed() {
  if(paleta==1){
  fRoja.cambio(pRoja.darUnColor());
 }else if(paleta==2){
   fAzul.cambio(pAzul.darUnColor());
 }else if(paleta==3){
   fAmarilla.cambio(pAmarilla.darUnColor());
 }
}
void reiniciar(){
  
  if (cont2>=50 && mousePressed) {
      cont2=0; 
      
      estado2 ="inicio";
      reiniciar();
    }
}
