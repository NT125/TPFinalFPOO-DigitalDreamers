/** Clase abstracta que gestiona los sprites de los elementos renderizables del juego */

class SpriteObject extends GameObject{
  /** -- ATRIBUTOS -- */
  /** SpriteSheet del Objeto */
  protected PImage spriteSheet; 
  
  /** Ancho del Frame individual */
  protected int anchoFrame;
  
  /** Alto del Frame individual */
  protected int altoFrame;  
  
  /** Posición inicial x del Frame */
  protected int xFrame;
  
  /** Posición inicial y del Frame (contador para animación hacia arriba) */
  protected int yFrame;
  
  //atributos nuevos que reemplazarán los anteriores <- borrar desp
  
  /** Puntero al primer píxel en x de un frame */
  protected float punteroXFrame;
  
  /** Puntero al primer píxel en x del siguiente frame a punteroXFrame; */
  protected float punteroXFrameSiguiente;
  
  // HAY QUE OPTIMIZAR LA DURACIÓN DE LAS ANIMACIONES CON EL MÉTODO DEL PROFE
  /** Representa la velocidad con la que se reproducirá la animación (la transición entre sprites) */
  protected float velocidadAnimacion;
  
  
    
  
  /** -- CONSTRUCTORES -- */
  /** Constructor por Defecto */
  public SpriteObject(){ } 
  
  /** Costructor Parametrizado */
  public SpriteObject(int anchoFrame, int altoFrame, PImage spriteSheet){
    this.xFrame = 0;
    this.yFrame = 0;
    this.anchoFrame = anchoFrame;
    this.altoFrame = altoFrame;
    
    this.spriteSheet = spriteSheet;
    
    this.punteroXFrame = this.xFrame;
    this.punteroXFrameSiguiente = this.anchoFrame;
  }
  
  
  
  /** -- MÉTODOS -- */  
  /** Diubjando los Sprites */
  public void render(int estado){
    imageMode(CENTER);
    
    //Calculando DeltaTime
    float deltaTime = 1/frameRate;
    println(frameRate);
    println(1/frameRate);
    println("DELTATIME:",deltaTime);
    switch(estado){
      case MaquinaEstadosAnimacion.IDLE:
      {
        //Colocando el puntero en la fila de idle
        this.yFrame = 0;
        
        //Dibujando el frame
        image(this.spriteSheet.get(this.xFrame, this.yFrame, this.anchoFrame, this.altoFrame), this.posicion.x, this.posicion.y);
        
        //Transicionando entre los distintos Sprites
        this.punteroXFrame += anchoFrame*velocidadAnimacion*deltaTime;
        println(anchoFrame,velocidadAnimacion,deltaTime,anchoFrame*velocidadAnimacion*deltaTime);
        println("IDLE");
        println(this.xFrame, this.punteroXFrame);
        
        if(this.punteroXFrame >= this.punteroXFrameSiguiente){
          this.xFrame += this.anchoFrame;     
          this.punteroXFrameSiguiente = this.xFrame+this.anchoFrame;
          /*//Reiniciando Punteros
          this.punteroXFrame = 0;
          this.punteroXFrameSiguiente = this.anchoFrame;*/
          
          //Reiniciando animación al llegar al final del spriteSheet
          if(this.xFrame >= this.spriteSheet.width){
            this.xFrame = 0;
            this.punteroXFrame = 0;
            this.punteroXFrameSiguiente = this.anchoFrame;
          }
        } 
      } break;
      case MaquinaEstadosAnimacion.MOV_ABAJO:
      {
        //Colocando el puntero en la fila de mov abajo
        this.yFrame = this.altoFrame;
        
        //Dibujando el frame
        image(this.spriteSheet.get(this.xFrame, this.yFrame, this.anchoFrame, this.altoFrame), this.posicion.x, this.posicion.y);
        //Transicionando entre los distintos Sprites
        this.punteroXFrame += anchoFrame*velocidadAnimacion*deltaTime;
        print("ABJ");
        println(this.xFrame, this.punteroXFrame);
        
        if(this.punteroXFrame >= this.punteroXFrameSiguiente){
          this.xFrame += this.anchoFrame;     
          this.punteroXFrameSiguiente = this.xFrame+this.anchoFrame;
          /*//Reiniciando Punteros
          this.punteroXFrame = 0;
          this.punteroXFrameSiguiente = this.anchoFrame;*/
          
          //Reiniciando animación al llegar al final del spriteSheet
          if(this.xFrame >= this.spriteSheet.width){
            this.xFrame = 0;
            this.punteroXFrame = 0;
            this.punteroXFrameSiguiente = this.anchoFrame;
          }
        } 
      } break;
      case MaquinaEstadosAnimacion.MOV_DERECHA:
      {
        //Colocando el puntero en la fila de mov abajo
        this.yFrame = this.altoFrame*2;
        
        //Dibujando el frame
        image(this.spriteSheet.get(this.xFrame, this.yFrame, this.anchoFrame, this.altoFrame), this.posicion.x, this.posicion.y);
        
        println(this.xFrame);
        //Transicionando entre los distintos Sprites
        this.punteroXFrame += anchoFrame*velocidadAnimacion*deltaTime;
        print("DER");
        println(this.xFrame, this.punteroXFrame);
        
        if(this.punteroXFrame >= this.punteroXFrameSiguiente){
          this.xFrame += this.anchoFrame;     
          this.punteroXFrameSiguiente = this.xFrame+this.anchoFrame;
          /*//Reiniciando Punteros
          this.punteroXFrame = 0;
          this.punteroXFrameSiguiente = this.anchoFrame;*/
          
          //Reiniciando animación al llegar al final del spriteSheet
          if(this.xFrame >= this.spriteSheet.width){
            this.xFrame = 0;
            this.punteroXFrame = 0;
            this.punteroXFrameSiguiente = this.anchoFrame;
          }
        } 
      } break;
      case MaquinaEstadosAnimacion.MOV_ARRIBA:
      {
        //Colocando el puntero en la fila de mov abajo
        this.yFrame = this.altoFrame*3;
        
        //Dibujando el frame
        image(this.spriteSheet.get(this.xFrame, this.yFrame, this.anchoFrame, this.altoFrame), this.posicion.x, this.posicion.y);
        
        //Transicionando entre los distintos Sprites
        this.punteroXFrame += anchoFrame*velocidadAnimacion*deltaTime;
        print("ARR");
        println(this.xFrame, this.punteroXFrame);
        
        if(this.punteroXFrame >= this.punteroXFrameSiguiente){
          this.xFrame += this.anchoFrame;     
          this.punteroXFrameSiguiente = this.xFrame+this.anchoFrame;
          /*//Reiniciando Punteros
          this.punteroXFrame = 0;
          this.punteroXFrameSiguiente = this.anchoFrame;*/
          
          //Reiniciando animación al llegar al final del spriteSheet
          if(this.xFrame >= this.spriteSheet.width){
            this.xFrame = 0;
            this.punteroXFrame = 0;
            this.punteroXFrameSiguiente = this.anchoFrame;
          }
        } 
      } break;
      case MaquinaEstadosAnimacion.MOV_IZQUIERDA:
      {
        //Colocando el puntero en la fila de mov abajo
        this.yFrame = this.altoFrame*4;
        
        //Dibujando el frame
        image(this.spriteSheet.get(this.xFrame, this.yFrame, this.anchoFrame, this.altoFrame), this.posicion.x, this.posicion.y);
        
        //Transicionando entre los distintos Sprites
        this.punteroXFrame += anchoFrame*velocidadAnimacion*deltaTime;
        print("IZQ");
        println(this.xFrame, this.punteroXFrame);
        
        if(this.punteroXFrame >= this.punteroXFrameSiguiente){
          this.xFrame += this.anchoFrame;     
          this.punteroXFrameSiguiente = this.xFrame+this.anchoFrame;
          /*//Reiniciando Punteros
          this.punteroXFrame = 0;
          this.punteroXFrameSiguiente = this.anchoFrame;*/
          
          //Reiniciando animación al llegar al final del spriteSheet
          if(this.xFrame >= this.spriteSheet.width){
            this.xFrame = 0;
            this.punteroXFrame = 0;
            this.punteroXFrameSiguiente = this.anchoFrame;
          }
        } 
      } break;
    }
  }
}
