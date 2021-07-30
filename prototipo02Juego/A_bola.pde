class Bola extends FCircle {

  Boolean izq, der, arr, _arr;
  float vel;


  Bola(float r) {
    super( r);
  }

  void inicializar(float x, float y) {

  

    setPosition(x, y);
    setDamping(-2);
    setRestitution(1.0);
    setFriction(1);
    setRotatable(false);

    izq=false;
    der=false;
    arr=false;
    _arr=false;
  }

  void actualizar() {
    vel=90;
    if (izq) {
      setVelocity(-vel,  getVelocityY());
    }
    if (der) {
      setVelocity(vel,  getVelocityY());
    }
    //if (izq && !der) {
    //  setVelocity(0,  getVelocityY());
    //}
  }
}
