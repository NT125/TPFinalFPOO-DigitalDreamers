/** clase que representa al enemigo */
class Enemigo extends SpriteObject implements IMovable, IVisualizable{
  /* atributos */
  private PImage enemigo;
  private PVector velocidad;  //Representa la velocidad del enemigo
  
  /** ---------------- ZONA DE CONSTRUCTORES ---------------- */
  //Constructor por defecto
  public Enemigo(){}
  //Constructor parametrizado
  public Enemigo(PVector posicion,int ancho,int alto, PVector velocidad){
    this.ancho=ancho;
    this.alto=alto;
    this.posicion=posicion;
    this.velocidad = velocidad;
  }
  /** ---------------- ZONA DE METODOS ---------------- */
  public void display(){
    enemigo = loadImage("enemigo-removebg-preview.png");
    image(enemigo,posicion.x,posicion.y,ancho,alto);
  }
  public void rebotar(){
    if(this.posicion.y >= height || this.posicion.y <= 0){
    
      this.velocidad.y *= -1;
    }
    if(this.posicion.x >= width || this.posicion.x <= 0){
    
      this.velocidad.x *= -1;
    }
  }
  public void mover(){
    this.posicion.add(this.velocidad);
  }
  public void ColisionParedes(){
  
  }
  /** ---------------- ZONA DE METODOS ASESORES ---------------- */
  /* getters */
  public PVector getVelocidad(){
    return this.velocidad;
  }
  /* setters */
  public void setVelocidad(PVector velocidad){
    this.velocidad = velocidad;
  }
}
