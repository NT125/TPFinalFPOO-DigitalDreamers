/** Clase principal del enemigo: Representa al enemigo individual. */

class Enemigo extends SpriteObject implements IMovable, IVisualizable{
  /** -- ATRIBUTOS -- */  
  /** Vector velocidad del enemigo */
  private PVector velocidad;
  color Color;
  
  
  /** -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Enemigo(){}
  
  /** Constructor parametrizado */
  public Enemigo(PVector posicion,int ancho,int alto, PVector velocidad){
    this.ancho=ancho;
    this.alto=alto;
    
    this.posicion=posicion;
    this.velocidad = velocidad;
    
    this.estado = MaquinaEstadosAnimacion.ESTATICO;
    this.Color = 255;
    this.spriteSheet = requestImage("enemigo-removebg-preview.png");
  }
  
  
  /** -- MÉTODOS -- */
  /** Dibujando al enemigo */
  public void display(){
    tint(0);
    this.render(this.estado);
    tint(255);
    //DEBUG: dibujando hitbox
    /*fill(Color);
    ellipseMode(CORNER);
    ellipse(posicion.x,posicion.y,ancho,alto);
    strokeWeight(3);
    point(posicion.x,posicion.y);
    strokeWeight(1);*/
    
    
  }
  
  /** Haciendo que el enemigo rebote al impactar una pared */
  public void rebotar(){
    //DEBUG: dibujando hitbox
    //rect(ancho,alto,width-ancho*2, height-alto*2);
    
    // Limitando movimiento en la ventana
    if(this.posicion.x >= width-ancho || this.posicion.x<= 0+ancho){
      this.velocidad.x *= -1;
    }
    if(this.posicion.y >= height-alto || this.posicion.y <= 0+alto){
      this.velocidad.y *= -1;
    }
  }
  
  /** Moviendo al enemigo */
  public void mover(){
    float deltaTime= 1/frameRate;
    PVector velocidadNormal= new PVector(this.velocidad.x*deltaTime,this.velocidad.y*deltaTime);                
    posicion.add(velocidadNormal);
  }
  /** Evalua un enemigo con otro */
  public boolean chocarCon(Enemigo otro) {
    // Comprobar colisión entre dos círculos
    float distancia = dist(this.posicion.x, this.posicion.y, otro.getPosicion().x, otro.getPosicion().y);
    return (distancia < (this.ancho/2 + otro.getAncho()/2));
  }
  
  public void cambiarDireccion() {
    // Cambiar dirección del círculo
    velocidad.x *= -1;
    velocidad.y *= -1;
  }
  public void colisionarJugador(Jugador j) {
   
  }
  
  
  /** -- ACCESORES (GETTERS Y SETTERS) -- */
  /* Getters */
  public PVector getVelocidad(){
    return this.velocidad;
  }
  
  /* Setters */
  public void setVelocidad(PVector velocidad){
    this.velocidad = velocidad;
  }
  public void setColor(color Color){
    this.Color=Color;
  }
  
}
