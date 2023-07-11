/** Clase de los Árboles: obstáculos para el jugador */
class Arbol extends GameObject implements IVisualizable {
  /* -- ATRIBUTOS -- */
  /** Representa al sprite del arbol */
  private SpriteObject sprite;
  
  /** Representa el estadoAnim del sprite del arbol */
  private int estadoAnim;
  
  
  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Arbol(){}
  
  /** Constructor parametrizado */
  public Arbol(PVector posicion, int alto, int ancho) {
    super(posicion,ancho,alto);
    this.sprite = new SpriteObject("arbol_grande.png",ancho+40,alto+40); //le sumamos 40 al sprite, asi la hitbox es mas pequeña
    this.estadoAnim = MaquinaEstadosAnimacion.ESTATICO;
  }
  
  /* -- MÉTODOS -- */
  /** Dibujando al árbol */
  public void display() {
    this.sprite.render(this.estadoAnim,new PVector(this.posicion.x,this.posicion.y+10)); //le sumamos 10 para que el sprite este mas abajo y la hitbox este mas arriba
  }
}
