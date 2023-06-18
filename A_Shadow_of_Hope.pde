import gifAnimation.*;
/* Declarando gifs */
Gif myAnimation; 
Gif tituloScreen;

/* Declaración de variables Globales */
int pantalla; //0 para menú, 1 para controles, 2 para juego
int fundido; //Para calcular la opacidad del efecto de fundido
int fundido2; //Para calcular la opacidad del efecto de fundido
int tiempoActual; //Para medir eventos basados en tiempo, se le asignará millis() en cada uso

boolean fundidoCompleto; //Para verificar si se completó el fundido y prescindir de elementos
boolean fundidoCompleto2; //Para verificar si se completó el fundido y prescindir de elementos
boolean clicable;


/* Definición de variables para las distintas fuentes */
PFont fTitulo;
PFont fEncabezado;
PFont fTextos;
PFont fTextosSmall;

void setup(){
  pantalla = 0;
  size(700,600);
  
  clicable = false;
  
  fundido = 255;
  fundido2 = 255;
  /* creacion de Gifs*/
  myAnimation= new Gif(this, "Title.gif");
  myAnimation.play();
  tituloScreen = new Gif(this,"TitleScreen.gif");
  tituloScreen.play();
  
  /* Definición de Fuentes */
  fTitulo = createFont("alagard.ttf",75,false);
  fEncabezado = createFont("arpegius.ttf",50,false);
  fTextos = createFont("pixel-unicode.ttf",30,false);
  fTextosSmall = createFont("pixel-unicode.ttf",20,false);
}

void draw(){
  background(0);
  switch (pantalla){
    case 0: {
      /* Pantalla de Inicio */
      if(!fundidoCompleto2){
        fill(0,fundido2);
        rect(0,0,width,height);
        if(millis()>=4500){
          fundido2 -= 3;
          clicable = true;
          if (fundido2 <= 0){
            fundidoCompleto2 = true;
            fundido2 = 255; //reseteando fundido para la siguiente pantalla
          }
        }      
      } 
      
      fill(255);
      /*textFont(fTitulo);
      text("A Shadow of Hope",width/2,90);*/
      
      //Gif
      image(tituloScreen,0,0,width,height);
      image(myAnimation,0,60,width,140);
      
      textAlign(CENTER,CENTER);
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
          clicable = true;
          if (fundido <= 0){
            fundidoCompleto = true;
            fundido = 255; //reseteando fundido para la siguiente pantalla
          }
        }      
      }    
      tiempoActual = millis();
      break;
    }// end case 0
    case 1:{
      /* Pantalla de Controles */    
      fill(255);
      textFont(fEncabezado);
      textAlign(CENTER,CENTER);
      text("Cómo jugar",width/2,60);
      
      textFont(fTextos);
      textAlign(LEFT,CENTER);
      text("WASD:  Mover al personaje",60,160);
      text("Control:  Acción", 60, 200);
      text("Control2:  Acción2", 60, 240);
      
      textAlign(CENTER,CENTER);
      text("Objetivos del juego Objetivos del juego Objetivos del juego",width/2,370);
      text("Objetivos del juego Objetivos del juego Objetivos del juego",width/2,400);
      text("Objetivos del juego Objetivos del juego Objetivos del juego",width/2,430);
      text("...",width/2,470);
      
      textFont(fTextosSmall);
      textAlign(RIGHT,CENTER);
      text("(Aún no hay juego al que continuar, ¡paciencia!)                               Clic para continuar >",width-20,height-40);
      
      /* Efecto de fundido*/
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
    }// end case 1
    case 2:{
      /* Jugando */
      
      break;
    }//end case 2
    
  }// end swith
}

void mousePressed(){
  if (clicable){    
    if(pantalla < 1){
      pantalla++;
    }
  }
}

void mouseReleased(){
}
