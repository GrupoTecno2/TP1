class Figura {
  float x1, x2, x3, x4;
  float y1, y2, y3, y4;
  float tam = 20;
  float hA, hR, hAm, s, b, op;
  int paleta;




  Figura(int paleta) {
    noStroke();

    x1=(width/2)-tam*2-50;
    x2=(width/2)+tam*2+50;
    x3=(width/2)+tam*2+50;
    x4=(width/2)-tam*2-50;
    y1=(0.4*height)-tam;
    y2=(0.4*height)-tam;
    y3=(0.6*height)+tam;
    y4=(0.6*height)+tam;
    this.paleta=paleta;

    hA=random(180, 265);
    hR=random(0, 10);
    hAm=random(50, 65);
    s=random(80, 100);
    b=random(80, 100);
    op=random(80, 100);
  }
  void dibujar() {
    if (paleta==1) {
      pushStyle();

      fill(hA, s, b, op );
      beginShape();
      vertex(x1, y1);
      vertex(x2, y2);
      vertex(x3, y3);
      vertex(x4, y4);
      endShape(CLOSE);
      popStyle();
    } else if (paleta==2) {
      pushStyle();

      fill(hR, s, b, op );
      beginShape();
      vertex(x1, y1);
      vertex(x2, y2);
      vertex(x3, y3);
      vertex(x4, y4);
      endShape(CLOSE);
      popStyle();
    } else if (paleta==3) {
      pushStyle();

      fill(hAm, s, b, op );
      beginShape();
      vertex(x1, y1);
      vertex(x2, y2);
      vertex(x3, y3);
      vertex(x4, y4);
      endShape(CLOSE);
      popStyle();
    }


    // DEBUG
    //fill(#F52D0A);//rojo
    //circle(x1,y1,10);
    //fill(#0A0FF5);//azul
    //circle(x2,y2,10);
    //fill(#4FFA08);//verde
    //circle(x3,y3,10);
    //fill(#050505);//negro
    //circle(x4,y4,10);
  }
  void mover() {//float nuevoValorX, float nuevoValorY
    tam= tam+ random(-2, 2);
    //x1=x1+nuevoValorX;
    //x2=x2+nuevoValorX;
    x3=x3+random(-5, 5);
    x4=x4+random(-5, 5);
    //y1=y1+nuevoValorY;
    //y2=y2+nuevoValorY;
    y3=y3+random(-5, 5);
    y4=y4+random(-5, 5);
  }
  //void actualizarXY (float nuevoValor){
  //   x1=x1+nuevoValor;
  //  x2=x2+nuevoValor;
  //  y1=y1+nuevoValor;
  //  y2=y2+nuevoValor;
  //}
}
