/** Clase que representa a la Pared individual */

class Pared extends GameObject implements IVisualizable {
  /** -- ATRIBUTOS -- */
  /** Color de la pared */ 
  private color colorPared;
  
  
  /** -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Pared() {}
  
  /** Constructor parametrizado */
  public Pared(PVector posicion, int ancho, int alto) {
    this.posicion=posicion;
    this.alto = alto;
    this.ancho = ancho;
    colorPared=130; 
  }
  
  
  /** -- MÉTODOS -- */
  /** Dibujando la pared */
  public void display() {
    rectMode(CORNER);
    fill(colorPared);
    rect(posicion.x, this.posicion.y, this.ancho, this.alto);
    
  }
  
  
  /** -- ACCESORES (GETTERS Y SETTERS) -- */
  /** Setters */
  public void setcolorPared(color colorPared){
    this.colorPared=colorPared;
  }
}
