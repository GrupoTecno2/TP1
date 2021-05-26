class Fondo{
  float tinte;
  
  Fondo(){
colorMode(HSB, 360,100,100);
    tinte = 0;
  }
  
  void cambiarTinte( float valor){
  
    tinte = valor;
  }
  
  void dibujar(){
  
    pushStyle();
    
   
   background(58, tinte*0.3, 100-100/tinte);
  
   
    popStyle();
  }

}
