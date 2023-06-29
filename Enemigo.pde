/** Clase principal del enemigo: Representa al enemigo individual. */

class Enemigo extends SpriteObject implements IMovable, IVisualizable{
  /** -- ATRIBUTOS -- */
  /** Sprite del enemigo */
  private PImage enemigo;
  
  /** Vector velocidad del enemigo */
  private PVector velocidad;
  
  
  
  /** -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Enemigo(){}
  
  /** Constructor parametrizado */
  public Enemigo(PVector posicion,int ancho,int alto, PVector velocidad){
    this.ancho=ancho;
    this.alto=alto;
    this.posicion=posicion;
    this.velocidad = velocidad;
    this.enemigo = loadImage("enemigo-removebg-preview.png");
  }
  
  
  /** -- MÉTODOS -- */
  /** Dibujando al enemigo */
  public void display(){
    image(enemigo,posicion.x-ancho/2,posicion.y-alto/2,ancho,alto);
    
    //DEBUG: dibujando hitbox
    /*
    ellipse(posicion.x,posicion.y,ancho,alto);
    strokeWeight(3);
    point(posicion.x,posicion.y);
    strokeWeight(1);
    */
    
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
    float deltaTime= 1/ frameRate;
    PVector velocidadNormal= new PVector(this.velocidad.x*deltaTime,this.velocidad.y*deltaTime);                
    posicion.add(velocidadNormal);
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
}
