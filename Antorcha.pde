/** Clase de la Antorcha: Representa la antorcha individual. */

class Antorcha{    
  /** -- ATRIBUTOS -- */
  /** Verifica si la antorcha está encendida. */
  private boolean encendido;
    
  
    
  /** -- CONSTRUCTORES -- */
  /** Constructor por defecto. */
  public Antorcha(){}
  
  /** Constructor parametrizado. */
  public Antorcha(boolean encendido){
    this.encendido = encendido;
  }
    
  
  
  /** -- MÉTODOS -- */
  /** Moviendo el objeto. */
  public void mover(){}
  
    
    
  /** -- ACCESORES (GETTERS Y SETTERS) -- */
  /** Getters. */
  public boolean getEncendido(){
    return this.encendido;
  }
  
  /** Setters. */
  public void setEncendido(boolean encendido){
    this.encendido=encendido;
  }  
}
