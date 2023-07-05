/** Clase principal del Jugador */

class Jugador extends GameObject implements IMovable, IVisualizable {
  /* -- ATRIBUTOS --  */
  /** Representa si el jugador aún está vivo */
  private boolean vivo;

  /** Representa la velocidad aplicada del jugador */
  private PVector velocidad;

  /** Representa el rango de visión que tendrá el jugador */
  private int rangoVision;   // <- BORRAR DESPUES (?

  /** Representa la imagen superpuesta que actuará de oscuridad que rodea al jugador */
  private PImage luz;

  /** Representa el estado de movimiento del jugador */
  private int estado;
  
  /** Representa al sprite del jugador */
  private SpriteObject sprite;


  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Jugador() {
  }

  /** Constructor parametrizado */
  public Jugador(PVector posicion, int anchoFrame, int altoFrame) {
    this.posicion = posicion;
    this.ancho=anchoFrame/2;
    this.alto=altoFrame;
    this.sprite = new SpriteObject("SpritesSombra_ver1.png",anchoFrame,altoFrame);

    this.velocidad = new PVector(80, 80);

    //this.luz = loadImage("LUZ.png");
  }


  /* -- MÉTODOS -- */
  /** Dibujando al jugador */
  public void display() {
    // Dibujando al jugador
    this.sprite.render(this.estado, new PVector(this.posicion.x+ancho/2,this.posicion.y+alto/2)); // le pasamos la posicion dividida porque el ImageMode CENTER cambia de manera visual 

    // Dibujando la sombra que rodea al jugador
    //image(luz,jugador.getPosicion().x,jugador.getPosicion().y);
    
    //DEBUG: dibuja la hitbox del jugador
    fill(255, 40);

    stroke(#CDF56A);
    rect(posicion.x, posicion.y, this.ancho, this.alto);
  }

  /** Tirando (colocando) una antorcha en el escenario */
  public void tirarAntorcha() {
  }

  /** Moviendo al jugador */
  public void mover() {
    float deltaTime = 1/frameRate;
    
    switch(estado){
      case MaquinaEstadosAnimacion.MOV_ARRIBA:{
        this.posicion.y-= this.velocidad.y * deltaTime;
        break;
      }
      case MaquinaEstadosAnimacion.MOV_ABAJO:{
        this.posicion.y+= this.velocidad.y * deltaTime;
        break;
      }
      case MaquinaEstadosAnimacion.MOV_DERECHA:{
        this.posicion.x+= this.velocidad.x * deltaTime;
        break;
      }
      case MaquinaEstadosAnimacion.MOV_IZQUIERDA:{
        this.posicion.x-= this.velocidad.x * deltaTime;
        break;
      }
    }

    // evita que el jugador salga de la pantalla
    if (this.posicion.x - ancho/2 <= 30) {
      this.posicion.x = ancho/2 + 30;
    }
    if (this.posicion.x + ancho/2 >= width - 30) {
      this.posicion.x = (width - 30) - ancho/2;
    }
    if (this.posicion.y - alto/2 <= 40) {
      this.posicion.y = alto/2 + 40;
    }
    if (this.posicion.y + alto/2 >= height - 40) {
      this.posicion.y = (height - 40) - alto/2;
    }
  }

  /** Leyendo el input del teclado */
  public char readCommand() {
    return key;
  }

  /** Verificando colisiones con arboles*/
  /*
  public void verificarColision(Arbol arbol) {
    float deltaTime = 1/frameRate; 
    // Verificar colisiones con un arbol
      if (colisionador.colisionarCirculo(arbol)) {
        println("hay colision con Arbol");
        // Si hay colisión, deshacer el movimiento con el opuesto
        if ( this.estado==MaquinaEstadosAnimacion.MOV_ARRIBA) {
          this.posicion.y+= this.velocidad.y * deltaTime;
        } else if (this.estado == MaquinaEstadosAnimacion.MOV_ABAJO) {
          this.posicion.y-= this.velocidad.y * deltaTime;
        } else if (this.estado== MaquinaEstadosAnimacion.MOV_DERECHA) {
          this.posicion.x-= this.velocidad.x * deltaTime;
        } else if (this.estado == MaquinaEstadosAnimacion.MOV_IZQUIERDA) {
          this.posicion.x+= this.velocidad.x * deltaTime;
        } 
      } 
  }*/
  /*
  public void colisionarArbol(ArrayList<Escenario> arboles){
    Arbol arbol; 
    for(Arbol a: arboles) {
      verificarColision(a);
    }
  }*/


  /* -- ACCESORES (GETTERS Y SETTERS) -- */
  /* Getters */
  /** Devuelve el valor del estado vivo del jugador */
  public boolean getVivo() {
    return this.vivo;
  }
  /** Devuelve el valor de la velocidad del jugador */
  public PVector getVelocidad() {
    return this.velocidad;
  }

  /* Setters */
  /** Asigna un valor del estado vivo del jugador */
  public void setVivo(boolean vivo) {
    this.vivo = vivo;
  }
  /** Asigna un valor de si el jugador esta vivo */
  public void setVelocidad(PVector velocidad) {
    this.velocidad = velocidad;
  }
  /** Asigna un valor del estado del movimiento del jugador */
  public void setEstado(int estado){
    this.estado=estado;
  }
}
