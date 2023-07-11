/* -- IMPORTACIÓN DE BIBLIOTECAS -- */
/** Importando biblioteca para reproducir archivos GIF. */
import gifAnimation.*;

/** Importando biblioteca para reproducir AUDIO. */
import ddf.minim.*; 
/* -- FIN DE LA IMPORTANCION DE BILIOTECAS -- */

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

/** Representa el menú del juego */
private Menu menu;

/** Representa una clase auxiliar para calcular las colisiones entre las clases. */
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
/* -- FIN DE DECLARACIÓN DE VARIABLES -- */

/* -- GAME LOOP -- */
/** Setup, se ejecuta una sola vez. */
void setup() {

  estado = MaquinaEstados.TITULO; //Iniciamos el juego desde el TITULO
  size(700, 600); //Tamaño de la ventana

/* Definimos la musica del juego y los sonidos. */
  minim = new Minim(this);
  musicaTitulo = minim.loadFile("titulo.mp3");
  musicaTitulo.setGain(0); //Regulamos el sonido del juego
  musicaEscenario = minim.loadFile("ambiente.mp3");
  musicaEscenario.setGain(-7); //Regulamos el sonido del juego
  musicaDerrota = minim.loadFile("derrota.mp3");
  musicaVictoria = minim.loadFile("victoria.mp3");
  sonidoMuerte = minim.loadFile("sonidomuerte.mp3");
  sonidoRelampago = minim.loadFile("relampago.mp3");
/* Fin de definicion de la musica del juego y los sonidos. */
  
  musicaTitulo.loop(); // dejamos la musica aqui porque no se lo puede dejar en maquinaEstados.TITULO
  menu = new Menu(this); //Creamos un objeto menu para dibujar los menus en pantalla
  colisionador = new Colisionador(); //Creamos un obeto Colisionador para calcular las colisiones
}// Fin setup.


/** Draw, se actualiza una vez cada {frameRate()} segundos. */
void draw() {
  background(0);
  
/* Se hace las transiciones entre las pantallas segun el estado */
  switch (estado) {
    case MaquinaEstados.TITULO:
      menu.display(estado);  //Visualiza el titulo
    break;
  
    case MaquinaEstados.CONTROLES:
      sonidoRelampago.play();
      menu.display(estado); //Visualiza los controles
    break;
  
    case MaquinaEstados.JUGANDO:
      println(frameRate); //Muestra los FPS por consola
      escenario.display(); //Dibuja el escenario
      escenario.mostrarArboles(); //Dibuja los arboles
      puerta.display(); //Dibua la puerta
  
      gestorLlaves.dibujarLlaves(); //Dibujamos las 2 llaves
      gestorLlaves.colisionarJugador(jugador,colisionador); //Verificamos la colision entre las llaves y el jugador
      gestorLlaves.abrirPuerta(); //Verificamos la colision entre las llaves y la puerta
  
      gestorEnemigos.mostrarEnemigos(); //Dibujamos los enemigos
      gestorEnemigos.verificarColisionesJugador(jugador,colisionador); // Verificamos la colision entre el jugador y los bordes del juego
      gestorEnemigos.colisionarEnemigos(colisionador); // Verificamos la colision entre algun enemigo contra otro enemigo
      gestorEnemigos.colisionarArboles(escenario.getArboles(),colisionador); // Verificamos la colision entre el enemigo y los arboles
  
      jugador.display(); //Dibujamos al jugador
      jugador.mover(); //Se asigna el movimiento al jugador
      jugador.colisionarArbol(colisionador,escenario.getArboles()); // Verificamos el jugador y los arboles
    break;
  
    case MaquinaEstados.PERDIENDO:
      menu.display(estado); // Visualiza la pantalla de perdiendo
      musicaEscenario.pause(); //Pausamos la musica del escenario
      sonidoMuerte.play(); //Reproducimos el sonido de muerte 
      musicaDerrota.play(); //Reproducimos la musica de Derrota
    break;
    
    case MaquinaEstados.GANANDO:
      menu.display(estado); // Visualiza la pantalla de ganando
      musicaEscenario.pause(); //Pausamos la musica del escenario
      musicaVictoria.play(); //Reproducimos la musica de Victoria
    break;
  }
/* Se terminan las transiciones entre las pantallas segun el estado */
}// Fin del draw.


/* -- MÉTODOS EXTERNOS -- */
/* - Métodos propios de Processing: */
/** Acciones según se haga clic */
void mousePressed() {
  //Cuando el jugador esta en la pantalla de titulo debe hacer click para pasar a la pantalla de controles
  if (estado == MaquinaEstados.TITULO) {
    println("Titulo -> Controles"); //Mostramos por consola la transicion de pantallas
    musicaTitulo.pause(); //Pausamos la musica del titutlo
    musicaTitulo.rewind();  //Reseteamos la musica del titulo
    musicaEscenario.rewind(); //Reseteamos la musica del titulo
    sonidoRelampago.rewind();  //Reseteamos el sonido del relampago
    menu.setFundido(255); 
    menu.setFundidoCompleto(false); 
    estado = MaquinaEstados.CONTROLES; //Pasamos a la pantalla de control cambiando la variable estado
  } 
  else if (estado == MaquinaEstados.CONTROLES){  
    println("Controles -> Juego"); //Mostramos por consola la transicion de pantallas
    jugador = new Jugador(new PVector(width/2, height/2), 64, 64); //Instanciamos al jugador
    escenario = new Escenario(new PVector(0, 0), "fondo_juego.png"); //Instanciamos el escenario
    gestorEnemigos = new GestorEnemigos(); //Instanciamos el gestor para que cree los enemigos
    gestorLlaves = new GestorLlaves(); //Instanciamos las llaves
    puerta = new Puerta(); //Instanciamos la puerta
    escenario.crearArboles(); //Instanciamos el gestor para que cree las llaves
    musicaEscenario.loop(); //Ponemos la musica del escenario en loop
      
    estado = MaquinaEstados.JUGANDO; //Pasamos a la pantalla de control cambiando la variable estado
  }
  else if (estado == MaquinaEstados.PERDIENDO) {
    println("Perdiendo -> Titulo");
    menu.setFundido(255); 
    menu.setFundido2(255); 
    menu.setFundidoCompleto(false); 
    menu.setFundidoCompleto2(false);
    
    musicaDerrota.pause(); //Pausamos la musica de Derrota
    sonidoMuerte.pause(); //Pausamos el sonido de Muerte
    musicaDerrota.rewind(); //Reseteamos la musica del derrota
    sonidoMuerte.rewind(); //Reseteamos el sonido de Muerte
    musicaTitulo.loop(); //Ponemos la musica del titulo
    
    estado = MaquinaEstados.TITULO; //Pasamos a la pantalla de control cambiando la variable estado
  }
  else if (estado == MaquinaEstados.GANANDO) {
    println("Ganando -> Titulo");
    menu.setFundido(255);
    menu.setFundido2(255);
    menu.setFundidoCompleto(false);
    menu.setFundidoCompleto2(false);
    
    musicaVictoria.pause(); //Pausamos la musica de Victoria
    musicaVictoria.rewind(); //Reseteamos la musica de Victoria
    musicaTitulo.loop(); //Ponemos la musica del titulo
    
    estado = MaquinaEstados.TITULO; //Pasamos a la pantalla de control cambiando la variable estado
  }
}

/** Lee el input del teclado */
public char readCommand() {
  return key;
}

/** Acciones según el input del teclado */
void keyPressed() {
    if (readCommand() == 'w' || readCommand() == 'W') { //Si se presiona w o W se mueve el jugador habilita esa tecla, inhabilitando las otras teclas de movimiento y mostrando la animacion adecuada
    W_PRESSED=true;
    A_PRESSED=false;
    S_PRESSED=false;
    D_PRESSED=false;
    jugador.setEstadoAnim(MaquinaEstadosAnimacion.MOV_ARRIBA);
  } else if (readCommand() == 'd' || readCommand() == 'D') { //Si se presiona d o D se mueve el jugador habilita esa tecla, inhabilitando las otras teclas de movimiento y mostrando la animacion adecuada
    D_PRESSED=true;
    S_PRESSED=false;
    A_PRESSED=false;
    W_PRESSED=false;
    jugador.setEstadoAnim(MaquinaEstadosAnimacion.MOV_DERECHA);
  } else if (readCommand() == 's' || readCommand() == 'S') { //Si se presiona s o S se mueve el jugador habilita esa tecla, inhabilitando las otras teclas de movimiento y mostrando la animacion adecuada
    S_PRESSED=true;
    D_PRESSED=false;
    A_PRESSED=false;
    W_PRESSED=false;
    jugador.setEstadoAnim(MaquinaEstadosAnimacion.MOV_ABAJO);
  } else if (readCommand() == 'a' || readCommand() == 'A') { //Si se presiona a o A se mueve el jugador habilita esa tecla, inhabilitando las otras teclas de movimiento y mostrando la animacion adecuada
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
    jugador.setEstadoAnim(MaquinaEstadosAnimacion.ESTATICO_IZQUIERDA); //Si se deja de presionar a o A cambia esa tecla falso y muestra al jugador estatico en la misma direccion
  } else if (readCommand() == 'd' || readCommand() == 'D') {
    D_PRESSED=false;
    jugador.setEstadoAnim(MaquinaEstadosAnimacion.ESTATICO_DERECHA); //Si se deja de presionar d o D cambia esa tecla falso y muestra al jugador estatico en la misma direccion
  } else if (readCommand() == 'w' || readCommand() == 'W') {
    W_PRESSED=false;
    jugador.setEstadoAnim(MaquinaEstadosAnimacion.ESTATICO_ARRIBA); //Si se deja de presionar w o S cambia esa tecla falso y muestra al jugador estatico en la misma direccion
  } else if (readCommand() == 's' || readCommand() == 'S') { 
    S_PRESSED=false;
    jugador.setEstadoAnim(MaquinaEstadosAnimacion.ESTATICO_ABAJO); //Si se deja de presionar s o S cambia esa tecla falso y muestra al jugador estatico en la misma direccion
  }
}
