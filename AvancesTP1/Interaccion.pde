class GestorDeInteraccion {
   
  Dir_y_Vel mouse;
    //para determinar la direccion(arriba,abajo,derecha,izquierda)
    boolean seMoviaEnElFrameAnterior;
    boolean arriba;
    boolean abajo;
    boolean derecha;
    boolean izquierda;
    //para la parte de velocidad(grande o pequena)
    boolean movGrande;
    boolean movPeque;
    float tiempoGrande;
    float tiempoPeque;
  GestorDeInteraccion(){
    mouse = new Dir_y_Vel();
  }
  
  void actualizar(){
    
    //para determinar la direccion(arriba,abajo,derecha,izquierda)
    mouse.calcularTodo(mouseX,mouseY);
    boolean seMueveElMouseEnEsteFrame = false;
    
    float sensibilidad = 35;
    if (mouse.velocidad()>sensibilidad){
      seMueveElMouseEnEsteFrame = true;
    }
    arriba = false;
    abajo = false;
    derecha = false;
    izquierda = false;
    
    if(seMueveElMouseEnEsteFrame &&
      !seMoviaEnElFrameAnterior){
        arriba = mouse.direccionY()<-50?true:false;
        abajo = mouse.direccionY()>50?true:false;
        derecha = mouse.direccionX()>50?true:false;
        izquierda = mouse.direccionX()<-50?true:false;
      }
      seMoviaEnElFrameAnterior = seMueveElMouseEnEsteFrame;
      
      //para la parte de velocidad(grande o pequena)
      movGrande = false;
      movPeque = false;
      tiempoGrande--;
      tiempoPeque--;
      tiempoGrande = constrain(tiempoGrande,0,90);
      tiempoPeque = constrain(tiempoPeque,0,90);
      if(mouse.velocidad()>10){
        float umbral = 50;
        if(mouse.velocidad()>umbral){
          tiempoGrande+=10;
          tiempoPeque-=10;
        }else{
          if (tiempoGrande<10){
            tiempoPeque+=10;
        }
      }
  }
  if(tiempoGrande>55){
    movGrande = true;
  }
  if(tiempoPeque>55){
    movPeque = true;
  }
 }
}
