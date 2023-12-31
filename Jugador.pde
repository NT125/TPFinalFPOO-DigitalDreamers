/** Clase que representa al Jugador */
class Jugador extends GameObject implements IMovable, IVisualizable {
  /* -- ATRIBUTOS --  */
  /** Representa la velocidad aplicada del jugador */
  private PVector velocidad;

  /** Representa la imagen superpuesta que actuará de oscuridad que rodea al jugador */
  private PImage luz;

  /** Representa el estadoAnim de movimiento del jugador */
  private int estadoAnim;

  /** Representa al sprite del jugador */
  private SpriteObject sprite;


  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Jugador() {}

  /** Constructor parametrizado */
  public Jugador(PVector posicion, int ancho, int alto) {
    this.posicion = posicion;
    this.ancho=ancho/2;
    this.alto=alto;
    this.sprite = new SpriteObject("SpritesSombra_ver1.png", ancho, alto);
    this.velocidad = new PVector(80, 80);
    this.luz = loadImage("LUZ.png");
  }


  /* -- MÉTODOS -- */
  /** Dibujando al jugador */
  public void display() {
    // Dibujando al jugador
    this.sprite.render(this.estadoAnim, new PVector(this.posicion.x, this.posicion.y)); // Accedemos al metodo RENDER de spirteObject para renderizar el sprite del Jugador

    // Dibujamos la visibilidad del jugador
    image(luz,jugador.getPosicion().x,jugador.getPosicion().y);
  }

  /** Moviendo al jugador */
  public void mover() {
    float deltaTime = 1.0/frameRate;
    
    // Funciona pero tiene problemas con la colision
    if (W_PRESSED && !A_PRESSED && !S_PRESSED && !D_PRESSED ) {
      this.posicion.y-= this.velocidad.y * deltaTime;
    }else
    if (S_PRESSED && !D_PRESSED && !W_PRESSED && !A_PRESSED ) {
      this.posicion.y+= this.velocidad.y * deltaTime;
    }else
    if (D_PRESSED && !W_PRESSED && !S_PRESSED && !A_PRESSED ) {
      this.posicion.x+= this.velocidad.x * deltaTime;
    }else
    if (A_PRESSED && !S_PRESSED && !W_PRESSED && !D_PRESSED ) {
      this.posicion.x-= this.velocidad.x * deltaTime;
    }

    // evita que el jugador salga de la pantalla
    if (this.posicion.x - ancho/2 <= 30) {
      this.posicion.x = ancho/2 + 30;
    }
    if (this.posicion.x + ancho/2 >= width - 30) {
      this.posicion.x = (width - 30) - ancho/2;
    }
    if (this.posicion.y - alto/2 <= 30) {
      this.posicion.y = alto/2 + 30;
    }
    if (this.posicion.y + alto/2 >= height - 30) {
      this.posicion.y = (height - 30) - alto/2;
    }
  }// fin mover

  /** Verificando colisiones con los arboles */
  public void colisionarArbol(Colisionador colisionador, ArrayList<Arbol> arboles) {
    float deltaTime = 1.0/frameRate;
    for (Arbol a : arboles) {   
      // Verificar colisiones con un arbol
      if (colisionador.colisionarCircRect(a, jugador)) {
        println("hay colision con Arbol");
        // Si hay colisión, deshacer el movimiento con el opuesto
        if ( this.estadoAnim==MaquinaEstadosAnimacion.MOV_ARRIBA) {
          this.posicion.y+= this.velocidad.y * deltaTime;
        } else if (this.estadoAnim == MaquinaEstadosAnimacion.MOV_ABAJO) {
          this.posicion.y-= this.velocidad.y * deltaTime;
        } else if (this.estadoAnim== MaquinaEstadosAnimacion.MOV_DERECHA) {
          this.posicion.x-= this.velocidad.x * deltaTime;
        } else if (this.estadoAnim == MaquinaEstadosAnimacion.MOV_IZQUIERDA) {
          this.posicion.x+= this.velocidad.x * deltaTime;
        }
      }
    }
  } //Fin colisionarArbol


  /* -- ACCESORES (GETTERS Y SETTERS) -- */
  /* Getters */
  /** Devuelve el valor de la velocidad del jugador */
  public PVector getVelocidad() {
    return this.velocidad;
  }

  /* Setters */
  /** Asigna un valor de si el jugador esta vivo */
  public void setVelocidad(PVector velocidad) {
    this.velocidad = velocidad;
  }
  /** Asigna un valor del estadoAnim del movimiento del jugador */
  public void setEstadoAnim(int estadoAnim) {
    this.estadoAnim=estadoAnim;
  }
}
