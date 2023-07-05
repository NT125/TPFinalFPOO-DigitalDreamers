/** Clase abstracta que gestiona los sprites de los elementos renderizables del juego */

class SpriteObject {
  /* -- ATRIBUTOS -- */
  /** Representa al SpriteSheet del Objeto */
  protected PImage spriteSheet;

  /** Representa el Ancho del Frame individual */
  protected int anchoFrame;

  /** Representa el Alto del Frame individual */
  protected int altoFrame;

  /** Representa la Posición inicial x del Frame */
  protected int xFrame;

  /** Representa la Posición inicial y del Frame (contador para animación hacia arriba) */
  protected int yFrame;

  /** Representa el Puntero al primer píxel en x de un frame */
  protected float punteroXFrame;

  /** Representa el Puntero al primer píxel en x del siguiente frame a punteroXFrame; */
  protected float punteroXFrameSiguiente;

  /** Representa la velocidad con la que se reproducirá la animación (la transición entre sprites) */
  protected float velocidadAnimacion;

  /** Representa el Estado de la animación */
  protected int estado;
  
  /* -- CONSTRUCTORES -- */
  /** Constructor Parametrizado */
  public SpriteObject(String nombre, int anchoFrame, int altoFrame) {
    this.spriteSheet = requestImage(nombre);
    this.anchoFrame = anchoFrame;
    this.altoFrame = altoFrame;
    this.xFrame=0;
    this.yFrame=0;/*
    this.xFrameFloat=0;
    this.nextxFrameFloat=widthFrame;*/
    
    this.velocidadAnimacion = 20;
  }


  /* -- MÉTODOS -- */
  /** Diubjando los Sprites segun su estado */
  public void render(int estado, PVector posicion) {
    imageMode(CENTER);

    switch(estado) {
    case MaquinaEstadosAnimacion.IDLE:
      {
        //Colocando el puntero en la fila de idle
        this.yFrame = 0;
        //Dibujando el frame
        image(this.spriteSheet.get(this.xFrame, this.yFrame, this.anchoFrame, this.altoFrame), posicion.x, posicion.y);
        break;
      }
    case MaquinaEstadosAnimacion.MOV_ABAJO:
      {
        //Colocando el puntero en la fila de mov abajo
        this.yFrame = this.altoFrame;
        //Dibujando el frame
        image(this.spriteSheet.get(this.xFrame, this.yFrame, this.anchoFrame, this.altoFrame), posicion.x, posicion.y);

        moverSprite();

        break;
      }
    case MaquinaEstadosAnimacion.MOV_DERECHA:
      {
        //Colocando el puntero en la fila de mov abajo
        this.yFrame = this.altoFrame*2;
        //Dibujando el frame
        image(this.spriteSheet.get(this.xFrame, this.yFrame, this.anchoFrame, this.altoFrame), posicion.x, posicion.y);

        moverSprite();
        break;
      }
    case MaquinaEstadosAnimacion.MOV_ARRIBA:
      {
        //Colocando el puntero en la fila de mov abajo
        this.yFrame = this.altoFrame*3;
        //Dibujando el frame
        image(this.spriteSheet.get(this.xFrame, this.yFrame, this.anchoFrame, this.altoFrame), posicion.x, posicion.y);

        moverSprite();

        break;
      }
    case MaquinaEstadosAnimacion.MOV_IZQUIERDA:
      {
        //Colocando el puntero en la fila de mov abajo
        this.yFrame = this.altoFrame*4;
        //Dibujando el frame
        image(this.spriteSheet.get(this.xFrame, this.yFrame, this.anchoFrame, this.altoFrame), posicion.x, posicion.y);

        moverSprite();

        break;
      }

    case MaquinaEstadosAnimacion.ESTATICO:
      {
        image(this.spriteSheet, posicion.x, posicion.y, anchoFrame, altoFrame);
        break;
      }

    case MaquinaEstadosAnimacion.ESTATICO_ARRIBA:
      {
        //Colocando el puntero en la fila de mov abajo
        this.yFrame = this.altoFrame*3;
        xFrame=0;
        image(this.spriteSheet.get(this.xFrame, this.yFrame, this.anchoFrame, this.altoFrame), posicion.x, posicion.y);
        break;
      }
    case MaquinaEstadosAnimacion.ESTATICO_ABAJO:
      {
        xFrame=0;
        //Colocando el puntero en la fila de mov abajo
        this.yFrame = this.altoFrame;
        image(this.spriteSheet.get(this.xFrame, this.yFrame, this.anchoFrame, this.altoFrame), posicion.x, posicion.y);
        break;
      }
    case MaquinaEstadosAnimacion.ESTATICO_DERECHA:
      {
        //Colocando el puntero en la fila de mov abajo
        this.yFrame = this.altoFrame*2;
        xFrame=0;
        image(this.spriteSheet.get(this.xFrame, this.yFrame, this.anchoFrame, this.altoFrame), posicion.x, posicion.y);
        break;
      }
    case MaquinaEstadosAnimacion.ESTATICO_IZQUIERDA:
      {
        //Colocando el puntero en la fila de mov abajo
        this.yFrame = this.altoFrame*4;
        xFrame=0;
        image(this.spriteSheet.get(this.xFrame, this.yFrame, this.anchoFrame, this.altoFrame), posicion.x, posicion.y);
        break;
      }
    }
  }
  /** Mueve la posicion del Frame en x del SpriteSheet */
  public void moverSprite() {
    //Calculando DeltaTime
    float deltaTime = 1/frameRate;
    //Transicionando entre los distintos Sprites
    this.punteroXFrame += anchoFrame*velocidadAnimacion*deltaTime;

    if (this.punteroXFrame >= this.punteroXFrameSiguiente) {
      this.xFrame += this.anchoFrame;
      this.punteroXFrameSiguiente = this.xFrame+this.anchoFrame;
      //Reiniciando Punteros para el error de pasos del sprite
      this.punteroXFrame = 0;
      this.punteroXFrameSiguiente = this.anchoFrame;

      //Reiniciando animación al llegar al final del spriteSheet
      if (this.xFrame >= this.spriteSheet.width) {
        this.xFrame = 0;
      }
    }
  }
}
