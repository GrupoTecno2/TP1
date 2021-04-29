class Figura {
  float x, y, tam;
  float vel, direc;
  float hA, hR, hAm, s, b, op;
  int paleta;
  String estado;
  float cont =0;

  PImage textura;
  int porciones, cualPorcion;

  float xa, ya, xd, yd;
  boolean yaTengoCuatrosPuntos = false;
  String estadoText;
  long marcaEnElTiempo;
  float avance;

  Figura() {
    estado ="inicio";
    //x= width/2;
    //y= height/2;
    x = random(width*0.25, width*0.75);
    y = random(height*0.25, height*0.75) ;
    tam= random(200, 300);
    vel=2;
    direc =int (radians(random(0, 360)));

    hA=random(180, 265);
    hR=random(0, 10);
    hAm=random(50, 65);
    s=random(80, 100);
    b=random(map(mouseY, 0, width, 0, 100));
    op=100;
    paleta= int(random(1, 4));

    textura = loadImage ("textura2.png");
    porciones = 100; 
    cualPorcion =0;
  }

  void dibujar() {

    if (estado.equals ("inicio")) {
      if (paleta==1) {
        pushStyle();
        noStroke();
        fill(hA, s, b, op );
        rect(x, y, tam, tam, 5);
        popStyle();
      } else if (paleta==2) {
        pushStyle();
        noStroke();
        fill(hR, s, b, op );
        rect(x, y, tam, tam, 5);
        popStyle();
      } else if (paleta==3) {
        pushStyle();
        noStroke();
        fill(hAm, s, b, op );
        rect(x, y, tam, tam, 5);
        popStyle();
      }
    }
    cont= cont+0.05; 

    println("contador ="+ cont);  
    if (cont>=40) {
      estado ="reinicio";
      if (estado.equals("reinicio")&& cont>=45) {
        actualizar();
        background(255, 0, 100);
      }
    }
  }

  void mov() {
    x=x+vel*cos(direc);
    y=y+vel*sin(direc);
  }

  void cambio() {
    actualizar();
  }

  void actualizar() {
    direc=int (radians(random(70, 360)));
    tam=tam+int(random(-10, 20));
    //tono
    hA=random(180, 255);
    hR=random(0, 10);
    hAm=random(50, 65);
    //saturacion
    s=random(80, 100);
    //grises
    b= map(mouseY, 0, width, 0, 100);
    //opasidad
    op = map(mouseX, 0, width, 0, 100);

    if (cont>=50 && mousePressed) {
      cont=0; 
      estado ="inicio";
      paleta= int(random(1, 4));
      x= width/2;
      y= height/2;
      tam= random(200, 300);
      actualizar();
    }
  }
  //void textura() {
  //pushStyle();
  //      noStroke();
  //      fill(hA, s, b, op );
  //      image(textura, x, y, tam, tam);
  //      popStyle();
  // }

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

    float radio = tam/2;
    float angulo = radians(-90)+direc;
    float xb = radio * cos( angulo ) + x;
    float yb = radio * sin( angulo ) + y;

    angulo = radians(90)+direc;
    float xc = radio * cos( angulo ) + x;
    float yc = radio * sin( angulo ) + y;

    //texturizar
    if ( yaTengoCuatrosPuntos ) {

      pushStyle();
      colorMode( HSB, 360, 100, 100 );
      tint(360);
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
