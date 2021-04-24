class Figura {
  float x, y, tam;
  float vel, direc;
  float hA, hR, hAm, s, b, op;
  int paleta;
  String estado;
  float cont =0;


  Figura() {
    estado ="inicio";
    x= width/2;
    y= height/2;
    tam= 100;
    vel=1;
    direc =int (random(0, 30));

    hA=random(180, 265);
    hR=random(0, 10);
    hAm=random(50, 65);
    s=random(80, 100);
    b=random(80, 100);
    op=100;
    paleta= int(random(1, 4));
  }

  void dibujar() {

    if (estado.equals ("inicio")) {
      if (paleta==1) {
        pushStyle();
        noStroke();
        fill(hA, s, b, op );
        rect(x, y, tam, tam);
        popStyle();
      } else if (paleta==2) {
        pushStyle();
        noStroke();
        fill(hR, s, b, op );
        rect(x, y, tam, tam);
        popStyle();
      } else if (paleta==3) {
        pushStyle();
        noStroke();
        fill(hAm, s, b, op );
        rect(x, y, tam, tam);
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
    direc=int (random(0, 360));
    tam=tam+int(random(-5, 5));
    hA=random(180, 255);
    hR=random(0, 10);
    hAm=random(50, 65);
    s=random(80, 100);
    b=random(80, 100);
    op=random(5, 40);

    if (cont>=50 && mousePressed) {
      cont=0; 
      estado ="inicio";
      paleta= int(random(1, 4));
      x= width/2;
      y= height/2;
     actualizar();
    }
  }
  //void mouse(){
  //  if (){
  //    vel=+1;
  //  }
  //}
}
