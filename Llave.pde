class Llave extends GameObject implements IVisualizable {
  /* -- Atributos -- */
  /** Representa al sprite de la llave */
  private SpriteObject sprite;
  
  /** Representa el estado del sprite de la llave */
  private int estado;
  
  
  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Llave() {
  }

  /** Constructor parametrizado */
  public Llave(PVector posicion, int ancho, int alto) {
    this.posicion = posicion;
    this.ancho = ancho;
    this.alto = alto;
    this.sprite = new SpriteObject("llave.png",ancho,alto);
    this.estado = MaquinaEstadosAnimacion.ESTATICO;
  }
  /** Dibuja la llave en el escenario */
  public void display() {
    tint(105, 22, 32);
    this.sprite.render(this.estado,this.posicion);
    tint(255);
  }
}
