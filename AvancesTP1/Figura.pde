class Figura {

  //------------------------------------------  PROPIEDADES ----------------------------------------------
  
  float x, y;
  float tam;
  GestorDeInteraccion g;
  float estado;
  PImage [] rojo = new PImage [11];
  PImage [] amarillo = new PImage [6];//numero de figuras de rojo
  PImage [] azul = new PImage [20];//numero de figuras de rojo
  int valorRojo, valorAzul, valorAmarillo;

  Figura() {

    x =random(0.3 * width, 0.6 * width);
  y =random(0.3 *height, 0.6 * height);
    g = new GestorDeInteraccion();
    tam =100;
    estado = int(random(1, 4));

    for ( int j = 1; j < rojo.length; j++ ) {
      rojo [j]  = loadImage("rojo"+ j +".png");
    }
    for ( int j = 1; j < amarillo.length; j++ ) {
      amarillo [j]  = loadImage("amarillo"+ j +".png");
    } 
    for ( int j = 1; j < azul.length; j++ ) {
      azul [j]  = loadImage("azul"+ j +".png");
    }
    valorRojo = int(random(1, 11));
    valorAzul = int(random(1, 20));
    valorAmarillo = int(random(1, 6));
  }

  //------------------------------------------  MÉTODOS ---------------------------------------------- 

  void dibujar () {//
    imageMode(CENTER);
    if (estado==1) {
      image(rojo[valorRojo], x, y, tam, tam);//
    } else if (estado==2) {
      image(azul[valorAzul], x, y, tam, tam);//
    } else if (estado==3) {
      image(amarillo[valorAmarillo], x, y, tam, tam);//
    }

    g.actualizar();
    
    if (g.arriba) {
      println("arriba");
    } else if (g.abajo) {
      println("abajo");
    }
    if (g.derecha) {
      println("derecha");
    } else if (g.izquierda) {
      println("izquierda");
    }

    //para la parte de velocidad(grande o pequena)
    if (g.movGrande) {
      tam++;
      ;
    } else if (g.movPeque) {
      tam =(tam-1);
    }
  }


}
