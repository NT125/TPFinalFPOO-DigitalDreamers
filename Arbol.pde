/** clase que representa al arbol */
class Arbol extends GameObject implements IVisualizable {
  private PImage imagen;
  color Color;
  /** ---------------- ZONA DE CONSTRUCTURES ---------------- */
  //Constructor por defecto
  public Arbol() {
  }
  //Constructor parametrizado
  public Arbol(PVector posicion, int alto, int ancho) {
    super(posicion, alto, ancho);
    this.imagen = loadImage("arbol_grande.png");
    Color=0;
  }
  /** ---------------- ZONA DE METODOS ---------------- */
  public void display() {
    imageMode(CENTER);
    image(this.imagen, this.posicion.x, this.posicion.y, 100, 100);
    fill(Color, 40);
    rectMode(CENTER);
    rect(posicion.x, this.posicion.y+alto, this.ancho*2, this.alto);
  }
  
  public void setColor(color Color){
    this.Color=Color;
  }

}
