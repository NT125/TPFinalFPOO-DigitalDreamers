/** clase que representa al a pared */
class Pared extends GameObject implements IVisualizable {
  private color colorPared;
  
  /** ---------------- ZONA DE CONSTRUCTORES ---------------- */
  public Pared() {}
  public Pared(PVector posicion, int ancho, int alto) {
    this.posicion=posicion;
    this.alto = alto;
    this.ancho = ancho;
    colorPared=130; 
  }
  /** ---------------- ZONA DE METODOS ---------------- */
  public void display() {
    rectMode(CORNER);
    fill(colorPared);
    rect(posicion.x, this.posicion.y, this.ancho, this.alto);
    
  }
  /** ---------------- ZONA DE METODOS ASESORES ---------------- */
  public void setcolorPared(color colorPared){
    this.colorPared=colorPared;
  }

}
