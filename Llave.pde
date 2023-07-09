/** Clase que representa a la llave del juego */
class Llave extends GameObject implements IVisualizable {
  /** -- ATRIBUTOS -- */
  /** Representa al sprite de la llave */
  private SpriteObject sprite;
  
  /** Representa el estadoAnim del sprite de la llave */
  private int estadoAnim;
  
  
  /** -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Llave() {
  }

  /** Constructor parametrizado */
  public Llave(PVector posicion, int ancho, int alto) {
    super(posicion,ancho,alto);
    this.sprite = new SpriteObject("llave.png",ancho,alto);
    this.estadoAnim = MaquinaEstadosAnimacion.ESTATICO;
  }
  
  
  /** -- MÉTODOS -- */
  /** Dibuja la llave en el escenario */
  public void display() {    
    tint(225, 185, 32);  //entinta la imagen a marron
    this.sprite.render(this.estadoAnim,this.posicion);
    tint(255);
  }
  
  /** Verifica la colisión individual con la puerta */
  public boolean colisionarPuerta(){
    return colisionador.colisionarRectangulo(this,puerta);
  }
}
