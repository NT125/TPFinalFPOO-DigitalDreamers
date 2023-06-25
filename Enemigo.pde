/** clase que representa al enemigo */
class Enemigo extends SpriteObject implements IMovable, IVisualizable{
  /* atributos */
  private PVector velocidad;  //Representa la velocidad del enemigo
  
  /** ---------------- ZONA DE CONSTRUCTORES ---------------- */
  //Constructor por defecto
  public Enemigo(){}
  //Constructor parametrizado
  public Enemigo(PVector posicion,int ancho,int alto, PVector velocidad){
    //super(posicion, ancho, alto);
    this.velocidad = velocidad;
  }
  /** ---------------- ZONA DE METODOS ---------------- */
  public void display(){
    
  }
  public void rebotar(){
    
  }
  public void mover(){
    
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
