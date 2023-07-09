/* -- IMPORTACIÓN DE BIBLIOTECAS -- */
/** Importando biblioteca para reproducir archivos GIF. */
import gifAnimation.*;

/** Importando biblioteca para reproducir AUDIO. */
import ddf.minim.*; 

/* -- DECLARACIÓN DE VARIABLES -- */
/** Representa al Jugador. */
private Jugador jugador;

/** Representa al objeto que contiene y gestiona las llaves. */
private GestorLlaves gestorLlaves;

/** Representa al objeto que contiene el ArrayList de los Enemigos. */
private GestorEnemigos gestorEnemigos;

/** Representa el escenario en pantalla. */
private Escenario escenario;

/** Representa la puerta del escenario */
private Puerta puerta;

/** Clase de los menús */
private Menu menu;

/** Representa al Jugador. */
private Colisionador colisionador;

/** Estado del juego, toma los valores de MaquinaEstados. */
private int estado;

/** Valores booleanos que verifican las teclas de movimiento */
private boolean W_PRESSED, A_PRESSED, S_PRESSED, D_PRESSED;

/** Variables para la musica y sonidos de fondo. */
private Minim minim;
private AudioPlayer musicaTitulo;
private AudioPlayer musicaEscenario;
private AudioPlayer musicaDerrota;
private AudioPlayer musicaVictoria;
private AudioPlayer sonidoMuerte;
private AudioPlayer sonidoRelampago;

/* -- GAME LOOP -- */
/** Setup, se ejecuta una sola vez. */
void setup() {
  estado = MaquinaEstados.TITULO;
  size(700, 600);
  //frameRate(15);

  // Definimos la musica y los sonidos //
  minim = new Minim(this);
  musicaTitulo = minim.loadFile("nachoenmp3.wav");
  musicaTitulo.setGain(20);
  musicaEscenario = minim.loadFile("ambiente.mp3");
  musicaEscenario.setGain(-7);
  musicaDerrota = minim.loadFile("derrota.mp3");
  musicaVictoria = minim.loadFile("victoria.mp3");
  sonidoMuerte = minim.loadFile("sonidomuerte.mp3");
  sonidoRelampago = minim.loadFile("relampago.mp3");
  // Terminamos de definir la musica y los sonidos
  
  musicaTitulo.loop(); // dejamos la musica aqui porque no se lo puede dejar en maquinaEstados.TITULO
  menu = new Menu(this);
  colisionador = new Colisionador();
}// Fin setup.


/** Draw, se actualiza una vez cada {frameRate()} segundos. */
void draw() {
  background(0);
  switch (estado) {
    case MaquinaEstados.TITULO:
      //MUSICA
      //FIN MUSICA
      menu.display(estado);  
    break;
  
    case MaquinaEstados.CONTROLES:
      sonidoRelampago.play();
      menu.display(estado);
    break;
  
    case MaquinaEstados.JUGANDO:
      println(frameRate);
      escenario.display();
      escenario.mostrarArboles();
      puerta.display();
  
      gestorLlaves.dibujarLlaves();
      gestorLlaves.colisionarJugador(jugador,colisionador);
      gestorLlaves.abrirPuerta();
  
      gestorEnemigos.mostrarEnemigos();
      gestorEnemigos.verificarColisionesJugador(jugador,colisionador);
      gestorEnemigos.colisionarEnemigos(colisionador);
      gestorEnemigos.colisionarArboles(escenario.getArboles(),colisionador);
  
      jugador.display();
      jugador.mover();
      jugador.colisionarArbol(colisionador,escenario.getArboles()); 
    break;
  
    case MaquinaEstados.PERDIENDO:
      menu.display(estado);
      musicaEscenario.pause();
      sonidoMuerte.play(); 
      musicaDerrota.play();
    break;
    
    case MaquinaEstados.GANANDO:
      menu.display(estado);
      musicaEscenario.pause();
      musicaVictoria.play();
    break;
  }//Fin del switch.
}// Fin del draw.


/* -- MÉTODOS EXTERNOS -- */
/* - Métodos propios de Processing: */
/** Acciones según se haga clic */
void mousePressed() {
  //Cuando el jugador esta en la pantalla de titulo debe hacer click para pasar a la pantalla de controles
  if (estado == MaquinaEstados.TITULO) {
    println("Titulo -> Controles");
    //Sonido
    musicaTitulo.pause(); 
    musicaTitulo.rewind(); 
    musicaEscenario.rewind();
    sonidoRelampago.rewind();  
    //FIN Sonido
    menu.setFundido(255);
    menu.setFundidoCompleto(false);
    estado = MaquinaEstados.CONTROLES;
  } 
  else if (estado == MaquinaEstados.CONTROLES){  
    println("Controles -> Juego");
    jugador = new Jugador(new PVector(width/2, height/2), 64, 64);
    escenario = new Escenario(new PVector(0, 0), "fondo_juego.png");
    gestorEnemigos = new GestorEnemigos();
    gestorLlaves = new GestorLlaves();
    puerta = new Puerta();
    escenario.crearArboles();
    //MUSICA
    musicaEscenario.loop();
      
    estado = MaquinaEstados.JUGANDO;
  }
  else if (estado == MaquinaEstados.PERDIENDO) {
    println("Perdiendo -> Titulo");
    menu.setFundido(255);
    menu.setFundido2(255);
    menu.setFundidoCompleto(false);
    menu.setFundidoCompleto2(false);
    
    musicaDerrota.pause();
    sonidoMuerte.pause(); 
    musicaDerrota.rewind();
    sonidoMuerte.rewind();
    musicaTitulo.loop();
    
    estado = MaquinaEstados.TITULO;
  }
  else if (estado == MaquinaEstados.GANANDO) {
    println("Ganando -> Titulo");
    menu.setFundido(255);
    menu.setFundido2(255);
    menu.setFundidoCompleto(false);
    menu.setFundidoCompleto2(false);
    
    musicaVictoria.pause();
    musicaVictoria.rewind();
    musicaTitulo.loop();
    
    estado = MaquinaEstados.TITULO;
  }
}

/** Acciones según se deje de hacer clic */
void mouseReleased() {
}

/** Lee el input del teclado */
public char readCommand() {
  return key;
}

/** Acciones según el input del teclado */
void keyPressed() {
  if (readCommand() == 'w' || readCommand() == 'W') {
    W_PRESSED=true;
    A_PRESSED=false;
    S_PRESSED=false;
    D_PRESSED=false;
    jugador.setEstadoAnim(MaquinaEstadosAnimacion.MOV_ARRIBA);
  } else if (readCommand() == 'd' || readCommand() == 'D') {
    D_PRESSED=true;
    S_PRESSED=false;
    A_PRESSED=false;
    W_PRESSED=false;
    jugador.setEstadoAnim(MaquinaEstadosAnimacion.MOV_DERECHA);
  } else if (readCommand() == 's' || readCommand() == 'S') {
    S_PRESSED=true;
    D_PRESSED=false;
    A_PRESSED=false;
    W_PRESSED=false;
    jugador.setEstadoAnim(MaquinaEstadosAnimacion.MOV_ABAJO);
  } else if (readCommand() == 'a' || readCommand() == 'A') {
    A_PRESSED=true;
    S_PRESSED=false;
    D_PRESSED=false;
    W_PRESSED=false;
    jugador.setEstadoAnim(MaquinaEstadosAnimacion.MOV_IZQUIERDA);
  }
}

/** Acciones según se suelte el input del teclado */
void keyReleased() {
  if (readCommand() == 'a' || readCommand() == 'A') {
    A_PRESSED=false;
    jugador.setEstadoAnim(MaquinaEstadosAnimacion.ESTATICO_IZQUIERDA);
  } else if (readCommand() == 'd' || readCommand() == 'D') {
    D_PRESSED=false;
    jugador.setEstadoAnim(MaquinaEstadosAnimacion.ESTATICO_DERECHA);
  } else if (readCommand() == 'w' || readCommand() == 'W') {
    W_PRESSED=false;
    jugador.setEstadoAnim(MaquinaEstadosAnimacion.ESTATICO_ARRIBA);
  } else if (readCommand() == 's' || readCommand() == 'S') {
    S_PRESSED=false;
    jugador.setEstadoAnim(MaquinaEstadosAnimacion.ESTATICO_ABAJO);
  }
}
