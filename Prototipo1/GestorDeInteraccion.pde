class GestorDeInteraccion{
  Dir_y_Vel mouse;
  boolean seMoviaEnElFrameAnterior;
  GestorDeInteraccion(){
    mouse = new Dir_y_Vel();
  }
  
  void actualizar(){
    mouse.calcularTodo(mouseX,mouseY);
    boolean seMueveElMouseEnEsteFrame = false;
    boolean arriba;
    boolean abajo;
    boolean derecha;
    boolean izquierda;
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
  }
}
