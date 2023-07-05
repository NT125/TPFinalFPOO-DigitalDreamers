/** */
class Colisionador {

  /** Metodo que comprueba la colision entre dos objetos rectangulos */
  public boolean colisionarRectangulo(GameObject primero, GameObject segundo) {
    float rectAX = primero.getPosicion().x - segundo.getAncho() / 2;
    float rectAY = primero.getPosicion().y - segundo.getAlto() / 2;
    float rectBX = segundo.getPosicion().x - primero.getAncho() / 2;
    float rectBY = segundo.getPosicion().y - primero.getAncho() / 2;
    //DEBUG: dibuja la hitbox de los rectangulos
    rect(rectAX,rectAY, primero.getAncho(), primero.getAlto());
    rect(rectBX,rectBY, segundo.getAncho(), segundo.getAlto());
    return !(rectAX + primero.getAncho() < rectBX ||
      rectAX > rectBX + segundo.getAncho() ||
      rectAY + primero.getAlto() < rectBY ||
      rectAY > rectBY + segundo.getAlto());
  }
  
  /** Metodo que comprueba la colisión entre dos objetos círculares */
  public boolean colisionarCirculo(GameObject primero, GameObject segundo) {
    float distancia = PVector.dist(primero.getPosicion(), segundo.getPosicion());
    //DEBUG: dibuja la hitbox del segundo circulo
    circle(segundo.getPosicion().x, segundo.getPosicion().y, segundo.getAncho()/2+primero.getAncho()/2);
    float radios = primero.getAncho()/2+segundo.getAncho()/2;
    return distancia <= radios; 
  }
  
  
  /** Metodo que comprueba la colicion de un objeto rectangulo con otro objeto circular */
  public boolean colisionarCircRect(GameObject rectangulo, GameObject circulo){
    // Genera una variable que guarda la posicion(x,y) del circulo, que representara el punto mas cercano entre el rectangulo y el circulo
    PVector point = new PVector(circulo.getPosicion().x,circulo.getPosicion().y);
    
    // actualiza la posicion X del punto más cercano a los extremos del rectángulo en el eje x
    if(point.x < rectangulo.getPosicion().x){
      point.x = rectangulo.getPosicion().x;
    }
    if(point.x > rectangulo.getPosicion().x + rectangulo.getAncho()){
      point.x = rectangulo.getPosicion().x + rectangulo.getAncho();
    }
    // actualiza la posicion Y del punto más cercano a los extremos del rectángulo en el eje y
    if(point.y < rectangulo.getPosicion().y){
      point.y = rectangulo.getPosicion().y;
    }
    if(point.y > rectangulo.getPosicion().y + rectangulo.getAlto()){
      point.y = rectangulo.getPosicion().y + rectangulo.getAlto();
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
