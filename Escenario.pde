/** clase que representa al esenario */
class Escenario extends GameObject implements IVisualizable {
  /** atributos */
  private color colorEsenario;  //Representa el color del esenario
  private ArrayList <Arbol> arboles;      //Representa a la cantidad de arboles que hay en el juego
  private Pared[] paredes;
  private PImage imagen;
  
  /** ---------------- ZONA DE CONSTRUCTORES ---------------- */
  //Constructor por defecto
  public Escenario(){
    this.posicion = new PVector(0,0);
  }
  // Constructor parametrizado
  public Escenario(PVector posicion,String nombre){
    this.posicion = posicion;
    this.ancho=30;
    this.nombre=nombre; 
    this.imagen = loadImage(nombre);
    //this.imagen.resize(width+4,height);
    arboles = new ArrayList();
    
    paredes= new Pared[4];
    paredes[0]=new Pared(new PVector(0,0), width, this.ancho); 
    paredes[1]=new Pared(new PVector(0,height-this.ancho), width, this.ancho);
    paredes[2]=new Pared(new PVector(0,0),this.ancho,height);
    paredes[3]=new Pared(new PVector(width-this.ancho,0),this.ancho,height);
  }
  /** ---------------- ZONA DE METODOS ---------------- */
  public void display(){ 
    imageMode(CORNER);
    image(this.imagen,this.posicion.x,this.posicion.y);
    image(loadImage("borde_oscuro.png"),0,0);
    
    /*dibuja las Paredes*/
    for(Pared p:paredes){
      p.display();
    }
  }
  public void mostrarArboles(){
    Arbol arbol;
    for (int i=0; i<arboles.size(); i++) {
      arbol = arboles.get(i);
      arbol.display();
    }
  }
  public void crearArboles(){
    Arbol arbol;
    for (int i=0; i<random(4,10); i++) {
      arbol = new Arbol(new PVector(random(20,width),random(20,height)),30,30);
      arboles.add(arbol);
    }
  }
  public void colisionarJugador(){
  //colision de paredes
  
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
