/** Clase abstracta que representa a los sprites del juego */
class SpriteObject extends GameObject{
  protected PImage sprite; 
  protected int anchoFrame;
  protected int altoFrame;
  
  protected int xFrame;
  protected int yFrame;  //contador para animacion hacia arriba
  protected int xFrame1; // Nuevo contador para la animación hacia abajo
  protected int xFrame2; // Nuevo contador para la animación hacia izquierda
  protected int xFrame3; // Nuevo contador para la animación hacia derecha
  protected boolean animacionActivada;
  protected boolean animacionActivada1;
  protected boolean animacionActivada2;
  protected boolean animacionActivada3;
  
  /** atributos agregados*/
  protected float frameDuration = 0.1; // Duración en segundos de cada fotograma
  protected float animationTime = 0; // Tiempo total transcurrido de la animación
  
  /** ------- ZONA DE CONSTRUCTORES ------- */
  // Constructor por Defecto
  public SpriteObject(){ } 
  // Costructor Parametrizado
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
  
  /** ------- ZONA DE METODOS ASESORES ------- */
  /** getters */ 
}
