/** Clase abstracta que representa a todos los Objetos del juego */
abstract class GameObject {
  /** atributos*/
  protected PVector posicion; //Representa la posicion del objeto
  protected int ancho;        //Representa el ancho del objeto
  protected int alto;         //Representa el alto del objeto
  
  /** ------- ZONA DE CONSTRUCTORES ------- */
  // Constructor por Defecto
  public GameObject(){
    this.posicion = new PVector(width/2, height/2);
  }
  //Constructor Parametrizado
  public GameObject(PVector posicion, int ancho, int alto){
    this.posicion = posicion;
    this.ancho = ancho;
    this.alto = alto;
  }
  
  /** ------- ZONA DE METODOS ------- */
  abstract public void display();
  
  /** ------- ZONA DE METODOS ASESORES ------- */
  public void setPosicion(PVector posicion){
    this.posicion=posicion;
  } 
  public PVector getPosicion(){
    return this.posicion;
  }
}
