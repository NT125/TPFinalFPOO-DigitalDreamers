/** Clase del escenario en pantalla. */

class Escenario extends GameObject implements IVisualizable {
  /** -- ATRIBUTOS -- */
  /** ArrayList para almacenar los árboles del escenario */
  private ArrayList <Arbol> arboles;
  
  /** Imagen para que se dibuje el escenario */
  private PImage imagen;
  
  
  
  /** -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Escenario(){
    this.posicion = new PVector(0,0);
  }
  
  /* Constructor parametrizado */
  public Escenario(PVector posicion,String nombre){
    this.posicion = posicion;
    //this.anchoP=30;
    this.nombre=nombre; 
    this.imagen = loadImage(nombre);
    //this.imagen.resize(width+4,height);
    arboles = new ArrayList();
    /*
    paredes= new Pared[4];
    paredes[0]=new Pared(new PVector(0,0), width, this.ancho); 
    paredes[1]=new Pared(new PVector(0,height-this.ancho), width, this.ancho);
    paredes[2]=new Pared(new PVector(0,0),this.ancho,height);
    paredes[3]=new Pared(new PVector(width-this.ancho,0),this.ancho,height);*/
  }
  
  
  
  /** -- MÉTODOS -- */
  /** Dibujando el escenario */
  public void display(){ 
    imageMode(CORNER);
    image(this.imagen,this.posicion.x,this.posicion.y);
    image(loadImage("borde_oscuro.png"),0,0);
    
    /*dibuja las Paredes*/
    /*for(Pared p:paredes){
      p.display();
    }*/
  }
  
  /** Colocando los árboles en el escnario */
  public void mostrarArboles(){
    Arbol arbol;
    for (int i=0; i<arboles.size(); i++) {
      arbol = arboles.get(i);
      arbol.display();
    }
  }
  
  /** Creando un árbol individual */
  public void crearArboles(){
    Arbol arbol;
    for (int i=0; i<random(2,6); i++) {
      arbol = new Arbol(new PVector(random(100,width-100),random(100,height-100)),50,50);
      arboles.add(arbol);
    }
  }
  
  /** Calculando la colisión con el jugador */
  public void colisionarJugador(){}
  
  
  
  /** -- ACCESORES (GETTERS Y SETTERS) -- */
  /** Getters */
  public String getNombre(){
    return this.nombre;
  } 
  
  /** Setters */
  public void setNombre(String nombre){
    this.nombre = nombre;
  }   
}
