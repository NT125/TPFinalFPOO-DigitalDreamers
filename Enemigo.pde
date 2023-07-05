/** Clase principal del enemigo: Representa al enemigo individual. */

class Enemigo extends GameObject implements IMovable, IVisualizable{
  /* -- ATRIBUTOS -- */  
  /** Vector velocidad del enemigo */
  private PVector velocidad;
  
  /** Representa al sprite del enemigo */
  private SpriteObject sprite;
  
  /** Representa el estado del sprite del enemigo */
  private int estado;
  color Color;
  
  
  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Enemigo(){}
  
  /** Constructor parametrizado */
  public Enemigo(PVector posicion,int ancho,int alto, PVector velocidad){
    this.ancho=ancho;
    this.alto=alto;
    
    this.posicion=posicion;
    this.velocidad = velocidad;
    
    this.sprite = new SpriteObject("enemigo-removebg-preview.png",ancho,alto);
    this.estado = MaquinaEstadosAnimacion.ESTATICO;
    this.Color = 255;
  }
  
  
  /* -- MÉTODOS -- */
  /** Dibujando al enemigo */
  public void display(){
    tint(0);
    this.sprite.render(this.estado,this.posicion);
    tint(255);
    //DEBUG: dibujando hitbox
    /*fill(Color);
    ellipseMode(CORNER);
    ellipse(posicion.x,posicion.y,ancho,alto);
    strokeWeight(3);
    point(posicion.x,posicion.y);
    strokeWeight(1);*/
    
    
  }
  
  /** Hace que el enemigo rebote al impactar una pared */
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
  
  /** Mueve al enemigo */
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
  /** Cambia de direccion del enemigo */
  public void cambiarDireccion() {
    // Cambiar dirección del círculo
    velocidad.x *= -1;
    velocidad.y *= -1;
  }
  /** Verifica la colision entre el enemigo y el jugador */
  public void colisionarJugador(Jugador j) {
   
  }
  
  
  /* -- ACCESORES (GETTERS Y SETTERS) -- */
  /* Getters */
  /** Devuelve la velocidad del enemigo */
  public PVector getVelocidad(){
    return this.velocidad;
  }
  
  /* Setters */
  /** Asigna una velocidad al enemigo */
  public void setVelocidad(PVector velocidad){
    this.velocidad = velocidad;
  }
  /** Asigna un color al enemigo */
  public void setColor(color Color){
    this.Color=Color;
  }
  
}
