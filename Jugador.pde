/** Clase que representa al jugador */
class Jugador extends GameObject{
  /** atributos */
  private boolean vivo;      //Representa si el jugador aun esta vivo
  private PVector velocidad; //Representa al velocidad del jugador
  
  /** ---------------- ZONA DE CONSTRUCTORES ---------------- */
  //Constructor por defecto
  public Jugador(){}
  //Constructor parametrizado
  public Jugador(PVector posicion, int ancho, int alto, boolean vivo, PVector velocidad){
    super(posicion,ancho,alto);
    this.vivo = vivo;
    this.velocidad = velocidad;
  }
  
  /** ---------------- ZONA DE METODOS ---------------- */
  public void display(){
    
  }
  public void tirarAntorcha(){
    
  }
  public void mover(){
    
  }
  public void colisionEnemigo(Enemigo enemi){
    
  }
  /** ---------------- ZONA DE METODOS ASESORES ---------------- */
  /* getters */
  public boolean getVivo(){
    return this.vivo;
  }
  public PVector getVelocidad(){
    return this.velocidad;
  }
  /* setters */
  public void setVivo(boolean vivo){
    this.vivo = vivo;
  }
  public void setVelocidad(PVector velocidad){
    this.velocidad = velocidad;
  }
}
