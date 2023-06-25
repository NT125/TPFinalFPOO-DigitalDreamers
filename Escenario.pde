/** clase que representa al esenario */
class Escenario extends GameObject implements IVisualizable {
  /** atributos */
  private String nombre;        //Representa al nombre del esenario
  private color colorEsenario;  //Representa el color del esenario
  private ArrayList <Arbol> arboles;      //Representa a la cantidad de arboles que hay en el juego
  private PImage imagen;
  
  /** ---------------- ZONA DE CONSTRUCTORES ---------------- */
  //Constructor por defecto
  public Escenario(){}
  // Constructor parametrizado
  public Escenario(PVector posicion,int ancho,int alto,String nombre){
    super(posicion,ancho,alto);
    this.nombre=nombre; 
    this.imagen = loadImage(nombre);
    //this.imagen.resize(width+4,height);
    arboles = new ArrayList();
  }
  /** ---------------- ZONA DE METODOS ---------------- */
  public void display(){
    
    imageMode(CORNER);
    image(this.imagen,this.posicion.x,this.posicion.y);
    image(loadImage("borde_juego.png"),0,0);
    //background(#BF4141);
    Arbol arbol;
    for (int i=0; i<arboles.size(); i++) {
      arbol = arboles.get(i);
      arbol.display();
    }
  }
  public void crearArboles(){
    Arbol arbol;
    for (int i=0; i<6; i++) {
      arbol = new Arbol(new PVector(random(20,width),random(20,height)),30,30); 
      arboles.add(arbol);
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
