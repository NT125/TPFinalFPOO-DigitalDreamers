/** Clase que representa la puerta para salir del nivel */
class Puerta extends GameObject implements IVisualizable{
  /* -- CONSTRUCTORES -- */
  /** Constructor por Defecto */
  public Puerta(){
    this.alto = 120;
    this.ancho = 50;
    this.posicion = new PVector(width-ancho/2,height/2);
  }
  /** Dibuja a la pared */
  public void display(){
    stroke(255);
    fill(0);
    rectMode(CENTER);
    rect(this.posicion.x, this.posicion.y, this.ancho, this.alto);
    rectMode(CORNER);
    stroke(0);
  }
}
