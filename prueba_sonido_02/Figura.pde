class Figura {

  float x, y, tam;
  float vel, direc;
  String estado;
  float cont =0;
  color c;
  float op;
  
  PImage textura;
  int porciones, cualPorcion;
  
  float xa, ya, xd, yd;
  boolean yaTengoCuatrosPuntos = false;
  String estadoText;
  long marcaEnElTiempo;
  float avance;
  
  boolean haySonido;
  boolean antesHabiaSonido;
  
  boolean empezoElSonido = haySonido && !antesHabiaSonido;
  boolean terminoElSonido = !haySonido && antesHabiaSonido;

  float umbralAmp = 42;
  float MIN_AMP = umbralAmp;
  float MAX_AMP = 95;

  float MIN_PITCH= 50;
  float MAX_PITCH = 80;
  
  float fAmortiguacion = 0.9;
  
  float radio;

  float variacionAngular;

  Figura(color c_) {
    
    estado ="inicio";
    x= random(width*0.40,width*0.60);
    y= random(height*0.40,height*0.60);
    tam= random(200,400);
    vel=1;
    direc =int (radians(random(0, 360)));
    c=c_;
    op = random(90,100);
    
    textura = loadImage ("brocha.png");
    textura.filter(INVERT);
    porciones = 500; 
    cualPorcion =0;
    
     haySonido = amp > umbralAmp;
     haySonido = false;
     antesHabiaSonido = false;
  }

  void dibujar() {

    if (estado.equals ("inicio")) {
        pushStyle();
        noStroke();
        fill(c);
        rect(x, y, tam, tam,5);
        popStyle();
    }
    cont= cont+0.02; 

    println("contador ="+ cont);  
    if (cont>=40) {
      estado ="reinicio";
      if (estado.equals("reinicio")&& cont>=45) {
        actualizar();
        background(61,random(5,10),random(95,100));
      }
    }
  }

  void mov() {
    
    direc += variacionAngular;

    float dx = vel * cos( direc );
    float dy = vel * sin( direc );

    x = x + dx;
    y = y + dy;

    if ( x>width || x<0 || y>height || y<0 ) {
      yaTengoCuatrosPuntos = false;
    }

    //espacio toroidal
    x = ( x>width ? x-width : x );
    x = ( x<0 ? x+width : x );
    y = ( y>height ? y-height : y );
    y = ( y<0 ? y+height : y );
    
    if (haySonido) {

      radio = map(amp, 0, 1, 10, 20);
      variacionAngular = radians(pitch * GRADO_VARIACION);
    }
    //x=x+vel*cos(direc);
    //y=y+vel*sin(direc);
  }

  void cambio(color c_) {
    if(empezoElSonido){
    actualizar();
    c = c_;
    }
  }

  void actualizar() {
    //direc+= radians (random(130, 360));
    direc += radians(random(40, 170));
    tam=tam+int(random(-10, 20));
    op=random(80,100);

    if (cont>=50) {
      cont=0; 
      estado ="inicio";
      x= width/2;//random(width*0.25,width*0.75);
      y= height/2;//random(height*0.25,height*0.75);
      tam = random(200,300);
    }
  }
  void texturizar() {

    cualPorcion = (cualPorcion+1) % porciones;
    float anchoPorcion = 1.0/porciones;

    float u1 = map(cualPorcion, 0, porciones, 0, 1);    
    float v1 = 0;

    float u2 = u1+anchoPorcion;    
    float v2 = 0;

    float u3 = u2;    
    float v3 = 1;

    float u4 = u1;    
    float v4 = 1;

    float radio = tam;
    float angulo = radians(-90)+direc;
    float xb = 0 * cos( angulo ) + x;
    float yb = 0 * sin( angulo ) + y;

    angulo = radians(90)+direc;
    float xc = radio * cos( angulo ) + x;
    float yc = radio * sin( angulo ) + y;

    //texturizar
    if ( yaTengoCuatrosPuntos ) {

      pushStyle();
      //colorMode(RGB);
      //tint(255,200);
      colorMode( HSB, 360, 100, 100,100 );
      tint(c,op);
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
