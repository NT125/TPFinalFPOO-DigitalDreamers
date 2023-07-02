/** Clase principal del Jugador */

class Jugador extends SpriteObject implements IMovable, IVisualizable {
  /** -- ATRIBUTOS --  */
  /** Representa si el jugador aún está vivo */
  private boolean vivo;

  /** Representa la velocidad aplicada del jugador */
  private PVector velocidad;

  /** Representa el valor fijo de movimiento del jugador */
  private final float velocidadMov=80;

  /** Representa el rango de visión que tendrá el jugador */
  private int rangoVision;   // <- BORRAR DESPUES (?

  /** Representa la imagen superpuesta que actuará de oscuridad que rodea al jugador */
  private PImage luz;



  /** -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Jugador() {
  }

  /** Constructor parametrizado */
  public Jugador(PVector posicion, int anchoFrame, int altoFrame, float velocidadAnimacion) {
    this.posicion = posicion;
    this.ancho=anchoFrame/2;
    this.alto=altoFrame;

    this.spriteSheet = requestImage("SpritesSombra_ver1.png");
    this.anchoFrame = anchoFrame;
    this.altoFrame = altoFrame;

    this.estado = MaquinaEstadosAnimacion.IDLE;

    this.velocidadAnimacion = velocidadAnimacion;

    this.velocidad = new PVector(0, 0);

    //this.luz = loadImage("LUZ.png");
  }



  /** -- MÉTODOS -- */
  /** Dibujando al jugador */
  public void display() {
    // Dibujando al jugador
    this.render(this.estado);

    // Dibujando la sombra que rodea al jugador
    imageMode(CENTER);
    //image(luz,jugador.getPosicion().x,jugador.getPosicion().y);

    //DEBUG: dibuja la hitbox del jugador
    fill(255, 40);
/*
    rectMode(CORNER);
    stroke(#CDF56A);
    rect(posicion.x, posicion.y, this.ancho, this.alto);*/
  }

  /** Tirando (colocando) una antorcha en el escenario */
  public void tirarAntorcha() {
  }

  /** Moviendo al jugador */
  public void mover() {
    this.posicion.add(this.velocidad);

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

  /** - Métodos propios de Processing - */
  /** Accionando según el input del teclado  */
  public void keyPressed() {
    float deltaTime = 1/frameRate;

    if (this.readCommand() == 'w' || this.readCommand() == 'W') {
      this.estado = MaquinaEstadosAnimacion.MOV_ARRIBA;
      this.velocidad.y -= velocidadMov * deltaTime;
      //Regulando la velocidad
      if (this.velocidad.y <= velocidadMov*-1 * deltaTime) {
        this.velocidad.y = velocidadMov*-1 * deltaTime;
      }
    }

    if (this.readCommand() == 'd' || this.readCommand() == 'D') {
      this.estado = MaquinaEstadosAnimacion.MOV_DERECHA;
      this.velocidad.x += velocidadMov * deltaTime;
      //Regulando la velocidad
      if (this.velocidad.x >= velocidadMov * deltaTime) {
        this.velocidad.x = velocidadMov * deltaTime;
      }
    }

    if (this.readCommand() == 's' || this.readCommand() == 'S') {
      this.estado = MaquinaEstadosAnimacion.MOV_ABAJO;
      this.velocidad.y += velocidadMov * deltaTime;
      //Regulando la velocidad
      if (this.velocidad.y >= velocidadMov * deltaTime) {
        this.velocidad.y = velocidadMov * deltaTime;
      }
    }

    if (this.readCommand() == 'a' || this.readCommand() == 'A') {
      this.estado = MaquinaEstadosAnimacion.MOV_IZQUIERDA;
      this.velocidad.x -= velocidadMov * deltaTime;
      //Regulando la velocidad
      if (this.velocidad.x <= velocidadMov*-1 * deltaTime) {
        this.velocidad.x = velocidadMov*-1 * deltaTime;
      }
    }
  }

  /** Acciones según se suelte el input del teclado */
  public void keyReleased() {
    char command = readCommand();
    if ((command == 'a' || command == 'd') || (command == 'A' || command == 'D')) {
      this.velocidad.x = 0;
    }

    if ((command == 'w' || command == 's') || (command == 'W' || command == 'S')) {
      this.velocidad.y = 0;
    }
    this.estado = MaquinaEstadosAnimacion.IDLE;
  }

  public void verificarColision(Escenario escenario) {
    // Verificar colisiones con los árboles
    ArrayList<Arbol> arboles=escenario.getArboles();
    for (Arbol arbol : arboles) {
      if (colisionarArbol(arbol)) {
        // Si hay colisión, deshacer el movimiento
        if (key == 'w' || key == 'W') {
          posicion.y += 2;
        } else if (key == 's' || key == 'S') {
          posicion.y -= 2;
        } else if (key == 'd' || key == 'D') {
          posicion.x -= 2;
        } else if (key == 'a' || key == 'A') {
          posicion.x += 2;
        }
        break; // Salir del bucle, no es necesario verificar más colisiones
      }
    }
  }

  /** Verificando colisiones con arboles*/
  boolean colisionarArbol(Arbol a) {
    // Verificar si hay una colisión entre dos rectángulos

    /** Evalua al jugador con un arbol*/
    // Comprobar colisión entre dos círculos
    float distancia = dist(this.posicion.x, this.posicion.y, a.getPosicion().x, a.getPosicion().y);
    circle(a.getPosicion().x, a.getPosicion().y, a.getAncho()/3+ancho/2);
    return (distancia < (this.ancho/2 + a.getAncho()/3)); 
  }

  /** -- ACCESORES (GETTERS Y SETTERS) -- */
  /* Getters */
  public boolean getVivo() {
    return this.vivo;
  }
  public PVector getVelocidad() {
    return this.velocidad;
  }

  /* Setters */
  public void setVivo(boolean vivo) {
    this.vivo = vivo;
  }
  public void setVelocidad(PVector velocidad) {
    this.velocidad = velocidad;
  }
}
