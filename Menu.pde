/** Clase que dibujará las pantallas de menús e intermisiones del juego */
public class Menu{
  /* -- ATRIBUTOS -- */
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
  
  /** Representa la pantalla de inicio que es un gif */
  private Gif pantallaInicial;
    
  
  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Menu(){}
  /** Constructor Parametrizado */
  public Menu(PApplet p){
    this.fundido = 255;
    this.fundido2 = 255;
    this.fundidoCompleto = false;
    this.fundidoCompleto2 = false;
    this.tiempoActual = 0;
    this.fTitulo = createFont("alagard.ttf", 75, false);
    this.fEncabezado = createFont("arpegius.ttf", 50, false);
    this.fTextos = createFont("pixel-unicode.ttf", 30, false);
    this.fTextosSmall = createFont("pixel-unicode.ttf", 20, false);
    this.pantallaInicial= new Gif(p, "TitleScreen.gif");
  }
  
  
  /* -- MÉTODOS -- */
  /** Método para dibujar el menú correspondiente al estado */
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
    this.pantallaInicial.play(); 
    displayFondo(pantallaInicial); //Diubjando la imagen de fondo
    
    /* Realizamos el fundido (cubre la imagen de fondo) */
     if (!this.fundidoCompleto) {
      fill(0, this.fundido); // Setea el color negro con opacidad variable.
      rect(0, 0, width, height); //Dibuja un recuadro negro que cubrirá toda la pantalla.
      if (millis()>=4500) { //Pasados 4.5 segundos, el recuadro negro empezará a hacerse transparente.
        this.fundido -= 2; //La opacidad del recuadro disminuye a un ritmo de 2 unidades por fotograma.
        if (this.fundido <= 0) {
          this.fundidoCompleto = true;  // Deja de evaluar if
        }
      }
    }
    
    this.displayTextosDelTitulo(); //Dibujando los títulos
    
    /* Realizamos el fundido (cubre los títulos)*/
    if (!this.fundidoCompleto2) {
      fill(0, this.fundido2); // Setea el color negro con transparencia variable (usando otra variable).
      rect(0, 0, width, height); //Dibuja un recuadro negro que cubrirá toda la pantalla.
      if (millis()>=3000) { //Pasados 3 segundos, el recuadro negro empezará a hacerse transparente.
        this.fundido2 -= 3; //La opacidad del recuadro disminuye a un ritmo de 3 unidades por fotograma, más rápido que en el fundido anterior.
        if (this.fundido2 <= 0) {
          this.fundidoCompleto2 = true; //Deja de evaluar if
        }
      }
    }    
    /*  La necesidad de hacer dos fundidos desde negro al mismo tiempo y evaluar dos pares de variables distintas (pero con el mismo fin) se presenta para visualizar el efecto que buscábamos.
        Primero se muestran los títulos (los cubre el segundo recuadro negro), y poco a poco aparece la imagen de fondo (los cubre el primer recuadro negro)  */
    
        this.tiempoActual = millis(); /*  Guardamos el tiempo hasta este momento para evaluar los segundos en que se mantendrá la pantalla negra siguiente, seguido de la pantalla de controles.
                                          Todo esto es únicamente con el propósito de presentar el diseño visual que teníamos en mente */
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
    
    /* Efecto de fundido */
    if (!this.fundidoCompleto){
      fill(0, this.fundido);
      rect(0, 0, width, height);
      if (millis() - this.tiempoActual >= 3000) { //Usamos tiempo actual para calcuar 3 segundos desde un punto de la ejecución del programa. Operamos con millis() por que nos da el tiempo transcurrido en milisegundos desde el inicio del programa
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
    text("- Cómo jugar -", width/2, 120);

    textFont(fTextos);
    textAlign(CENTER, CENTER);
    text("W/A/S/D:  Mover al personaje", width/2, 230);

    textAlign(CENTER, TOP);
    text("Tu visión está limitada hasta donde alumbre tu antorcha.\nEvita en todo momento a los Devoradores.\nBusca las llaves perdidas en el mapa y sal de ahí.", width/2, 320);

    textFont(fTextosSmall);
    textAlign(RIGHT, CENTER);
    text("Clic para continuar >", width-20, height-40);
  }
  
  /** Método para dibujar un fondo */
  public void displayFondo(Gif fondo){
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
    text("Clic para volver al inicio", width / 2, height -80);
   }
  
  /** Método para retratar la pantalla de Game Over */
  public void displayDerrota(){    
    fill(255);
    textFont(fTitulo);
    textAlign(CENTER, CENTER);
    text("Game Over", width / 2, height / 2);
    textFont(fTextos);
    text("Clic para volver al inicio", width / 2, height -80);//Muestra un mensaje de Game Over
  }



  /* -- ACCESORES (GETTERS Y SETTERS) -- */
  /* -- Getters -- */
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
  
  /* -- Setters -- */
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
