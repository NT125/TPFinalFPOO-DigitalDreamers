/** Clase de los Árboles: obstáculos para el jugador */
class Arbol extends GameObject implements IVisualizable {
  /** -- ATRIBUTOS -- */
  /** Representa al sprite del arbol */
  private SpriteObject sprite;
  
  /** Representa el estado del sprite del arbol */
  private int estado;
  
  
  /** -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Arbol(){}
  
  /** Constructor parametrizado */
  public Arbol(PVector posicion, int alto, int ancho) {
    super(posicion,ancho,alto);
    
    this.sprite = new SpriteObject("arbol_grande.png",ancho+40,alto+40); //le sumamos 40 al sprite, asi la hitbox es mas pequeñav c
    this.estado = MaquinaEstadosAnimacion.ESTATICO;
  }
  
  /** -- MÉTODOS -- */
  /** Dibujando al árbol */
  public void display() {
    this.sprite.render(this.estado,new PVector(this.posicion.x,this.posicion.y+10)); //le sumamos 10 para que el sprite este mas abajo y la hitbox este mas arriba
    
    //DEBUG: dibujando hitbox
    //circle(posicion.x,posicion.y,ancho);
    
  }
}
