import gifAnimation.*;

//Objetos
private GestorAntorcha getorAntorcha;
private Jugador jugador;
private Enemigo enemigo;
private GestorEnemigos gestorEnemigo;
private Escenario escenario;

/* Declaración de variables */
int estado; //0 para menú, 1 para controles, 2 para juego
int fundido; //Para calcular la opacidad del efecto de fundido
int fundido2; //Para calcular la opacidad del efecto de fundido
int tiempoActual; //Para medir eventos basados en tiempo, se le asignará millis() en cada uso

boolean fundidoCompleto; //Para verificar si se completó el fundido y prescindir de elementos
boolean fundidoCompleto2; //Para verificar si se completó el fundido y prescindir de elementos
boolean clicable;

Gif pantallaDeInicio;

/* Definición de variables para las distintas fuentes */
PFont fTitulo;
PFont fEncabezado;
PFont fTextos;
PFont fTextosSmall;

void setup(){
  estado = MaquinaEstados.JUGANDO;
  size(700,600);
  
  jugador = new Jugador(new PVector(width/2, height/2), "SpritesSombra_ver1.png", 64, 63,true);
  escenario = new Escenario(new PVector(0,0),"fondo_juego.png");
  enemigo = new Enemigo(new PVector(350,300),45,45, new PVector(0.4,-0.3));
  clicable = false;
  
  fundido = 255;
  fundido2 = 255;
  
  pantallaDeInicio = new Gif(this,"TitleScreen.gif");  
  pantallaDeInicio.play();
  
  /* Definición de Fuentes */
  fTitulo = createFont("alagard.ttf",75,false);
  fEncabezado = createFont("arpegius.ttf",50,false);
  fTextos = createFont("pixel-unicode.ttf",30,false);
  fTextosSmall = createFont("pixel-unicode.ttf",20,false);
  
  escenario.crearArboles();
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
void draw(){
  background(0);
  println(frameRate);
  
  switch (estado){
    case MaquinaEstados.INICIANDO:
      /* Pantalla de Inicio */
      
      imageMode(CORNER);
      image(pantallaDeInicio,0,0);
      if(!fundidoCompleto2){
        fill(0,fundido2);
        rect(0,0,width,height);
        if(millis()>=4500){
          fundido2 -= 3;
          if (fundido2 <= 0){
            fundidoCompleto2 = true;
            fundido2 = 255; //reseteando fundido para la siguiente pantalla
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
      
      if(!fundidoCompleto){
        fill(0,fundido);
        rect(0,0,width,height);
        if(millis()>=3000){
          fundido -= 2;
          if (fundido <= 0){
            fundidoCompleto = true;
            clicable = true;
            fundido = 255; //reseteando fundido para la siguiente pantalla
          }
        }      
      }    
      tiempoActual = millis();
      break;
    case MaquinaEstados.INSTRUCCIONANDO:
      /* Pantalla de Controles */    
      fill(255);
      textFont(fEncabezado);
      textAlign(CENTER,CENTER);
      text("Cómo jugar",width/2,60);
      
      textFont(fTextos);
      textAlign(LEFT,CENTER);
      text("WASD:  Mover al personaje",60,160);
      text("J:  Iluminar/Accionar", 60, 200);
      
      textAlign(CENTER,CENTER);
      text("Objetivos del juego Objetivos del juego Objetivos del juego",width/2,370);
      text("Objetivos del juego Objetivos del juego Objetivos del juego",width/2,400);
      text("Objetivos del juego Objetivos del juego Objetivos del juego",width/2,430);
      text("...",width/2,470);
      
      textFont(fTextosSmall);
      textAlign(RIGHT,CENTER);
      text("(Aún no hay juego al que continuar, ¡paciencia!)                               Clic para continuar >",width-20,height-40);
      
      /* Efecto de fundid o*/
      if(fundidoCompleto){
        fill(0,fundido);
        rect(0,0,width,height);
        println(fundido);//debug
        println(millis()-tiempoActual);//debug
        
        /* Funcionamiento del pantallazo negro */
        /* Se debería escuchar un sonido contundente que coincida con el pantallazo, dando un efecto de apagón */
        /* Pasados unos segundos en lo que se reproduce el sonido, se muestra la pantalla de controles */
        
        if(millis() - tiempoActual >= 3000){ //3 segundos de espera entre el pantallazo negro y la pantalla de controles
          fundido -= 15;
          if (fundido <= 0){
            fundidoCompleto = false; //alternando fundidoCompleto entre pantallas
            fundido = 255; //reseteando fundido para la siguiente pantalla
            clicable = true; 
          }
        }
      }  
      
      break;
    case MaquinaEstados.JUGANDO:
      /* Pantalla Comenzando a jugar Nivel 1 */
      escenario.display();
      
      jugador.update();
      escenario.mostrarArboles();
      Arbol arbol;
      for (int i=0; i<escenario.arboles.size(); i++) {
        arbol = escenario.arboles.get(i);
        jugador.colisionarArbol(arbol);
        enemigo.display();
        enemigo.mover();
        enemigo.rebotar();
        jugador.display();
      }
      break;
    case MaquinaEstados.PERDIENDO:
      /* Pantalla Game Over */    
      break;
    case MaquinaEstados.GANANDO:
      /* Pantalla de victoria */    
      break;
      
  }//end switch
}

void mousePressed(){
  if (clicable){    
    if(estado== MaquinaEstados.INICIANDO){
      estado= MaquinaEstados.INSTRUCCIONANDO;
    }else if(estado == MaquinaEstados.INSTRUCCIONANDO){
      estado= MaquinaEstados.JUGANDO;
    }
  }
}

void mouseReleased(){
}

void keyPressed() {
  jugador.keyPressed();
}

void keyReleased() {
  jugador.keyReleased();
}
