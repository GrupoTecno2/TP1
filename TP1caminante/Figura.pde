class Figura {
  float x, y, tam;
  float vel, direc;
  String estado;
  float cont =0;
  color c;

  Figura(color c_) {
    estado ="inicio";
    x= width/2;
    y= height/2;
    tam= 100;
    vel=1;
    direc =int (random(0, 30));
    c=c_;
    
  }

  void dibujar() {

    if (estado.equals ("inicio")) {
        pushStyle();
        noStroke();
        fill(c);
        rect(x, y, tam, tam);
        popStyle();
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

  void cambio(color c_) {
    actualizar();
    c = c_;
  }

  void actualizar() {
    direc=int (random(0, 360));
    tam=tam+int(random(-5, 5));

    if (cont>=50 && mousePressed) {
      cont=0; 
      estado ="inicio";
      x= width/2;
      y= height/2;
     actualizar();
    }
  }
  
}
