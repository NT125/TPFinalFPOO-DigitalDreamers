/** -- IMPORTACIÓN DE BIBLIOTECAS -- */
/** Importando biblioteca para reproducir archivos GIF. */
import gifAnimation.*;

/** Importando biblioteca para reproducir AUDIO. */
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


/** -- DECLARACIÓN DE VARIABLES -- */
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
boolean W_PRESSED, A_PRESSED, S_PRESSED, D_PRESSED;

/** Gif para cargar el fondo de la pantalla de título. */
Gif pantallaDeInicio;


/** Declaracion de Variables para la musica de fondo. */
Minim minim;
AudioPlayer musicaTitulo;
AudioPlayer musicaEscenario;

/** -- GAME LOOP -- */
/** Setup, se ejecuta una sola vez. */
void setup() {
  estado = MaquinaEstados.CONTROLES;
  size(700, 600);
  //frameRate(5);

  // Definimos la musica y los sonidos //

  minim = new Minim(this);
  musicaTitulo = minim.loadFile("vegeta.wav");
  musicaEscenario = minim.loadFile("ambiente.mp3");

  //   Terminamos de definir la musica y los sonidos
  
  menu = new Menu();
  
  colisionador = new Colisionador();  
  // Definición de fuentes.
  
}// Fin setup.


/** Draw, se actualiza una vez cada {frameRate()} segundos. */
void draw() {
  background(0);
  switch (estado) {
    case MaquinaEstados.TITULO:
  
      musicaTitulo.play();//ponemos la musica
      // Subir el volumen (aumentar en un 50%)
      if (keyPressed && key == 'E' || keyPressed && key == 'e') {
        float currentVolume = musicaTitulo.getGain();
        float newVolume = currentVolume + 0.5;
        musicaTitulo.setGain(newVolume);
      }
  
      // Bajar el volumen (disminuir en un 50%)
      if (keyPressed && key == 'Q' || keyPressed && key == 'q') {
        float currentVolume = musicaTitulo.getGain();
        float newVolume = currentVolume - 0.5;
        musicaTitulo.setGain(newVolume);
      }
      
      menu.display(estado);  
      
    break;
  
    case MaquinaEstados.CONTROLES:
      musicaTitulo.pause(); //ponemos la musica
      menu.display(estado);
    break;
  
    case MaquinaEstados.JUGANDO:
      println(frameRate);
      //musicaEscenario.play();
      
      escenario.display();
      escenario.mostrarArboles();
  
      puerta.display();
  
      jugador.display();
      jugador.mover();
      jugador.recorrerArboles(escenario.getArboles(),colisionador); 
  
      gestorLlaves.dibujarLlaves();
      gestorLlaves.colisionarObjetos(jugador, puerta,colisionador);
  
      gestorEnemigos.mostrarEnemigos();
      gestorEnemigos.colisionarJugador(jugador,colisionador);
      gestorEnemigos.colisionarEnemigos(colisionador);
      gestorEnemigos.colisionarArboles(escenario.getArboles(),colisionador);
    break;
  
    case MaquinaEstados.PERDIENDO:
      menu.display(estado);
    break;
    
    case MaquinaEstados.GANANDO:
      menu.display(estado);
    break;
  }//Fin del switch.
}// Fin del draw.


/** -- MÉTODOS EXTERNOS -- */
/** - Métodos propios de Processing: */
/** Acciones según se haga clic */
void mousePressed() {
  //Cuando el jugador esta en la pantalla de titulo debe hacer click para pasar a la pantalla de controles
  if (estado == MaquinaEstados.TITULO) {
    println("Titulo -> Controles");
    estado = MaquinaEstados.CONTROLES;    
    menu.setFundido(255);
    menu.setFundidoCompleto(false);
  } 
  else if (estado == MaquinaEstados.CONTROLES){  
    println("Controles -> Juego");
    jugador = new Jugador(new PVector(width/2, height/2), 64, 64);
    escenario = new Escenario(new PVector(0, 0), "fondo_juego.png");
    gestorEnemigos = new GestorEnemigos();
    gestorLlaves = new GestorLlaves();
    puerta = new Puerta();
    escenario.crearArboles();
    estado = MaquinaEstados.JUGANDO;
  }
  else if (estado == MaquinaEstados.PERDIENDO) {
    menu.setFundido(255);
    menu.setFundido2(255);
    menu.setFundidoCompleto(false);
    menu.setFundidoCompleto2(false);
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
    jugador.setEstado(MaquinaEstadosAnimacion.MOV_ARRIBA);
  } else if (readCommand() == 'd' || readCommand() == 'D') {
    D_PRESSED=true;
    S_PRESSED=false;
    A_PRESSED=false;
    W_PRESSED=false;
    jugador.setEstado(MaquinaEstadosAnimacion.MOV_DERECHA);
  } else if (readCommand() == 's' || readCommand() == 'S') {
    S_PRESSED=true;
    D_PRESSED=false;
    A_PRESSED=false;
    W_PRESSED=false;
    jugador.setEstado(MaquinaEstadosAnimacion.MOV_ABAJO);
  } else if (readCommand() == 'a' || readCommand() == 'A') {
    A_PRESSED=true;
    S_PRESSED=false;
    D_PRESSED=false;
    W_PRESSED=false;
    jugador.setEstado(MaquinaEstadosAnimacion.MOV_IZQUIERDA);
  }
}

/** Acciones según se suelte el input del teclado */
void keyReleased() {
  if (readCommand() == 'a' || readCommand() == 'A') {
    A_PRESSED=false;
    jugador.setEstado(MaquinaEstadosAnimacion.ESTATICO_IZQUIERDA);
  } else if (readCommand() == 'd' || readCommand() == 'D') {
    D_PRESSED=false;
    jugador.setEstado(MaquinaEstadosAnimacion.ESTATICO_DERECHA);
  } else if (readCommand() == 'w' || readCommand() == 'W') {
    W_PRESSED=false;
    jugador.setEstado(MaquinaEstadosAnimacion.ESTATICO_ARRIBA);
  } else if (readCommand() == 's' || readCommand() == 'S') {
    S_PRESSED=false;
    jugador.setEstado(MaquinaEstadosAnimacion.ESTATICO_ABAJO);
  }
}
