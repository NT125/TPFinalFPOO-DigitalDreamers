/** clase que representa al esenario */
class Escenario extends GameObject implements IVisualizable {
  /** atributos */
  private String nombre;        //Representa al nombre del esenario
  private color colorEsenario;  //Representa el color del esenario
  private ArrayList <Arbol> arboles;      //Representa a la cantidad de arboles que hay en el juego
  /** ---------------- ZONA DE CONSTRUCTORES ---------------- */
  //Constructor por defecto
  public Escenario(){}
  // Constructor parametrizado
  public Escenario(PVector posicion,int ancho,int alto,String nombre,color colorEsenario){
    super(posicion,ancho,alto);
    this.nombre=nombre;
    this.colorEsenario=colorEsenario;
    arboles = new ArrayList <Arbol>();
  }
  /** ---------------- ZONA DE METODOS ---------------- */
  public void display(){
    background(#BF4141);
    for (int i=0; i<random(3,7); i++) {
      Arbol a = new Arbol(new PVector(random(20,400),random(20,400)),30,30); 
      arboles.add(a);
    }
    for (int i=0; i<arboles.size(); i++) {
      Arbol a = arboles.get(i);
      a.display();
    }
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
