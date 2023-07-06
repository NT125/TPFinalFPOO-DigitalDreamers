/** Clase que representa a la Pared individual */
class Pared extends GameObject implements IVisualizable {
  /* -- ATRIBUTOS -- */
  /** Representa el Color de la pared */ 
  private color colorPared;
  
  
  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Pared() {}
  
  /** Constructor parametrizado */
  public Pared(PVector posicion, int ancho, int alto) {
    super(posicion,ancho,alto);
    colorPared=130; 
  }
  
  
  /* -- MÉTODOS -- */
  /** Dibujando la pared */
  public void display() {
    rectMode(CORNER);
    fill(colorPared);
    rect(posicion.x, this.posicion.y, this.ancho, this.alto);
    
  }
  
  
  /* -- ACCESORES (GETTERS Y SETTERS) -- */
  /** Setters */
  /** Asigna un nuevo color al color de la pared */
  public void setcolorPared(color colorPared){
    this.colorPared=colorPared;
  }
}
