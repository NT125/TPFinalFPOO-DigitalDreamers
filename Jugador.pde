/** Clase que representa al jugador */
class Jugador extends GameObject implements IMovable, IVisualizable{
  /** atributos */
  private boolean vivo;      //Representa si el jugador aun esta vivo
  private PVector velocidad; //Representa al velocidad del jugador
  private int rangoVision;   //Representa el rango de vicion que tendra el jugador
  /** atributos2 */
  private PVector posicion;
  private PImage sprite;
  private int anchoframe;
  private int altoframe;
  private int xframe;
  private int yframe;  //contador para animacion hacia arriba
  private int xframe1; // Nuevo contador para la animación hacia abajo
  private int xframe2; // Nuevo contador para la animación hacia izquierda
  private int xframe3; // Nuevo contador para la animación hacia derecha
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
  public Jugador(PVector posicion, PImage sprite, int anchoframe, int altoframe, boolean vivo,PVector velocidad) {
    this.posicion = posicion;
    this.velocidad = new PVector(0, 0);
    this.sprite = sprite;
    this.anchoframe = anchoframe;
    this.altoframe = altoframe;
    this.xframe = 0;
    this.yframe = 0;
    this.xframe1 = 0; // Inicializar el contador de la animación hacia abajo en 0
    this.xframe2 = 0; // Inicializar el contador de la animación hacia la izquierda en 0
    this.animacionActivada = false;
    this.animacionActivada1 = false;
    this.animacionActivada2 = false;
  }
  /** ---------------- ZONA DE METODOS ---------------- */
  public void display(){
    background(150);
    yframe=39;
    imageMode(CENTER);
    if (animacionActivada) {
      image(sprite.get(xframe, yframe * 1, anchoframe, altoframe), posicion.x, posicion.y); // animacion hacia arriba
    } else if (animacionActivada1){
      image(sprite.get(xframe1, yframe * 0, anchoframe, altoframe), posicion.x, posicion.y);// animacion hacia abajo
    } else if (animacionActivada2){
      image(sprite.get(xframe2, yframe * 2, anchoframe, altoframe), posicion.x, posicion.y);// animacion hacia izquierda
    }  else if (animacionActivada3){
      image(sprite.get(xframe3, yframe * 3, anchoframe, altoframe), posicion.x, posicion.y);// animacion hacia derecha
    }
    else {
      image(sprite.get(xframe * 0, yframe * 0, anchoframe, altoframe), posicion.x, posicion.y);
    }
  }
  public void tirarAntorcha(){
    
  }
  public void mover(){
  }
    public char readCommand(){    
    return key;
  }
    
    public void keyPressed(){
    if(this.readCommand() == 'w'){
      this.velocidad.y -= 5;
      //Regulando la velocidad
      if(this.velocidad.y <= -5){
        this.velocidad.y = -5;
      }
      this.animacionActivada = true; // Activa la animación cuando se mueve hacia arriba
      this.animacionActivada1 = false; // Desactiva la animación hacia abajo
      this.animacionActivada2 = false; // Desactiva la animación hacia la izquierda
      this.animacionActivada3 = false; // Desactiva la animación hacia la derecha
    }
    if(this.readCommand() == 'd'){
      this.velocidad.x += 5;
      //Regulando la velocidad
      if(this.velocidad.x >= 5){
        this.velocidad.x = 5;
      }
      this.animacionActivada = false; // Desactiva la animación cuando se mueve hacia los lados
      this.animacionActivada1 = false; // Desactiva la animación hacia abajo
      this.animacionActivada2 = false; // Desactiva la animación hacia la izquierda
      this.animacionActivada3 = true; // Desactiva la animación hacia la derecha
    }
    if(this.readCommand() == 's'){
      this.velocidad.y += 5;
      //Regulando la velocidad
      if(this.velocidad.y >= 5){
        this.velocidad.y = 5;
      }
      this.animacionActivada = false; // Desactiva la animación cuando se mueve hacia arriba
      this.animacionActivada1 = true; // Activa la animación cuando se mueve hacia abajo
      this.animacionActivada2 = false; // Desactiva la animación hacia la izquierda
      this.animacionActivada3 = false; // Desactiva la animación hacia la derecha
    }
    if(this.readCommand() == 'a'){
      this.velocidad.x -= 5;
      //Regulando la velocidad
      if(this.velocidad.x <= -5){
        this.velocidad.x = -5;
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
    posicion.add(velocidad);
    if (animacionActivada) {
      xframe += anchoframe;
      if (xframe >= sprite.width) {
        xframe = 0;
      }
    }
    if (animacionActivada1) {
      xframe1 += anchoframe; // Incrementar el contador para la animación hacia abajo
      if (xframe1 >= sprite.width) {
        xframe1 = 0;
      }
    }
    if (animacionActivada2) {
      xframe2 += anchoframe; // Incrementar el contador para la animación hacia la izquierda
      if (xframe2 >= sprite.width) {
        xframe2 = 0;
      }
    }
    if (animacionActivada3) {
      xframe3 += anchoframe; // Incrementar el contador para la animación hacia la dderecha
      if (xframe3 >= sprite.width) {
        xframe3 = 0;
      }
    }
  }
  
  public void colisionEnemigo(Enemigo enemi){
    
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
