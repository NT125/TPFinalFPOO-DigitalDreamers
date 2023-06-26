/** Clase que representa al jugador */
class Jugador extends SpriteObject implements IMovable, IVisualizable {
  /** atributos */
  private boolean vivo;      //Representa si el jugador aun esta vivo
  private PVector velocidad; //Representa al velocidad del jugador
  private final float velocidadMov=120*(1/frameRate);
  private int rangoVision;   //Representa el rango de vicion que tendra el jugador
  /** atributos2 */
  private PImage luz;

  /** ---------------- ZONA DE CONSTRUCTORES ---------------- */
  //Constructor por defecto
  public Jugador() {
  }
  //Constructor parametrizado
  /*public Jugador(PVector posicion, int ancho, int alto, boolean vivo, PVector velocidad,int rangoVision){
   super(posicion,ancho,alto);
   this.vivo = vivo;
   this.velocidad = velocidad;
   this.rangoVision = rangoVision;
   }*/
  public Jugador(PVector posicion, String nombre, int anchoFrame, int altoFrame, boolean vivo) {
    super(anchoFrame, altoFrame);
    this.posicion = posicion;
    this.velocidad = new PVector(0, 0);
    this.luz = loadImage("LUZ.png");
    this.sprite = loadImage(nombre);
    alto=altoFrame-9;
    ancho= anchoFrame/2;
  }
  /** ---------------- ZONA DE METODOS ---------------- */
  public void display() {
    //yFrame=64;
    noTint();
    if (animacionActivada) {
      image(sprite.get(xFrame, yFrame * 2, anchoFrame, altoFrame), posicion.x, posicion.y); // animacion hacia arriba
    } else if (animacionActivada1) {
      image(sprite.get(xFrame1, yFrame * 0, anchoFrame, altoFrame), posicion.x, posicion.y);// animacion hacia abajo
    } else if (animacionActivada2) {
      image(sprite.get(xFrame2, yFrame * 3, anchoFrame, altoFrame), posicion.x, posicion.y);// animacion hacia izquierda
    } else if (animacionActivada3) {
      image(sprite.get(xFrame3, yFrame * 1, anchoFrame, altoFrame), posicion.x, posicion.y);// animacion hacia derecha
    } else {
      image(sprite.get(xFrame * 0, yFrame * 0, anchoFrame, altoFrame), posicion.x, posicion.y);
    }
    //dibuja la luz que rodea al jugador
    imageMode(CENTER);
    //image(luz,jugador.getPosicion().x,jugador.getPosicion().y);
    imageMode(CORNER);
    //dibuja la hitbox del jugador
    rectMode(CORNER);
    stroke(#CDF56A);
    fill(255, 40);
    rect(posicion.x+ancho/2+3, posicion.y+4, ancho-5, alto);
  }
  public void tirarAntorcha() {
  }
  public void mover() {
    this.posicion.add(this.velocidad);
    //rect(ancho,ancho,width-ancho*2,height-ancho*2);
    /** evita que el jugador salga del la pantalla*/
    if (this.posicion.x <=ancho/2) {
      this.posicion.x = ancho/2;
    }
    if (this.posicion.x >= width -ancho*2-ancho/2) {
      this.posicion.x = width -ancho*2-ancho/2;
    }
    if (this.posicion.y <= ancho/2) {
      this.posicion.y = ancho/2;
    }
    if (this.posicion.y >=height -ancho*2-ancho/2) {
      this.posicion.y = height -ancho*2-ancho/2;
    }
    
  }//end mover

  public char readCommand() {
    return key;
  }

  public void keyPressed() {
    if (this.readCommand() == 'w') {
      this.velocidad.y -= velocidadMov;
      //Regulando la velocidad
      if (this.velocidad.y <= velocidadMov*-1) {
        this.velocidad.y = velocidadMov*-1;
      }
      this.animacionActivada = true; // Activa la animación cuando se mueve hacia arriba
      this.animacionActivada1 = false; // Desactiva la animación hacia abajo
      this.animacionActivada2 = false; // Desactiva la animación hacia la izquierda
      this.animacionActivada3 = false; // Desactiva la animación hacia la derecha
    }
    if (this.readCommand() == 'd') {
      this.velocidad.x += velocidadMov;
      //Regulando la velocidad
      if (this.velocidad.x >= velocidadMov) {
        this.velocidad.x = velocidadMov;
      }
      this.animacionActivada = false; // Desactiva la animación cuando se mueve hacia los lados
      this.animacionActivada1 = false; // Desactiva la animación hacia abajo
      this.animacionActivada2 = false; // Desactiva la animación hacia la izquierda
      this.animacionActivada3 = true; // Desactiva la animación hacia la derecha
    }
    if (this.readCommand() == 's') {
      this.velocidad.y += velocidadMov;
      //Regulando la velocidad
      if (this.velocidad.y >= velocidadMov) {
        this.velocidad.y = velocidadMov;
      }
      this.animacionActivada = false; // Desactiva la animación cuando se mueve hacia arriba
      this.animacionActivada1 = true; // Activa la animación cuando se mueve hacia abajo
      this.animacionActivada2 = false; // Desactiva la animación hacia la izquierda
      this.animacionActivada3 = false; // Desactiva la animación hacia la derecha
    }
    if (this.readCommand() == 'a') {
      this.velocidad.x -= velocidadMov;
      //Regulando la velocidad
      if (this.velocidad.x <= velocidadMov*-1) {
        this.velocidad.x = velocidadMov*-1;
      }
      this.animacionActivada = false; // Desactiva la animación cuando se mueve hacia los lados
      this.animacionActivada1 = false; // Desactiva la animación hacia abajo
      this.animacionActivada2 = true; // Activa la animación cuando se mueve hacia la izquierda
      this.animacionActivada3 = false; // Desactiva la animación hacia la derecha
    }
  }
  
  public void keyReleased() {
    char command = readCommand();
    if (command == 'a' || command == 'd') {
      this.velocidad.x = 0;
    }
    if (command == 'w' || command == 's') {
      this.velocidad.y = 0;
    }
    this.animacionActivada = false;// Desactiva la animación cuando se deja de mover hacia arriba o hacia abajo
    this.animacionActivada1 = false; // Desactiva la animación cuando se deja de mover hacia arriba o hacia abajo
    this.animacionActivada2 = false; // Desactiva la animación cuando se deja de mover hacia la izquierda
    this.animacionActivada3 = false; // Desactiva la animación hacia la derecha
  }
  
  /** Que hace? */
  public void update() {
    mover();
    // Calcula el tiempo transcurrido desde el último cuadro
    float deltaTime = 1.0 / frameRate;

    // Actualiza el tiempo total de la animación
    animationTime += deltaTime;

    // Comprueba si ha pasado el tiempo suficiente para cambiar de fotograma
    if (animationTime >= frameDuration) {
      if (animacionActivada) {
        xFrame += anchoFrame;
        if (xFrame >= sprite.width) {
          xFrame = 0;
        }
      }
      if (animacionActivada1) {
        xFrame1 += anchoFrame; // Incrementar el contador para la animación hacia abajo
        if (xFrame1 >= sprite.width) {
          xFrame1 = 0;
        }
      }
      if (animacionActivada2) {
        xFrame2 += anchoFrame; // Incrementar el contador para la animación hacia la izquierda
        if (xFrame2 >= sprite.width) {
          xFrame2 = 0;
        }
      }
      if (animacionActivada3) {
        xFrame3 += anchoFrame; // Incrementar el contador para la animación hacia la dderecha
        if (xFrame3 >= sprite.width) {
          xFrame3 = 0;
        }
      }
      animationTime = 0; // Reinicia el tiempo de la animación
    }
  }
  public void colisionarEnemigo(Enemigo enemi) {
  }
  //Verificar colisiones
  /*boolean colisionarRectangulos(PVector posicion1, float tam1, PVector posicion2, float tam2) {
    // Verificar si hay una colisión entre dos rectángulos
    if (posicion1.x + tam1/2 >= posicion2.x - tam2/2 &&
      posicion1.x - tam1/2 <= posicion2.x + tam2/2 &&
      posicion1.y + tam1/2 >= posicion2.y - tam2/2 &&
      posicion1.y - tam1/2 <= posicion2.y + tam2/2) {
      return true;
    } else {
      return false;
    }
  }//end colisionarRectangulos*/

  /** ---------------- ZONA DE METODOS ASESORES ---------------- */
  /* getters */
  public boolean getVivo() {
    return this.vivo;
  }
  public PVector getVelocidad() {
    return this.velocidad;
  }
  /* setters */
  public void setVivo(boolean vivo) {
    this.vivo = vivo;
  }
  public void setVelocidad(PVector velocidad) {
    this.velocidad = velocidad;
  }
  public PVector getPosicion() {
    return this.posicion;
  }
}
