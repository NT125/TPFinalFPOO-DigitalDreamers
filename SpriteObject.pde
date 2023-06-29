/** Clase abstracta que representa a los sprites del juego */

class SpriteObject extends GameObject{
  /** -- ATRIBUTOS -- */
  /** SpriteSheet del Objeto */
  protected PImage sprite; 
  
  /** Ancho del Frame individual */
  protected int anchoFrame;
  
  /** Alto del Frame individual */
  protected int altoFrame;  
  
  /** Posición inicial x del Frame */
  protected int xFrame;
  
  /** Posición inicial y del Frame (contador para animación hacia arriba ) */
  protected int yFrame;
  
  // POSTERIORMENTE VER SI CORREGIMOS/OPTIMIZAMOS ALGUNOS ATRIBUTOS (los que dicen 1,2,3)
  /** Nuevo contador para la animación hacia abajo */
  protected int xFrame1; // Nuevo contador para la animación hacia abajo
  
  /** Nuevo contador para la animación hacia la izquierda */
  protected int xFrame2;
  
  /** Nuevo contador para la animación hacia la derecha */
  protected int xFrame3;
  
  /** Activadores booleanos de cada animación */
  protected boolean animacionActivada;
  protected boolean animacionActivada1;
  protected boolean animacionActivada2;
  protected boolean animacionActivada3;
  
  // HAY QUE OPTIMIZAR LA DURACIÓN DE LAS ANIMACIONES CON EL MÉTODO DEL PROFE
  /** Duración en segundos de cada fotograma */
  protected float frameDuration = 0.1;
  
  /** Tiempo total transcurrido de la animación */
  protected float animationTime = 0;
  
  
    
  
  /**-- CONSTRUCTORES -- */
  /** Constructor por Defecto */
  public SpriteObject(){ } 
  
  /** Costructor Parametrizado */
  public SpriteObject(int anchoFrame, int altoFrame){
    this.anchoFrame = anchoFrame;
    this.altoFrame = altoFrame;
    this.xFrame = 0;
    this.yFrame = 64;
    this.xFrame1 = 0; // Inicializar el contador de la animación hacia abajo en 0
    this.xFrame2 = 0; // Inicializar el contador de la animación hacia la izquierda en 0
    this.animacionActivada = false;
    this.animacionActivada1 = false;
    this.animacionActivada2 = false;
    this.animacionActivada3 = false;
  }
}
