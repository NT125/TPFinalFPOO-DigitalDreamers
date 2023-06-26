/** clase que representa al enemigo */
class Enemigo extends SpriteObject implements IMovable, IVisualizable{
  /* atributos */
  private PImage enemigo;
  private PVector velocidad;  //Representa la velocidad del enemigo
  
  /** ---------------- ZONA DE CONSTRUCTORES ---------------- */
  //Constructor por defecto
  public Enemigo(){}
  //Constructor parametrizado
  public Enemigo(PVector posicion,int ancho,int alto, PVector velocidad){
    this.ancho=ancho;
    this.alto=alto;
    this.posicion=posicion;
    this.velocidad = velocidad;
    this.enemigo = loadImage("enemigo-removebg-preview.png");
  }
  /** ---------------- ZONA DE METODOS ---------------- */
  public void display(){
    image(enemigo,posicion.x-ancho/2,posicion.y-alto/2,ancho,alto);
    //hitbox
    ellipse(posicion.x,posicion.y,ancho,alto);
    strokeWeight(3);
    point(posicion.x,posicion.y);
    strokeWeight(1);
  }
  public void rebotar(){
    //rectangulo para ver donde colisiona el punto del enemigo
    rect(ancho,alto,width-ancho*2, height-alto*2);
    //el enemigono sale de la pantalla
    if(this.posicion.x >= width-ancho || this.posicion.x<= 0+ancho){
      this.velocidad.x *= -1;
    }
    if(this.posicion.y >= height-alto || this.posicion.y <= 0+alto){
      this.velocidad.y *= -1;
    }
  }
  public void mover(){
    float deltaTime= 1/ frameRate;
    PVector velocidadNormal= new PVector(this.velocidad.x*deltaTime,this.velocidad.y*deltaTime);                
    posicion.add(velocidadNormal);
  }
  public void ColisionParedes(){
  
  }
  /** ---------------- ZONA DE METODOS ASESORES ---------------- */
  /* getters */
  public PVector getVelocidad(){
    return this.velocidad;
  }
  /* setters */
  public void setVelocidad(PVector velocidad){
    this.velocidad = velocidad;
  }
}
