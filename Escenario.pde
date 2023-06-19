/** clase que representa al esenario */
class Escenario extends GameObject{
  /** atributos */
  private String nombre;        //Representa al nombre del esenario
  private color colorEsenario;  //Representa el color del esenario
  private Arbol[] arboles;      //Representa a la cantidad de arboles que hay en el juego
  /** ---------------- ZONA DE CONSTRUCTORES ---------------- */
  //Constructor por defecto
  public Escenario(){}
  // Constructor parametrizado
  public Escenario(PVector posicion,int ancho,int alto,String nombre,color colorEsenario){
    super(posicion,ancho,alto);
    this.nombre=nombre;
    this.colorEsenario=colorEsenario;
    arboles = new Arbol[5];
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
