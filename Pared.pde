/** clase que representa al a pared */
class Pared extends GameObject implements IVisualizable {
  private PImage imagen;
  color Color;

  public Pared() {
  }

  public Pared(PVector posicion, int alto, int ancho) {
    super(posicion, alto, ancho);
    this.imagen = loadImage("borde_oscuro.png");
    Color=0;
  }

  public void display() {
    imageMode(CENTER);
    image(this.imagen, this.posicion.x, this.posicion.y, 100, 100);
    fill(Color);
    rectMode(CENTER);
    rect(posicion.x, this.posicion.y+alto, this.ancho*2, this.alto);
  }
  
  public void setColor(color Color){
    this.Color=Color;
  }

}
