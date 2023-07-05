
/* -- IMPORTACIÓN DE BIBLIOTECAS -- */
/** Importando biblioteca para reproducir archivos GIF. */
import gifAnimation.*;
/** Importando biblioteca para reproducir AUDIO. */
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


/* -- DECLARACIÓN DE VARIABLES -- */
/** Representa al objeto que contiene el Array Fijo de las antorchas. */
private GestorAntorcha getorAntorcha;

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

/** Representa al Jugador. */
private Colisionador colisionador;

/** Estado del juego, toma los valores de MaquinaEstados. */
private int estado;

/** Representa el Nivel del juego */
private int nivel;

/** Enteros auxiliares para calcular la opacidad de un efecto de fundido. */
private int fundido;
private int fundido2;

/** Booleanos auxiliares para verificar si se completó el fundido y prescindir de las variables enteras de fundido. */
private boolean fundidoCompleto;
private boolean fundidoCompleto2;

/** Auxiliar para medir en eventos basados en tiempo, se le asignará millis() en cada uso. */
private int tiempoActual;

/** Auxiliar para definir si se puede hacer clic en pantalla o no. */
private boolean clicable;

/** Gif para cargar el fondo de la pantalla de título. */
Gif pantallaDeInicio;

/* Declaración de Variables que contengan las distintas fuentes de texto usadas en el juego. */
PFont fTitulo;
PFont fEncabezado;
PFont fTextos;
PFont fTextosSmall;

/* Declaracion de Variables para la musica de fondo. */
Minim minim;
AudioPlayer musicaTitulo;
AudioPlayer musicaEscenario;

/* -- GAME LOOP -- */
/** Setup, se ejecuta una sola vez. */
void setup() {
  estado = MaquinaEstados.CONTROLES;
  size(700, 600);
  //frameRate(60);
  
  //  // Definimos la musica y los sonidos //
 
  minim = new Minim(this);
  musicaTitulo = minim.loadFile("vegeta.wav");
  musicaEscenario = minim.loadFile("ambiente.mp3");

 //   Terminamos de definir la musica y los sonidos
  
  clicable = false;
  nivel=1;

  fundido = 255;
  fundido2 = 255;

  pantallaDeInicio = new Gif(this, "TitleScreen.gif");
  pantallaDeInicio.play();

  // Definición de fuentes.
  fTitulo = createFont("alagard.ttf", 75, false);
  fEncabezado = createFont("arpegius.ttf", 50, false);
  fTextos = createFont("pixel-unicode.ttf", 30, false);
  fTextosSmall = createFont("pixel-unicode.ttf", 20, false);
}// Fin setup.

/*void realizarFundido(boolean fundidoCompleto, int fundido, int duracion, int tiempoActual){
 
 if (!fundidoCompleto){
 fill(0, fundido);
 rect(0, 0, width, height);
 
 //println(fundido);//debug
 //println(millis());//debug
/* Funcionamiento del pantallazo negro */
/* Se debería escuchar un sonido contundente que coincida con el pantallazo, dando un efecto de apagón */
/* Pasados unos segundos en lo que se reproduce el sonido, se muestra la pantalla de controles */

/*while(tiempoActual>= duracion){
 fundido -= 2;
 println(fundido);
 if (fundido <= 0){
 fundidoCompleto = true;//alternando fundidoCompleto entre pantallas
 clicable = true;
 //fundido = 255;  // Reseteando fundido para la siguiente pantalla
 
 }
 }
 }
 }*/

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
    
    
    // Cubriendo fondo del Título, y revelándolo con un fundido.
    imageMode(CORNER);
    image(pantallaDeInicio, 0, 0);
    if (!fundidoCompleto2) {
      fill(0, fundido2);
      rect(0, 0, width, height);
      if (millis()>=4500) {
        fundido2 -= 3;
        if (fundido2 <= 0) {
          fundidoCompleto2 = true;
          fundido2 = 255; //reseteando fundido para la siguiente pantalla.
          
        }
      }
    }

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

    // Cubriendo la pantalla entera, y revelándola con un fundido.
    if (!fundidoCompleto) {
      fill(0, fundido);
      rect(0, 0, width, height);
      if (millis()>=3000) {
        fundido -= 2;
        if (fundido <= 0) {
          fundidoCompleto = true;
          clicable = true;
          fundido = 255; //reseteando fundido para la siguiente pantalla.
        }
      }
    }

    tiempoActual = millis(); // Obteniendo el tiempo actual en este momento para calcular la duración del pantallazo negro siguiente.
    
    break;

  case MaquinaEstados.CONTROLES:
    musicaTitulo.pause(); //ponemos la musica
    //Pantalla de controles
    fill(255);
    textFont(fEncabezado);
    textAlign(CENTER, CENTER);
    text("- Cómo jugar -", width/2, 60);

    textFont(fTextos);
    textAlign(LEFT, CENTER);
    text("W/A/S/D:  Mover al personaje", 60, 160);
    text("J:  Iluminar/Accionar (No implementado aún)", 60, 200);

    textAlign(CENTER, TOP);
    text("Tu visión está limitada hasta donde alumbre tu antorcha\nEvita en todo momento a los Devoradores\n(Aún no es posible avanzar de nivel, ¡paciencia que trabajamos en eso!)", width/2, 370);

    textFont(fTextosSmall);
    textAlign(RIGHT, CENTER);
    text("Clic para continuar >", width-20, height-40);

    //Efecto de fundido
    if (fundidoCompleto) {
      fill(0, fundido);
      rect(0, 0, width, height);

      /* Funcionamiento del pantallazo negro al llegar a esta pantalla. */
      /* Se debería escuchar un sonido contundente que coincida con el pantallazo, dando un efecto de apagón. */
      /* Pasados unos segundos en lo que se reproduce el sonido, se muestra la pantalla de controles. */

      if (millis() - tiempoActual >= 3000) { //3 segundos de espera entre el pantallazo negro y la pantalla de controles.
        fundido -= 15;
        if (fundido <= 0) {
          fundidoCompleto = false; //alternando fundidoCompleto entre pantallas.
          fundido = 255; //reseteando fundido para la siguiente pantalla.
          clicable = false;
          tiempoActual = millis(); //Reseteando tiempoActual para siguiente pantalla.
        }
      }
    }
    break;

  case MaquinaEstados.JUGANDO:
    println(frameRate);
    musicaEscenario.play();
    // Pantalla Comenzando a jugar Nivel 1
    //Fundido de inicio del juego, cortito a comparación de los anteriores.
    if (!fundidoCompleto) {
      fill(0, fundido);
      rect(0, 0, width, height);
      fundido -= 20;
      if (fundido <= 0) {
        fundidoCompleto = true;
        fundido = 255; //reseteando fundido para la siguiente pantalla
      }
    }
    escenario.display();
    escenario.mostrarArboles();

    puerta.display();

    jugador.display();
    jugador.mover();
    //jugador.colisionarArbol(escenario.getArboles());
    gestorLlaves.dibujarLlaves();
    gestorLlaves.colisionarObjetos();

    gestorEnemigos.mostrarEnemigos();
    gestorEnemigos.colisionarObjetos(jugador);
    gestorEnemigos.colisionarEnemigos();

    break;

  case MaquinaEstados.PERDIENDO:
     musicaEscenario.pause();
    fill(255);
    textFont(fTitulo);
    textAlign(CENTER, CENTER);
    text("Game Over", width / 2, height / 2);
    textFont(fTextos);
    text("Presiona para continuar", width / 2, height -80);//Muestra un mensaje de Game Over
    // Reiniciamos el jugador, el escenario, el enemigo y habilitamos el clicable y mandamos al jugador a la pantalla de controles
    jugador = new Jugador(new PVector(width/2, height/2), 64, 64);
    escenario = new Escenario(new PVector(0, 0), "fondo_juego.png");
    clicable = true;
    break;

  case MaquinaEstados.GANANDO:
    musicaEscenario.pause();
    // TRANSICIONAR ENTRE NIVELES
    fill(255);
    textFont(fTitulo);
    textAlign(CENTER, CENTER);
    text("Ganaste :D", width / 2, height / 2);
    textFont(fTextos);
    break;
  }//Fin del switch.
}// Fin del draw.


/* -- MÉTODOS EXTERNOS -- */
/* - Métodos propios de Processing: - */
/** Acciones según se haga clic */
void mousePressed() {
  //Cuando el jugador esta en la pantalla de titulo debe hacer click para pasar a la pantalla de controles
  if (clicable) {
    if (estado== MaquinaEstados.TITULO) {
      pantallaDeInicio.pause();
      estado= MaquinaEstados.CONTROLES;
    }
    //Cuando el jugador esta en la pantalla de perdiendo debe hacer click para pasar a titulo
    if (estado==MaquinaEstados.PERDIENDO) {
      fundido=255;
      pantallaDeInicio.play();
      fundido2=255;
      estado= MaquinaEstados.TITULO;
    }
  }
  //Cuando el jugador esta en la pantalla de controles debe hacer click para pasar a jugar
  if (!clicable && estado == MaquinaEstados.CONTROLES) {
    jugador = new Jugador(new PVector(width/2, height/2), 64, 64);
    escenario = new Escenario(new PVector(0, 0), "fondo_juego.png");
    gestorEnemigos =new GestorEnemigos(nivel);
    gestorLlaves = new GestorLlaves(nivel);
    puerta = new Puerta();
    escenario.crearArboles();
    estado= MaquinaEstados.JUGANDO;
    colisionador= new Colisionador();
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
    jugador.setEstado(MaquinaEstadosAnimacion.MOV_ARRIBA);
  }
  else if (readCommand() == 'd' || readCommand() == 'D') {
    jugador.setEstado(MaquinaEstadosAnimacion.MOV_DERECHA);
  }
  else if (readCommand() == 's' || readCommand() == 'S') {
    jugador.setEstado(MaquinaEstadosAnimacion.MOV_ABAJO);
  }
  else if (readCommand() == 'a' || readCommand() == 'A') {
    jugador.setEstado(MaquinaEstadosAnimacion.MOV_IZQUIERDA);
  }
}

/** Acciones según se suelte el input del teclado */
void keyReleased() {
  if (readCommand() == 'a' || readCommand() == 'A') {
    jugador.setEstado(MaquinaEstadosAnimacion.ESTATICO_IZQUIERDA);
  }
  else if (readCommand() == 'd' || readCommand() == 'D') {
    jugador.setEstado(MaquinaEstadosAnimacion.ESTATICO_DERECHA);
  }
  else if (readCommand() == 'w' || readCommand() == 'W') {
    jugador.setEstado(MaquinaEstadosAnimacion.ESTATICO_ARRIBA);
  }
  else if (readCommand() == 's' || readCommand() == 'S') {
    jugador.setEstado(MaquinaEstadosAnimacion.ESTATICO_ABAJO);
  }
}
