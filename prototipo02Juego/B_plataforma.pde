class Plataforma extends FBox
{
 
  
  
  Plataforma(float ancho, float alto){
    
   super(ancho, alto);
    
  }
  
  void inicializar (float x, float y){
    
    setPosition(x,y);
    setName("plataforma");
    setStatic(true);
    setGrabbable(false);
  }
  
}
