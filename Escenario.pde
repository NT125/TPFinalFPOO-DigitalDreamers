/** Clase del escenario en pantalla. */
class Escenario extends GameObject implements IVisualizable {
  /* -- ATRIBUTOS -- */
  /** Representa una lista que almacena los arboles del escenario */
  private ArrayList <Arbol> arboles;
  
  /** Representa a la Imagen que se dibuja en el escenario */
  private PImage fondo;
  
  /** Representa a la Imagen que se dibuja en el escenario */
  private String rutaFondo;
  
  
  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Escenario(){
    this.posicion = new PVector(0,0);
  }
  
  /** Constructor parametrizado */
  public Escenario(PVector posicion,String rutaFondo){
    this.posicion = posicion;
    this.rutaFondo=rutaFondo; 
    this.fondo = loadImage(rutaFondo);
    this.fondo.resize(width+4,height);
    this.arboles = new ArrayList();
  }
  
  
  /* -- MÉTODOS -- */
  /** Dibuja el escenario */
  public void display(){
    imageMode(CORNER);
    tint(160, 185, 62);  //entinta la imagen a marron
    image(this.fondo,this.posicion.x,this.posicion.y);
    tint(255);
    image(loadImage("borde_oscuro.png"),0,0);
  }
  
  /** Mostrando los arboles en el escenario */
  public void mostrarArboles(){
    Arbol arbol; 
    for (int i=0; i < this.arboles.size(); i++) {
      arbol = this.arboles.get(i);
      arbol.display();
    }
  }
  
  /** Generando arboles uno a uno */
  public void crearArboles(){
    Arbol arbol;
    arbol = new Arbol(new PVector(113,79),60,60);
    arboles.add(arbol);
    arbol = new Arbol(new PVector(469,74),60,60);
    arboles.add(arbol);
    arbol = new Arbol(new PVector(236,258),60,60);
    arboles.add(arbol);
    arbol = new Arbol(new PVector(555,169),60,60);
    arboles.add(arbol);
    arbol = new Arbol(new PVector(430,300),60,60);
    arboles.add(arbol);
    arbol = new Arbol(new PVector(180,412),60,60);
    arboles.add(arbol);
    arbol = new Arbol(new PVector(552,479),60,60);
    arboles.add(arbol);
  }
  
  /* -- ACCESORES (GETTERS Y SETTERS) -- */
  /* - Getters - */
  /** Devuelve el rutaFondo del escenario */
  public String getRutaFondo(){
    return this.rutaFondo;
  } 
  /** Devuelve la lista de arboles */
  public ArrayList<Arbol> getArboles(){
    return this.arboles;
  }
  /* Setters */
  /** Cambia el rutaFondo del escenario */
  public void setRutaFondo(String rutaFondo){
    this.rutaFondo = rutaFondo;
  }   
}
