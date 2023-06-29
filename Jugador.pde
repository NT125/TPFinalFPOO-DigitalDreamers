/** Clase principal del Jugador */

class Jugador extends SpriteObject implements IMovable, IVisualizable {
  /** -- ATRIBUTOS --  */
  /** Representa si el jugador aún está vivo */
  private boolean vivo;
  
  /** Representa la velocidad del jugador */
  private PVector velocidad;
  
  /** Representa su estado actual para aplicar su respectiva animación */
  private int estado;
  
  /** Representa el valor fijo de movimiento del jugador */
  private final float velocidadMov=120*(1/frameRate); // <- MOVERLA A UNA CLASE DE CONSTANTES
  
  /** Representa el rango de visión que tendrá el jugador */
  private int rangoVision;   // <- BORRAR DESPUES (?
  
  /** Representa la imagen superpuesta que actuará de oscuridad que rodea al jugador */
  private PImage luz;
  



  /** -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Jugador() {}
  
  /** Constructor parametrizado */
  public Jugador(PVector posicion, PImage spriteSheet, int anchoFrame, int altoFrame, float velocidadAnimacion) {
    this.posicion = posicion;
    
    this.spriteSheet = spriteSheet;
    this.anchoFrame = anchoFrame;
    this.altoFrame = altoFrame;    
    
    this.velocidadAnimacion = velocidadAnimacion;
    
    this.velocidad = new PVector(0, 0);
    
    this.luz = loadImage("LUZ.png");
  }   
   
   
   
  /** -- MÉTODOS -- */
  /** Dibujando al jugador */
  public void display() {    
    // Dibujando al jugador
    this.render(this.estado);
    
    // Dibujando la sombra que rodea al jugador
    imageMode(CENTER);
    image(luz,jugador.getPosicion().x,jugador.getPosicion().y);
    
    //DEBUG: dibuja la hitbox del jugador
    /*
    rectMode(CORNER);
    stroke(#CDF56A);
    fill(255, 40);
    rect(posicion.x-ancho/2, posicion.y-alto/2, ancho, alto);
    */
  }
  
  /** Tirando (colocando) una antorcha en el escenario */
  public void tirarAntorcha() {}
  
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
    
    if (this.readCommand() == 'w') {
      this.estado = MaquinaEstadosAnimacion.MOV_ARRIBA;
      this.velocidad.y -= velocidadMov;
      //Regulando la velocidad
      if (this.velocidad.y <= velocidadMov*-1) {
        this.velocidad.y = velocidadMov*-1;
      }
    }
    
    if (this.readCommand() == 'd') {
      this.estado = MaquinaEstadosAnimacion.MOV_DERECHA;
      this.velocidad.x += velocidadMov;
      //Regulando la velocidad
      if (this.velocidad.x >= velocidadMov) {
        this.velocidad.x = velocidadMov;
      }
    }
    
    if (this.readCommand() == 's') {
      this.estado = MaquinaEstadosAnimacion.MOV_ABAJO;
      this.velocidad.y += velocidadMov;
      //Regulando la velocidad
      if (this.velocidad.y >= velocidadMov) {
        this.velocidad.y = velocidadMov;
      }
    }
    
    if (this.readCommand() == 'a') {
      this.estado = MaquinaEstadosAnimacion.MOV_IZQUIERDA;
      this.velocidad.x -= velocidadMov;
      //Regulando la velocidad
      if (this.velocidad.x <= velocidadMov*-1) {
        this.velocidad.x = velocidadMov*-1;
      }
    }
  }
  
  /** Acciones según se suelte el input del teclado */
  public void keyReleased() {
    char command = readCommand();
    if (command == 'a' || command == 'd') {
      this.velocidad.x = 0;
    }
    
    if (command == 'w' || command == 's') {
      this.velocidad.y = 0;
    }    
    
  }
  
  /** Actualizando los datos del jugador (posición, animación) */
  
  /** Chequeando la colisión con un enemigo */
  public void colisionarEnemigo(Enemigo e) {}
  
  /** Verificando colisiones */
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
