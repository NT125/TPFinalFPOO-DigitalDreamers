/** Clase que representa al jugador */
class Jugador extends GameObject implements IMovable, IVisualizable{
  /** atributos */
  private boolean vivo;      //Representa si el jugador aun esta vivo
  private PVector velocidad; //Representa al velocidad del jugador
  private final float velocidadMov=3;
  private int rangoVision;   //Representa el rango de vicion que tendra el jugador
  /** atributos2 */
  private PImage sprite;
  private int anchoFrame;
  private int altoFrame;
  private int xFrame;
  private int yFrame;  //contador para animacion hacia arriba
  private int xFrame1; // Nuevo contador para la animación hacia abajo
  private int xFrame2; // Nuevo contador para la animación hacia izquierda
  private int xFrame3; // Nuevo contador para la animación hacia derecha
  private boolean animacionActivada;
  private boolean animacionActivada1;
  private boolean animacionActivada2;
  private boolean animacionActivada3;
  
  /** ---------------- ZONA DE CONSTRUCTORES ---------------- */
  //Constructor por defecto
  public Jugador(){}
  //Constructor parametrizado
  /*public Jugador(PVector posicion, int ancho, int alto, boolean vivo, PVector velocidad,int rangoVision){
    super(posicion,ancho,alto);
    this.vivo = vivo;
    this.velocidad = velocidad;
    this.rangoVision = rangoVision;
  }*/
  public Jugador(PVector posicion, PImage sprite, int anchoFrame, int altoFrame, boolean vivo) {
    this.posicion = posicion;
    this.velocidad = new PVector(0, 0);
    this.sprite = sprite;
    this.anchoFrame = anchoFrame;
    this.altoFrame = altoFrame;
    this.xFrame = 0;
    this.yFrame = 0;
    this.xFrame1 = 0; // Inicializar el contador de la animación hacia abajo en 0
    this.xFrame2 = 0; // Inicializar el contador de la animación hacia la izquierda en 0
    this.animacionActivada = false;
    this.animacionActivada1 = false;
    this.animacionActivada2 = false;
  }
  /** ---------------- ZONA DE METODOS ---------------- */
  public void display(){
    yFrame=64;
    imageMode(CENTER);
    if (animacionActivada) {
      image(sprite.get(xFrame, yFrame * 2, anchoFrame, altoFrame), posicion.x, posicion.y); // animacion hacia arriba
    } else if (animacionActivada1){
      image(sprite.get(xFrame1, yFrame * 0, anchoFrame, altoFrame), posicion.x, posicion.y);// animacion hacia abajo
    } else if (animacionActivada2){
      image(sprite.get(xFrame2, yFrame * 3, anchoFrame, altoFrame), posicion.x, posicion.y);// animacion hacia izquierda
    }  else if (animacionActivada3){
      image(sprite.get(xFrame3, yFrame * 1, anchoFrame, altoFrame), posicion.x, posicion.y);// animacion hacia derecha
    }
    else {
      image(sprite.get(xFrame * 0, yFrame * 0, anchoFrame, altoFrame), posicion.x, posicion.y);
    }
    rectMode(CENTER);
    stroke(#CDF56A);
    fill(255,40);
    rect(posicion.x, posicion.y+ altoFrame/4, anchoFrame/2, altoFrame/2);
    
  }
  public void tirarAntorcha(){
    
  }
  
  public char readCommand(){    
    return key;
  }
    
    public void keyPressed(){
    if(this.readCommand() == 'w'){
      this.velocidad.y -= velocidadMov;
      //Regulando la velocidad
      if(this.velocidad.y <= velocidadMov*-1){
        this.velocidad.y = velocidadMov*-1;
      }
      this.animacionActivada = true; // Activa la animación cuando se mueve hacia arriba
      this.animacionActivada1 = false; // Desactiva la animación hacia abajo
      this.animacionActivada2 = false; // Desactiva la animación hacia la izquierda
      this.animacionActivada3 = false; // Desactiva la animación hacia la derecha
    }
    if(this.readCommand() == 'd'){
      this.velocidad.x += velocidadMov;
      //Regulando la velocidad
      if(this.velocidad.x >= velocidadMov){
        this.velocidad.x = velocidadMov;
      }
      this.animacionActivada = false; // Desactiva la animación cuando se mueve hacia los lados
      this.animacionActivada1 = false; // Desactiva la animación hacia abajo
      this.animacionActivada2 = false; // Desactiva la animación hacia la izquierda
      this.animacionActivada3 = true; // Desactiva la animación hacia la derecha
    }
    if(this.readCommand() == 's'){
      this.velocidad.y += velocidadMov;
      //Regulando la velocidad
      if(this.velocidad.y >= velocidadMov){
        this.velocidad.y = velocidadMov;
      }
      this.animacionActivada = false; // Desactiva la animación cuando se mueve hacia arriba
      this.animacionActivada1 = true; // Activa la animación cuando se mueve hacia abajo
      this.animacionActivada2 = false; // Desactiva la animación hacia la izquierda
      this.animacionActivada3 = false; // Desactiva la animación hacia la derecha
    }
    if(this.readCommand() == 'a'){
      this.velocidad.x -= velocidadMov;
      //Regulando la velocidad
      if(this.velocidad.x <= velocidadMov*-1){
        this.velocidad.x = velocidadMov*-1;
      }
      this.animacionActivada = false; // Desactiva la animación cuando se mueve hacia los lados
      this.animacionActivada1 = false; // Desactiva la animación hacia abajo
      this.animacionActivada2 = true; // Activa la animación cuando se mueve hacia la izquierda
      this.animacionActivada3 = false; // Desactiva la animación hacia la derecha
    }
  }
  
  public void keyReleased(){
    if(this.readCommand() == 'a' || this.readCommand() == 'd'){
      this.velocidad.x = 0;
      this.animacionActivada = false; // Desactiva la animación cuando se deja de mover hacia arriba o hacia abajo
      this.animacionActivada1 = false; // Desactiva la animación cuando se deja de mover hacia arriba o hacia abajo
      this.animacionActivada2 = false; // Desactiva la animación cuando se deja de mover hacia la izquierda
      this.animacionActivada3 = false; // Desactiva la animación hacia la derecha
    }  
    if(this.readCommand() == 'w' || this.readCommand() == 's'){
      this.velocidad.y = 0;
      this.animacionActivada = false; // Desactiva la animación cuando se deja de mover hacia arriba o hacia abajo
      this.animacionActivada1 = false; // Desactiva la animación cuando se deja de mover hacia arriba o hacia abajo
      this.animacionActivada2 = false; // Desactiva la animación cuando se deja de mover hacia la izquierda
      this.animacionActivada3 = false; // Desactiva la animación hacia la derecha
    } 
  }
  
  public void update() {
    this.posicion.add(this.velocidad);
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
  }
  
  public void colisionarEnemigo(Enemigo enemi){
    
  } 
  /** ---------------- ZONA DE METODOS ASESORES ---------------- */
  /* getters */
  public boolean getVivo(){
    return this.vivo;
  }
  public PVector getVelocidad(){
    return this.velocidad;
  }
  /* setters */
  public void setVivo(boolean vivo){
    this.vivo = vivo;
  }
  public void setVelocidad(PVector velocidad){
    this.velocidad = velocidad;
  }
}
