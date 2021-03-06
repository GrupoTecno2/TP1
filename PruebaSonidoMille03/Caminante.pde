
class Caminante {

  Paleta pRoja,pAzul,pAmarilla;
  OscP5 osc2;
  
  
float MIN_AMP = 60;
float MAX_AMP = 80;

float MIN_PITCH = 60;
float MAX_PITCH = 90;

float GRADO_VARIACION = 10;

   float fAmortiguacion = 0.9;
  
  float amp, pitch;
  
  float x, y;
  float tam;

  float dir, vel;

  color c;
  float op;

  PImage textura;
  int porciones = 40;
  int cualPorcion = 0;

  float xa, ya, xd, yd;
  boolean yaTengoCuatrosPuntos = false;
  String estado;
  long marcaEnElTiempo;
  float avance;

  float radio;

  boolean haySonido;
  boolean antesHabiaSonido;

  //float variacionAngular;

  //------------rebote--------------

  float xAnterior, yAnterior;
  int dirX, dirY ;

  Caminante( color c_) {
    
    //-----Carga de paletas-----------
   pRoja = new Paleta("rojo.jpeg");
   pAzul = new Paleta("azul.jpeg");
   pAmarilla = new Paleta("amarillo.jpeg");

    //------------posición--------------
    x= random(width*0.40, width*0.60);
    y= random(height*0.40, height*0.60);
    tam = random(180, 200);

    dir = radians( random( 360 ) );
    vel = 4;

    //------------rebote--------------
    dirX = 1 ; 
    dirY = 1 ;

    //------------color--------------
    c=c_;
    op = random(80, 100);

    //------------textura--------------
    textura = loadImage ("brocha.png");
    textura.filter(INVERT);
    porciones = 500; 
    cualPorcion =0;

    //------------estado interno-------
    estado = "cambio";    

    //------------sonido---------------
    haySonido = false;
    antesHabiaSonido = false;
  }

  void actualizar(float amp, float pitch) {

    haySonido = amp > 0;

    boolean empezoElSonido = haySonido && !antesHabiaSonido;
    boolean terminoElSonido = !haySonido && antesHabiaSonido;

    if (empezoElSonido) {
        cambiarAngulo();
      if(paletaRoja()){
        cambiarColor(pRoja.darUnColor());
        cambiarAngulo();
      }else if(paletaAzul()){
        cambiarColor(pAzul.darUnColor());
        cambiarAngulo();
      }else if(paletaAmarilla()){
        cambiarColor(pAmarilla.darUnColor());
        cambiarAngulo();
      }
      //yaTengoCuatrosPuntos = false;
    }

    if (haySonido) {

      mover();
      //radio = map(amp, 0, 1, 10, 100);
      //variacionAngular = radians(pitch * GRADO_VARIACION);

      }

      else if (terminoElSonido) {
      }

    antesHabiaSonido = haySonido;
  }

  void cambiarAngulo() {
   
    if( pitch >= 50 && pitch <= 60){
      dir += radians (random(181,359));
      println("abajo", "grave");
    }else if (pitch > 60 && pitch <=85){
      dir += radians(random(0,180));
      println("arriba", "agudo");
    }

   // dir += radians(random(40, 170));
    tam= tam +int(random(-5, 5));
    op=random(80, 100);
  }
  
  void cambiarColor(color c_){
    c = c_;
    
  }

  void mover() {

    //------------movimiento--------------
    xAnterior = x;
    yAnterior = y;
    x=x+vel*cos(dir)*dirX;
    y=y+vel*sin(dir)*dirY;

    //------------rebote--------------
    if (x >= width - 100 && xAnterior <= width - 100 || x<50 && xAnterior <= width + 50) {

      dirX = dirX*-1;
    }

    if (y >= height - 50 && yAnterior <= height - 50 || y<=100 && yAnterior <= height + 100) {

      dirY = dirY*-1;
    }

    //if ( x>width || x<0 || y>height || y<0 ) {
    //  yaTengoCuatrosPuntos = false;
    //}
  }

  void dibujarTrazo() {

    cualPorcion = (cualPorcion+1) % porciones;
    float anchoNorm = 1.0/porciones;

    float u1 = map(cualPorcion, 0, porciones, 0, 1);    
    float v1 = 0;

    float u2 = u1+anchoNorm;    
    float v2 = 0;

    float u3 = u2;    
    float v3 = 1;

    float u4 = u1;    
    float v4 = 1;

    float radio = tam;

    float angulo = radians(-90)+dir;
    float xb = 0 * cos( angulo ) + x;
    float yb = 0 * sin( angulo ) + y;

    angulo = radians(90)+dir;
    float xc = radio * cos( angulo ) + x;
    float yc = radio * sin( angulo ) + y;

    //texturizar
    if ( yaTengoCuatrosPuntos ) {

      pushStyle();
      colorMode( HSB, 360, 100, 100,100 );
      tint(c,op);
      //-----------------color pata figura de prueba ---------------------
      //colorMode( HSB );
      //color colorActual = lerpColor( elColorOrigen, elColorDestino, avance );
      //tint( colorActual );
      noStroke();

      beginShape();
      textureMode(NORMAL);
      texture(textura);
      vertex(xa, ya, u1, v1);
      vertex(xb, yb, u2, v2);
      vertex(xc, yc, u3, v3);
      vertex(xd, yd, u4, v4);
      endShape();

      popStyle();
    }

    xa = xb;
    ya = yb;
    xd = xc;
    yd = yc;
    yaTengoCuatrosPuntos = true;
  }
  
  void oscEvent ( OscMessage m ){

  if(m.addrPattern().equals("/amp")){
  
    amp = m.get(0).floatValue();
  }
  if(m.addrPattern().equals("/pitch")){
  
    pitch = m.get(0).floatValue();
  }
}

}
