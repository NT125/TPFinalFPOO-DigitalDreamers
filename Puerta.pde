/** Clase que representa la puerta para salir del nivel */
class Puerta extends GameObject implements IVisualizable{
  /* -- ATRIBUTOS -- */
  /** Representa al sprite de la puerta */
  private SpriteObject sprite;
  
  /** Representa el estadoAnim del sprite de la puerta */
  private int estadoAnim;
  
  
  /* -- CONSTRUCTORES -- */
  /** Constructor por Defecto */
  public Puerta(){
    this.alto = 100;
    this.ancho = 80;
    this.posicion = new PVector(width-ancho/2,height/2);
    this.sprite = new SpriteObject("puerta.png",ancho,alto);
    this.estadoAnim = MaquinaEstadosAnimacion.ESTATICO;
  }
  
  /* -- MÉTODOS -- */
  /** Dibuja la puerta */
  public void display(){
    tint(225, 200, 80);
    this.sprite.render(this.estadoAnim,this.posicion);
    tint(255);
  }
}
