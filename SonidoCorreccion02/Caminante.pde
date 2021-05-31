
class Caminante {

  Paleta pRoja, pAzul, pAmarilla;

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
  //int dirX, dirY ;
  float dirX, dirY;
  boolean pausado;
  int rebotes;

  Caminante( color c_) {

    //-----Carga de paletas-----------
    pRoja = new Paleta("rojo.jpeg");
    pAzul = new Paleta("azul.jpeg");
    pAmarilla = new Paleta("amarillo.jpeg");

   

    //------------color--------------
    c=c_;
    op = random(80, 100);

    play();
    
  }

  void play () {
  
   //------------posición--------------
    x= random(width*0.40, width*0.60);
    y= random(height*0.40, height*0.60);
    tam = random(270, 300);

    dir = radians( random( 360 ) );
    vel = 8;
    //float cont = 0;

    //------------rebote--------------
    dirX = 1 ; 
    dirY = 1 ;
    //rebotes = 0;

    //------------color--------------
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
    
    pausado = false;
    
  }
  
  void actualizar(float amp) {
    
    cont = cont+0.04; 

    haySonido = amp > 0;

    boolean empezoElSonido = haySonido && !antesHabiaSonido;
    boolean terminoElSonido = !haySonido && antesHabiaSonido;

    if ((empezoElSonido)&&(cont ==5)){
      cambiarAngulo();
      cambiarOpacidad(amp);
      println("cont:", cont);
      cont =0;
      //rebotes+=1;
      if (paletaRoja()) {
        cambiarColor(pRoja.darUnColor());
      } else if (paletaAzul()) {
        cambiarColor(pAzul.darUnColor());
      } else if (paletaAmarilla()) {
        cambiarColor(pAmarilla.darUnColor());
      }
      //yaTengoCuatrosPuntos = false;
    }

    if (haySonido) {

      mover();
      
    } else if (terminoElSonido) {
    }

    antesHabiaSonido = haySonido;
    
    /*if(rebotes==3){
      pausa();
    }*/
      
  }

  void cambiarAngulo() {
    dir += radians(map(gPitch.filtradoNorm(), 0, 1, 40, 250));
    tam=tam+int(random(-5, 5));
  }

  void cambiarOpacidad(float amp) {

    op= 100 + (amp*200);
    println("opacidad", op);
  }

  void pausa() {

    vel = 0;
    dir = (dir+0);
    pausado = true;
    
  }

  void cambiarColor(color c_) {
    c = c_;
  }

  void mover() {

    //------------movimiento--------------
    xAnterior = x;
    yAnterior = y;
    x=x+vel*cos(dir)*dirX;
    y=y+vel*sin(dir)*dirY;

    //------------rebote--------------
    if (x >= width - 100 && xAnterior <= width - 100 || x<150 && xAnterior <= width + 150) {
    //rebotes+=1;
      cambiarAngulo();
      //dirX = dirX*-1;
      if (paletaRoja()) {
        cambiarColor(pRoja.darUnColor());
      } else if (paletaAzul()) {
        cambiarColor(pAzul.darUnColor());
      } else if (paletaAmarilla()) {
        cambiarColor(pAmarilla.darUnColor());
      }
    }

    if (y >= height - 150 && yAnterior <= height - 150 || y<=100 && yAnterior <= height + 100) {
    //rebotes+=1;
      //dirY = dirY*-1;
      cambiarAngulo();
      if (paletaRoja()) {
        cambiarColor(pRoja.darUnColor());
      } else if (paletaAzul()) {
        cambiarColor(pAzul.darUnColor());
      } else if (paletaAmarilla()) {
        cambiarColor(pAmarilla.darUnColor());
      }
    }

  }

  void dibujarTrazo() {

    if(!pausado){
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

    float radio = tam/2;

    float angulo = radians(-90)+dir;
    float xb = 0 * cos( angulo ) + x;
    float yb = 0 * sin( angulo ) + y;

    angulo = radians(90)+dir;
    float xc = radio * cos( angulo ) + x;
    float yc = radio * sin( angulo ) + y;

    //texturizar
    if ( yaTengoCuatrosPuntos ) {

      pushStyle();
      colorMode( HSB, 360, 100, 100, 100 );
      tint(c, op);
      //-----------------color para figura de prueba ---------------------
     
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
  }
}
