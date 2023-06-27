/** clase que representa al arbol */
class Arbol extends GameObject implements IVisualizable {
  private PImage imagen;
  //private color Color; /** DEBUG - para verificar visualmente la colisión */
  /** ---------------- ZONA DE CONSTRUCTURES ---------------- */
  //Constructor por defecto
  public Arbol() {
  }
  //Constructor parametrizado
  public Arbol(PVector posicion, int alto, int ancho) {
    super(posicion, alto, ancho);
    this.imagen = loadImage("arbol_grande.png");
    //Color=0; /** DEBUG - para verificar visualmente la colisión */
  }
  /** ---------------- ZONA DE METODOS ---------------- */
  public void display() {
    imageMode(CORNER);
    image(this.imagen, this.posicion.x-ancho/2, this.posicion.y, 100, 100);
    /** ayuda para posicionar el sprite */
    /*
    rect(posicion.x-ancho/2, this.posicion.y, 100,100);
    fill(Color, 40);
    */
    
    /** hitbox arbol */
    /*
    rectMode(CORNER);
    rect(posicion.x, this.posicion.y, this.ancho, this.alto);
    */
  }
  /** ---------------- ZONA DE METODOS ASESORES ---------------- */
  /*public void setColor(color Color){
    this.Color=Color;
  }*//** DEBUG - para verificar visualmente la colisión */

}
