/** clase que representa al a pared */
class Pared extends GameObject implements IVisualizable {
  color Color;

  public Pared() {}
  public Pared(PVector posicion, int ancho, int alto) {
    this.posicion=posicion;
    this.alto = alto;
    this.ancho = ancho;
    Color=130; 
  }

  public void display() {
    rectMode(CORNER);
    fill(Color);
    rect(posicion.x, this.posicion.y, this.ancho, this.alto);
    
  }
  
  public void setColor(color Color){
    this.Color=Color;
  }

}
