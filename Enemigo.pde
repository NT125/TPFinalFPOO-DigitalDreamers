/** Clase principal del enemigo: Representa al enemigo individual. */
class Enemigo extends GameObject implements IMovable, IVisualizable{
  /** -- ATRIBUTOS -- */  
  /** Vector velocidad del enemigo */
  private PVector velocidad;
  
  /** Representa al sprite del enemigo */
  private SpriteObject sprite;
  
  /** Representa el estado del sprite del enemigo */
  private int estadoAnim;
  
  
  /** -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Enemigo(){}
  
  /** Constructor parametrizado */
  public Enemigo(PVector posicion,int ancho,int alto, PVector velocidad){
    super(posicion,ancho,alto);
    this.velocidad = velocidad;
    
    this.sprite = new SpriteObject("enemigo-removebg-preview.png",ancho+10,alto+10); //sumamos 10 para que el psrite sea un poco mas grande
    this.estadoAnim = MaquinaEstadosAnimacion.ESTATICO;
  }
  
  
  /** -- MÉTODOS -- */
  /** Dibujando al enemigo */
  public void display(){
    tint(0);
    this.sprite.render(this.estadoAnim,this.posicion);
    tint(255);
    //DEBUG: dibujando hitbox
    /*fill(Color);
    ellipse(posicion.x,posicion.y,ancho,alto);
    strokeWeight(3);
    point(posicion.x,posicion.y);
    strokeWeight(1);*/
    
  }
  
  /** Hace que el enemigo rebote al impactar una pared */
  public void rebotar(){
    //DEBUG: dibujando bordes
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
  /** Cambia de direccion del enemigo */
  public void cambiarDireccion() {
    velocidad.mult(-1);
    /*velocidad.x *= -1;
    velocidad.y *= -1;*/
  }
  
  /** -- ACCESORES (GETTERS Y SETTERS) -- */
  /** - Getters - */
  /** Devuelve la velocidad del enemigo */
  public PVector getVelocidad(){
    return this.velocidad;
  }
  
  /** - Setters - */
  /** Asigna una velocidad al enemigo */
  public void setVelocidad(PVector velocidad){
    this.velocidad = velocidad;
  }
}
