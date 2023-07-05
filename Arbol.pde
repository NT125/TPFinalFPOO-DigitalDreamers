/** Clase de los Árboles: obstáculos para el jugador */

class Arbol extends GameObject implements IVisualizable {
  /* -- ATRIBUTOS -- */
  /** Representa al sprite del arbol */
  private SpriteObject sprite;
  
  /** Representa el estado del sprite del arbol */
  private int estado;
  
  /* DEBUG: para verificar visualmente la colisión */
  //private color Color;
  
  
  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Arbol(){}
  
  /** Constructor parametrizado */
  public Arbol(PVector posicion, int alto, int ancho) {
    this.posicion = posicion;
    this.alto = alto;
    this.ancho = ancho;
    
    this.sprite = new SpriteObject("arbol_grande.png",ancho,alto);
    this.estado = MaquinaEstadosAnimacion.ESTATICO;
  }
  
  /* -- MÉTODOS -- */
  /** Dibujando al árbol */
  public void display() {
    imageMode(CORNER);
    this.sprite.render(this.estado,this.posicion);
    circle(posicion.x,posicion.y,ancho);
    //ayuda para posicionar el sprite
    //rect(posicion.x, this.posicion.y, 100,100);
    
    //DEBUG: dibujando hitbox
    
    //rect(posicion.x, this.posicion.y, this.ancho, this.alto);
    
    
  }
  
}
