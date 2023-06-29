/** Clase de los Árboles: obstáculos para el jugador */

class Arbol extends GameObject implements IVisualizable {
  /** -- ATRIBUTOS -- */
  /** Sprite del árbol */
  private PImage imagen;
  
  /** DEBUG: para verificar visualmente la colisión */
  //private color Color;
  
  
  
  /** -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Arbol(){}
  
  /** Constructor parametrizado */
  public Arbol(PVector posicion, int alto, int ancho) {
    super(posicion, alto, ancho);
    this.imagen = loadImage("arbol_grande.png");
    //Color=0; //DEBUG: para verificar visualmente la colisión
  }
  
  
  /** -- MÉTODOS -- */
  /** Dibujando al árbol */
  public void display() {
    imageMode(CORNER);
    image(this.imagen, this.posicion.x-ancho/2, this.posicion.y, 100, 100);
    
    //ayuda para posicionar el sprite
    /*
    rect(posicion.x-ancho/2, this.posicion.y, 100,100);
    fill(Color, 40);
    */
    
    //DEBUG: dibujando hitbox
    /*
    rectMode(CORNER);
    rect(posicion.x, this.posicion.y, this.ancho, this.alto);
    */
    
  }
  
  
  /** -- ACCESORES (GETTERS Y SETTERS) -- */
  /** Setters */
  /*
  public void setColor(color Color){ //DEBUG: para verificar visualmente la colisión
    this.Color=Color;
  }*/

}
