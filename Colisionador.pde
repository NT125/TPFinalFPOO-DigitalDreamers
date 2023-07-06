/** Clase que verifica las coliciones entre objetos */
class Colisionador {

  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Colisionador(){}
  
  /** Metodo que comprueba la colision entre dos objetos rectangulos */
  public boolean colisionarRectangulo(GameObject primero, GameObject segundo) {
    
    //DEBUG: dibuja la hitbox de los rectangulos
    /*rectMode(CENTER);
    rect(primero.getPosicion().x,primero.getPosicion().y, primero.getAncho(), primero.getAlto());
    rect(segundo.getPosicion().x,segundo.getPosicion().y, segundo.getAncho(), segundo.getAlto());
    */
    return !(primero.getPosicion().x + primero.getAncho() < segundo.getPosicion().x ||
      primero.getPosicion().x > segundo.getPosicion().x + segundo.getAncho() ||
      primero.getPosicion().y + primero.getAlto() < segundo.getPosicion().y ||
      primero.getPosicion().y > segundo.getPosicion().y + segundo.getAlto());
  }
  
  /** Metodo que comprueba la colisión entre dos objetos círculares */
  public boolean colisionarCirculo(GameObject primero, GameObject segundo) {
    float distancia = PVector.dist(primero.getPosicion(), segundo.getPosicion());
    //DEBUG: dibuja la hitbox del segundo circulo
    /*circle(primero.getPosicion().x,primero.getPosicion().y, primero.getAncho());
    circle(segundo.getPosicion().x, segundo.getPosicion().y, segundo.getAncho());
    */
    float radios = primero.getAncho()/2+segundo.getAncho()/2;
    return distancia <= radios; 
  }
  
  
  /** Metodo que comprueba la colicion de un objeto rectangulo con otro objeto circular */
  public boolean colisionarCircRect(GameObject circulo, GameObject rectangulo){
    // Genera una variable que guarda la posicion(x,y) del circulo, que representara el punto mas cercano entre el rectangulo y el circulo
    PVector point = new PVector(circulo.getPosicion().x,circulo.getPosicion().y);
    
    // actualiza la posicion X del punto más cercano a los extremos del rectángulo en el eje x, al ancho lo dividimos en 2 porque la imagen esta en el centro
    if(point.x < rectangulo.getPosicion().x - rectangulo.getAncho()/2){
      point.x = rectangulo.getPosicion().x - rectangulo.getAncho()/2;
    }
    if(point.x > rectangulo.getPosicion().x + rectangulo.getAncho()/2){
      point.x = rectangulo.getPosicion().x + rectangulo.getAncho()/2;
    }
    // actualiza la posicion Y del punto más cercano a los extremos del rectángulo en el eje y
    if(point.y < rectangulo.getPosicion().y - rectangulo.getAlto()/2){
      point.y = rectangulo.getPosicion().y - rectangulo.getAlto()/2;
    }
    if(point.y > rectangulo.getPosicion().y + rectangulo.getAlto()/2){
      point.y = rectangulo.getPosicion().y + rectangulo.getAlto()/2;
    }
    //DEBUG: dibuja el centro del circulo y la linea de distancia entre este y el punto mas cercano
    /*circle( circulo.getPosicion().x, circulo.getPosicion().y, 2);                //Representara el centro del circulo
    stroke(255,0,0);
    line( point.x, point.y, circulo.getPosicion().x, circulo.getPosicion().y );  //Dibuja la linea de distancia entre el centro del circulo y el punto cercano
    fill( 0, 255, 0 );
    stroke(0,255,0);
    circle( point.x, point.y, 3);                                                //Dibuja el punto mas cercano
    */
    
    float distance = point.dist(circulo.getPosicion());         //Calcula la distancia entre el punto cercano y la posicion del circulo
    return distance <= circulo.getAncho()/2;
  }
}
