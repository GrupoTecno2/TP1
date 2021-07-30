void atraer(){
  float factor = 5;
  ArrayList<FBody>cuerpos=mundo.getBodies();
  
  for (FBody cuerpo: cuerpos){
    float dx= mouseX - cuerpo.getX();
    float dy = mouseY - cuerpo.getY();
    cuerpo.addForce(dx *factor,dy *factor);
  }
  
}
void repeler(){
  float factor = 5;
  ArrayList<FBody>cuerpos=mundo.getBodies();
  
  for (FBody cuerpo: cuerpos){
    float dx=cuerpo.getX()-mouseX;
    float dy = cuerpo.getY()- mouseY;
    cuerpo.addForce(dx *factor,dy *factor);
  }
  
}
void repelerDer(){
  float factor = 5;
  ArrayList<FBody>cuerpos=mundo.getBodies();
  
  for (FBody cuerpo: cuerpos){
    float derx=cuerpo.getX()-width;
    float y=cuerpo.getY();
    
    cuerpo.addForce(derx *factor, y);
  }
  
}
void repelerIzq(){
  float factor = 5;
  ArrayList<FBody>cuerpos=mundo.getBodies();
  
  for (FBody cuerpo: cuerpos){
    float izqx=cuerpo.getX()+width;
    float y=cuerpo.getY();
    
    cuerpo.addForce(izqx *factor, y);
  }
  
}
