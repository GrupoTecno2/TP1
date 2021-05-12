class Sonido {

  //=======================================
  //variables de calibración

  float minimoAmp = 45; 
  float maximoAmp = 100; 

  float minimoPitch = 83;
  float maximoPitch = 96;

  float f = 0.9;

  boolean monitor = true;
  //=======================================

  OscP5 osc; // declaracion del objeto osc

  float amp = 0.0;
  float pitch = 0.0;

  GestorSenial gestorAmp;
  GestorSenial gestorPitch;

  //------------------------------------------------------------------------------------------------------------

  //------------------------------------------------------------------------------------------------------------

  Sonido() {

    osc = new OscP5(this, 12345); // parametros: puntero a processing y puerto

    //inicialización
    //por defecto el rango es 0-100
    gestorAmp = new GestorSenial( minimoAmp, maximoAmp, f );
    gestorPitch = new GestorSenial( minimoPitch, maximoPitch, f );
    
  }

    //------------------------------------------------------------------------------------------------------------
    //---------------------------------------------------------------------------------------------------------------------------------- 

    void crear(){
      //en cada fotograma hay que actualizar
      gestorAmp.actualizar( amp );
      gestorPitch.actualizar( pitch );



      if (monitor) {
        gestorAmp.imprimir( 150, 150 );
        gestorPitch.imprimir( 150, 350, 500, 100, false, true);
      }

      /*
  float tam = 40;
       float posX = width/2 - 50;
       float posY = map(amp, minimoAmp, maximoAmp, height-40/2, 0);
       fill(200, 200, 200);
       ellipse(posX, posY, tam, tam);
       
       tam = 40;
       posX = width/2 + 50;
       posY = map(gestorAmp.filtradoNorm(), 0, 1, height-40/2, 0);
       fill(0, 255, 0);
       ellipse(posX, posY, tam, tam);
       */
    }

    void oscEvent( OscMessage m) {

      if (m.addrPattern().equals("/amp")) {
        amp = m.get(0).floatValue();
        //println("amp: " + amp);
      }

      if (m.addrPattern().equals("/pitch")) {
        pitch = m.get(0).floatValue();
        //println("pitch: " + pitch);
      }
    }
  }
