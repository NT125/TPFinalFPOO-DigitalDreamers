/** -- IMPORTACIÓN DE BIBLIOTECAS -- */
/** Importando biblioteca para reproducir archivos GIF. */
import gifAnimation.*;



/** -- DECLARACIÓN DE OBJETOS -- */
/** Clase que contiene el Array Fijo de las antorchas. */
private GestorAntorcha getorAntorcha;

/** Clase principal del Jugador. */
private Jugador jugador;

/** Clase principal del enemigo. */
private Enemigo enemigo;

/** Clase que contiene el ArrayList de los Enemigos. */
private GestorEnemigos gestorEnemigo;

/** Clase del escenario en pantalla. */
private Escenario escenario;



/** -- DECLARACIÓN DE VARIABLES -- */
/** Estado del juego, toma los valores de MaquinaEstados. */
int estado;

/** Enteros auxiliares para calcular la opacidad de un efecto de fundido. */
int fundido;
int fundido2;

/** Booleanos auxiliares para verificar si se completó el fundido y prescindir de las variables enteras de fundido. */
boolean fundidoCompleto;
boolean fundidoCompleto2;

/** Auxiliar para medir en eventos basados en tiempo, se le asignará millis() en cada uso. */
int tiempoActual;

/** Auxiliar para definir si se puede hacer clic en pantalla o no. */
boolean clicable;

/** Gif para cargar el fondo de la pantalla de título. */
Gif pantallaDeInicio;

/** Declaración de Variables que contengan las distintas fuentes de texto usadas en el juego. */
PFont fTitulo;
PFont fEncabezado;
PFont fTextos;
PFont fTextosSmall;



/** -- GAME LOOP -- */
/** Setup, se ejecuta una sola vez. */
void setup(){
  estado = MaquinaEstados.TITULO;
  size(700,600);
  //frameRate(60);
  
  jugador = new Jugador(new PVector(width/2, height/2), 64, 64, 15);
  escenario = new Escenario(new PVector(0,0),"fondo_juego.png");
  enemigo = new Enemigo(new PVector(600,70),45,45, new PVector(60,-29.9));
  clicable = false;
  
  fundido = 255;
  fundido2 = 255;
  
  pantallaDeInicio = new Gif(this,"TitleScreen.gif");  
  pantallaDeInicio.play();
  
  // Definición de fuentes.
  fTitulo = createFont("alagard.ttf",75,false);
  fEncabezado = createFont("arpegius.ttf",50,false);
  fTextos = createFont("pixel-unicode.ttf",30,false);
  fTextosSmall = createFont("pixel-unicode.ttf",20,false);
  //escenario.crearArboles();
}

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
void draw(){
  background(0);
  
  switch (estado){
    case MaquinaEstados.TITULO:
    
      // Cubriendo fondo del Título, y revelándolo con un fundido.  
      imageMode(CORNER);
      image(pantallaDeInicio,0,0);
      if(!fundidoCompleto2){
        fill(0,fundido2);
        rect(0,0,width,height);
        if(millis()>=4500){
          fundido2 -= 3;
          if (fundido2 <= 0){
            fundidoCompleto2 = true;
            fundido2 = 255; //reseteando fundido para la siguiente pantalla.
          }
        }      
      } 
      
      fill(255);
      textFont(fTitulo);
      textAlign(CENTER,CENTER);
      text("A Shadow of Hope",width/2,90);
      
      fill(255,200);
      textFont(fTextos);
      text("Haga clic para iniciar", width/2, height-100);
      
      fill(255);
      textFont(fEncabezado);
      textSize(20);
      textAlign(LEFT,DOWN);
      text("DIGITAL DREAMERS © 2023",10,height-10);
      textFont(fTextos);
      textSize(18);
      fill(255,230);
      textAlign(RIGHT,DOWN);
      text("Trabajo Práctico Final - FPOO, TUDIVJ",width-10,height-10);
      
      // Cubriendo la pantalla entera, y revelándola con un fundido.
      if(!fundidoCompleto){
        fill(0,fundido);
        rect(0,0,width,height);
        if(millis()>=3000){
          fundido -= 2;
          if (fundido <= 0){
            fundidoCompleto = true;
            clicable = true;
            fundido = 255; //reseteando fundido para la siguiente pantalla.
          }
        }      
      }    
      
      tiempoActual = millis(); // Obteniendo el tiempo actual en este momento para calcular la duración del pantallazo negro siguiente.
      break;
      
    case MaquinaEstados.CONTROLES:
      //Pantalla de controles. 
      
      fill(255);
      textFont(fEncabezado);
      textAlign(CENTER,CENTER);
      text("- Cómo jugar -",width/2,60);
      
      textFont(fTextos);
      textAlign(LEFT,CENTER);
      text("W/A/S/D:  Mover al personaje",60,160);
      text("J:  Iluminar/Accionar (No implementado aún)", 60, 200);
      
      textAlign(CENTER,TOP);
      text("Tu visión está limitada hasta donde alumbre tu antorcha\nEvita en todo momento a los Devoradores\n(Aún no es posible avanzar de nivel, ¡paciencia que trabajamos en eso!)",width/2,370);
      
      textFont(fTextosSmall);
      textAlign(RIGHT,CENTER);
      text("Clic para continuar >",width-20,height-40);
      
      //Efecto de fundido
      if(fundidoCompleto){
        fill(0,fundido);
        rect(0,0,width,height);
        
        /* Funcionamiento del pantallazo negro al llegar a esta pantalla. */
        /* Se debería escuchar un sonido contundente que coincida con el pantallazo, dando un efecto de apagón. */
        /* Pasados unos segundos en lo que se reproduce el sonido, se muestra la pantalla de controles. */
        
        if(millis() - tiempoActual >= 3000){ //3 segundos de espera entre el pantallazo negro y la pantalla de controles.
          fundido -= 15;
          if (fundido <= 0){
            fundidoCompleto = false; //alternando fundidoCompleto entre pantallas.
            fundido = 255; //reseteando fundido para la siguiente pantalla.
            clicable = false;
            tiempoActual = millis(); //Reseteando tiempoActual para siguiente pantalla.
          }
        }
      }       
      break;
      
    case MaquinaEstados.JUGANDO:      
      // Pantalla Comenzando a jugar Nivel 1
      
      escenario.display();
      escenario.mostrarArboles();
      //Arbol arbol;
      //solo coliciones
      /*for (int i=0; i<escenario.arboles.size(); i++) {
        arbol = escenario.arboles.get(i);
        jugador.colisionarArbol(arbol);
      }*/
      
      enemigo.display();
      enemigo.mover();
      enemigo.rebotar();
      
      jugador.display();
      jugador.mover();
      
      //Fundido de inicio del juego, cortito a comparación de los anteriores.
      if(!fundidoCompleto){
        fill(0,fundido);
        rect(0,0,width,height);
          fundido -= 20;
        if (fundido <= 0){
          fundidoCompleto = true;
          fundido = 255; //reseteando fundido para la siguiente pantalla
        }  
      }
      
      break;
    case MaquinaEstados.PERDIENDO:
      //TERMINAR PANTALLA DE GAME OVER   
      break;
    case MaquinaEstados.GANANDO:
      // TRANSICIONAR ENTRE NIVELES    
      break;
      
  }//Fin del switch.
}



/** -- MÉTODOS EXTERNOS -- */
/** - Métodos propios de Processing: - */
/** Acciones según se haga clic */
void mousePressed(){
  if (clicable){    
    if(estado== MaquinaEstados.TITULO){
      pantallaDeInicio.pause();
      estado= MaquinaEstados.CONTROLES;
    }
  }
  if(!clicable){    
    if(estado == MaquinaEstados.CONTROLES){
      escenario.crearArboles();
      estado= MaquinaEstados.JUGANDO;
    }
  }
}

/** Acciones según se deje de hacer clic */
void mouseReleased(){
}

/** Acciones según el input del teclado */
void keyPressed() {
  jugador.keyPressed();
}

/** Acciones según se suelte el input del teclado */
void keyReleased() {
  jugador.keyReleased();
}
