/** clase que representa al arbol */
class Arbol extends GameObject implements IVisualizable {
  private PImage imagen;
  /** ---------------- ZONA DE CONSTRUCTURES ---------------- */
  //Constructor por defecto
  public Arbol() {
  }
  //Constructor parametrizado
  public Arbol(PVector posicion, int alto, int ancho ) {
    super(posicion, alto, ancho);
    this.imagen = loadImage("arbol_oscuro.png");
  }
  /** ---------------- ZONA DE METODOS ---------------- */
  public void display() {
    imageMode(CENTER);
    image(this.imagen, this.posicion.x, this.posicion.y, 100, 100);
    fill(0, 40);
    rectMode(CENTER);
    rect(posicion.x, this.posicion.y+alto, this.ancho*2, this.alto);
  }

  public void colisionarJugador(Jugador jugador) {

    boolean isColliding = true; //definicion de una variable del tipo booleana para utilizarla como bandera

    //No habra colicion si la posicion X de este arbol + el ancho del mismo sea menor o igual a la posicion X del jugador
    if (((this.posicion.x+this.ancho) <= jugador.getPosicion().x)
      // O esta posicion X sea mayor o igual a la posicion + el ancho del otro rectangulo
      || (this.posicion.x >= (jugador.getPosicion().x+jugador.getAncho()))
      // O esta posicion Y mas el alto de este rectangulo sea menor o igual a la posicion Y del otro rectangulo
      || ((this.posicion.y+this.alto) <= jugador.getPosicion().y)
      // O esta posicion Y sea mayor que la posicion Y mas el alto del otro rectangulo
      || (this.posicion.y >= (jugador.getPosicion().y+jugador.getAlto()))) {

      isColliding = false;   // asignación a la variable bandera como flaso
    }

    /*Bifurcacion logica que comprueba a la variable bandera*/
    if (isColliding) {
      // hay colicion, cambio de color a los objetos
      println("hay colicion");
    } else {
      // NO hay colicion, color permanece igual
      println("NO hay colicion");
    }
  }//end colisionarJugador
}
