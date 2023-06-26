/** clase que representa al a pared */
class Pared extends GameObject implements IVisualizable {
  color Color;
  
  /** ---------------- ZONA DE CONSTRUCTORES ---------------- */
  public Pared() {}
  public Pared(PVector posicion, int ancho, int alto) {
    this.posicion=posicion;
    this.alto = alto;
    this.ancho = ancho;
    Color=130; 
  }
  /** ---------------- ZONA DE METODOS ---------------- */
  public void display() {
    rectMode(CORNER);
    fill(Color);
    rect(posicion.x, this.posicion.y, this.ancho, this.alto);
    
  }
  /** ---------------- ZONA DE METODOS ASESORES ---------------- */
  public void setColor(color Color){
    this.Color=Color;
  }

}
