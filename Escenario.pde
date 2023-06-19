/** clase que representa al esenario */
class Esenario extends GameObject{
  /** atributos */
  private String nombre;
  private color colorEsenario;
  /** ---------------- ZONA DE CONSTRUCTORES ---------------- */
  //Constructor por defecto
  public Esenario(){}
  // Constructor parametrizado
  public Esenario(PVector posicion,int ancho,int alto,String nombre,color colorEsenario){
    super(posicion,ancho,alto);
    this.nombre=nombre;
    this.colorEsenario=colorEsenario;
  }
  /** ---------------- ZONA DE METODOS ---------------- */
  public void display(){
    
  }
  /** ---------------- ZONA DE METODOS ASESORES ---------------- */
  /* getters */
  public String getNombre(){
    return this.nombre;
  }
  public color colorEsenario(){
    return this.colorEsenario;
  }
  /* setters */
  public void setNombre(String nombre){
    this.nombre = nombre;
  }
  public void setColor(color colorEsenario){
    this.colorEsenario = colorEsenario;
  }
  
}
