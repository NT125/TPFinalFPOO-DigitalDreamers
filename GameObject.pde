/** Clase Abstracta que representa a todos los Objetos del juego */

abstract class GameObject {
  /** -- ATRIBUTOS -- */
  /** Representa al nombre del objeto para aplicar su sprite */
  protected String nombre; 
  
  /** Representa la posición del objeto */
  protected PVector posicion;
  
  /** Representa el ancho del objeto */
  protected int ancho; 
  
  /** Representa el alto del objeto */
  protected int alto;
  
  
  
  /** -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public GameObject(){
    this.posicion = new PVector(width/2, height/2);
  }
  
  /** Constructor parametrizado */
  public GameObject(PVector posicion, int ancho, int alto){
    this.posicion = posicion;
    this.ancho = ancho;
    this.alto = alto;
  }
  
  
  
  /** -- ACCESORES (GETTERS Y SETTERS) -- */
  /** Getters */
  public PVector getPosicion(){
    return this.posicion;
  }
  public int getAlto(){
    return this.alto;
  }
  public int getAncho(){
    return this.ancho;
  }
  
  /** Setters */
  public void setPosicion(PVector posicion){
    this.posicion=posicion;
  } 
  public void setAlto(int alto){
    this.alto=alto;
  } 
  public void setAncho(int ancho){
    this.ancho=ancho;
  } 
}
