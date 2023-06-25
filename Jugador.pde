/** Clase que representa al jugador */
class Jugador extends SpriteObject implements IMovable, IVisualizable{
  /** atributos */
  private boolean vivo;      //Representa si el jugador aun esta vivo
  private PVector velocidad; //Representa al velocidad del jugador
  private final float velocidadMov=120*(1/frameRate);
  private int rangoVision;   //Representa el rango de vicion que tendra el jugador
  /** atributos2 */ 
  private PImage luz;
  
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
  public Jugador(PVector posicion, String nombre, int anchoFrame, int altoFrame, boolean vivo) {
    super(anchoFrame,altoFrame);
    this.posicion = posicion;
    this.velocidad = new PVector(0, 0); 
    this.luz = loadImage("LUZ.png"); 
    this.sprite = loadImage(nombre);
  }
  /** ---------------- ZONA DE METODOS ---------------- */
  public void display(){
    //yFrame=64;
    noTint();
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
    //dibuja la luz que rodea al jugador
    imageMode(CENTER);
    image(luz,jugador.getPosicion().x,jugador.getPosicion().y);
    //dibuja la hitbox del jugador
    rectMode(CENTER);
    stroke(#CDF56A);
    fill(255,40);
    rect(posicion.x, posicion.y, anchoFrame/2, altoFrame);
    
  }
  public void tirarAntorcha(){
    
  }
  public void mover(){
    this.posicion.add(this.velocidad);
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
  public void colisionarEnemigo(Enemigo enemi){
    
  } 
  
  public void colisionarArbol(Arbol a) {

    boolean isColliding = true; //definicion de una variable del tipo booleana para utilizarla como bandera

    //No habra colicion si la posicion X de este jugador + el ancho del mismo sea menor o igual a la posicion X del arbol
    if (((this.posicion.x+this.ancho) <= a.getPosicion().x)
      // O esta posicion X sea mayor o igual a la posicion + el ancho del arbol
      || (this.posicion.x >= (a.getPosicion().x+a.getAncho()))
      // O esta posicion Y mas el alto de este jugador sea menor o igual a la posicion Y del arbol
      || ((this.posicion.y+this.alto) <= a.getPosicion().y)
      // O esta posicion Y sea mayor que la posicion Y mas el alto del arbol
      || (this.posicion.y >= (a.getPosicion().y+a.getAlto()))) {

      isColliding = false;   // asignación a la variable bandera como flaso
    }

    /*Bifurcacion logica que comprueba a la variable bandera*/
    if (isColliding) {
      // hay colicion, cambio de color a los objetos
      println("hay colicion");
      fill(#A7D634);
      a.setColor(#A7D634);
    } else {
      // NO hay colicion, color permanece igual
      println("NO hay colicion");
      a.setColor(0);
    }
  }//end colisionarJugador
  
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
  public PVector getPosicion(){
    return this.posicion;
  }
}
