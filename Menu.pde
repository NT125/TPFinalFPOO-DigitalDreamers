/** Clase que dibujará las pantallas de menús e intermisiones del juego */

public class Menu{
  /** -- ATRIBUTOS -- */
  /** Atributos Enteros que determinan el valor de transparencia del recuadro negro que cubre la pantalla */
  private int fundido;
  private int fundido2;
  
  /** Atributos booleanos que determinan si se completó el fundido */
  private boolean fundidoCompleto;
  private boolean fundidoCompleto2;
  
  /** Atributo para obtener el tiempo actual de ejecución en milisegundos */
  private int tiempoActual;
  
  /** Declaración de las distintas fuentes de texto usadas en el juego. */
  /** Fuente para el título del juego */
  private PFont fTitulo;
  
  /** Fuente para textos de encabezado */
  private PFont fEncabezado;
  
  /** Fuente para textos regular */
  private PFont fTextos;
  
  /** Fuente para textos regular pero en menor tamaño */
  private PFont fTextosSmall;
  
    
  
  /** -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Menu(){
    this.fundido = 255;
    this.fundido2 = 255;
    this.fundidoCompleto = false;
    this.fundidoCompleto2 = false;
    this.tiempoActual = 0;
    this.fTitulo = createFont("alagard.ttf", 75, false);
    this.fEncabezado = createFont("arpegius.ttf", 50, false);
    this.fTextos = createFont("pixel-unicode.ttf", 30, false);
    this.fTextosSmall = createFont("pixel-unicode.ttf", 20, false);
  }
  
  
  
  /** -- MÉTODOS -- */
  /** Método para dibujar el menú correspondiente */
  public void display(int estado){
    switch(estado){
      case MaquinaEstados.TITULO:
      {
        this.displayTitulo();
        break;
      }
      case MaquinaEstados.CONTROLES:
      {
        this.displayControles();
        break;
      }
      case MaquinaEstados.GANANDO:
      {
        this.displayVictoria();
        break;
      }
      case MaquinaEstados.PERDIENDO:
      {
        this.displayDerrota();
        break;
      }
    }
  }
  
  /** Método para retratar el menú de título */
  public void displayTitulo(){    
    this.displayFondo(loadImage("TitleScreen.png"));
    
     if (!this.fundidoCompleto) {
      fill(0, this.fundido);
      rect(0, 0, width, height);
      if (millis()>=4500) {
        this.fundido -= 2;
        if (this.fundido <= 0) {
          this.fundidoCompleto = true;  
        }
      }
    }
    
    this.displayTextosDelTitulo(); 
    
    if (!this.fundidoCompleto2) {
      fill(0, this.fundido2);
      rect(0, 0, width, height);
      if (millis()>=3000) {
        this.fundido2 -= 3;
        if (this.fundido2 <= 0) {
          this.fundidoCompleto2 = true;
        }
      }
    }   
    this.tiempoActual = millis();
  }
  
  /** Método para escribir el texto del menú (título, créditos, etc.) */
  public void displayTextosDelTitulo(){    
    fill(255);
    textFont(fTitulo);
    textAlign(CENTER, CENTER);
    text("A Shadow of Hope", width/2, 90);

    fill(255, 200);
    textFont(fTextos);
    text("Haga clic para iniciar", width/2, height-100);

    fill(255);
    textFont(fEncabezado);
    textSize(20);
    textAlign(LEFT, DOWN);
    text("DIGITAL DREAMERS © 2023", 10, height-10);
    textFont(fTextos);
    textSize(18);
    fill(255, 230);
    textAlign(RIGHT, DOWN);
    text("Trabajo Práctico Final - FPOO, TUDIVJ", width-10, height-10);
  }
  
  /** Método para retratar la pantalla del tutorial de controles */
  public void displayControles(){
    this.displayTextosControles();
    
    //Efecto de fundido
    if (!this.fundidoCompleto){
      fill(0, this.fundido);
      rect(0, 0, width, height);
      if (millis() - this.tiempoActual >= 3000) {
        this.fundido -= 15;
        if (this.fundido <= 0) {
          this.fundidoCompleto = true; //alternando fundidoCompleto entre pantallas.
        }
      }
    }
  }
  
  /** Método para escribir el texto de la pantalla del tutorial de controles */
  public void displayTextosControles(){    
    fill(255);
    textFont(fEncabezado);
    textAlign(CENTER, CENTER);
    text("- Cómo jugar -", width/2, 60);

    textFont(fTextos);
    textAlign(LEFT, CENTER);
    text("W/A/S/D:  Mover al personaje", 60, 160);

    textAlign(CENTER, TOP);
    text("Tu visión está limitada hasta donde alumbre tu antorcha.\nEvita en todo momento a los Devoradores.\nBusca la llave perdida en el mapa y sal de ahí.", width/2, 370);

    textFont(fTextosSmall);
    textAlign(RIGHT, CENTER);
    text("Clic para continuar >", width-20, height-40);
  }
  
  /** Método para dibujar un fondo */
  public void displayFondo(PImage fondo){
    imageMode(CORNER);
    image(fondo, 0, 0);    
  }
  
  /** Método para retratar la pantalla de fin del juego */
  public void displayVictoria(){  
    fill(255);
    textFont(fTitulo);
    textAlign(CENTER, CENTER);
    text("Ganaste :D", width / 2, height / 2);
    textFont(fTextos);
   }
  
  /** Método para retratar la pantalla de Game Over */
  public void displayDerrota(){    
    fill(255);
    textFont(fTitulo);
    textAlign(CENTER, CENTER);
    text("Game Over", width / 2, height / 2);
    textFont(fTextos);
    text("Presiona para continuar", width / 2, height -80);//Muestra un mensaje de Game Over
  }



  /** -- ACCESORES (GETTERS Y SETTERS) -- */
  /** -- Getters -- */
  /** Devuelve el valor de transparencia para un fundido */
  public int getFundido(){
    return this.fundido;
  }
  
  /** Devuelve el valor de transparencia para un segundo fundido */
  public int getFundido2(){
    return this.fundido2;
  }
  
  /** Devuelve si se completó un fundido */
  public boolean getFundidoCompleto(){
    return this.fundidoCompleto;
  }
  
  /** Devuelve si se completó el segundo fundido */
  public boolean getFundidoCompleto2(){
    return this.fundidoCompleto2;
  }
  
  /** -- Setters -- */
  /** Establece el valor de transparencia para un fundido */
  public void setFundido(int fundido){
    this.fundido = fundido;
  }
  
  /** Establece el valor de transparencia para un segundo fundido */
  public void setFundido2(int fundido2){
    this.fundido2 = fundido2;
  }
  
  /** Establece si se completó un fundido */
  public void setFundidoCompleto(boolean completo){
    this.fundidoCompleto = completo;
  }
  
  /** Establece si se completó el segundo fundido */
  public void setFundidoCompleto2(boolean completo2){
    this.fundidoCompleto2 = completo2;
  }
}
