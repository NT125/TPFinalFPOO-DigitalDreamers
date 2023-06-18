/** Clase abstracta que representa a todos los Objetos del juego */
abstract class GameObject {
  protected PVector posicion;
  
  /** ------- ZONA DE CONSTRUCTORES ------- */
  // Constructor por Defecto
  public GameObject(){
    this.posicion = new PVector(width/2, height/2);
  }
  //Constructor Parametrizado
  public GameObject(PVector posicion){
    this.posicion= posicion;
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
