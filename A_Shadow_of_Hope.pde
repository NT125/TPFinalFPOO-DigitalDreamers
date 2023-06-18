int pantalla; //1 para menú, 2 para controles, 3 para juego

PFont fTitulo;
PFont fEncabezado;
PFont fTextos;
PFont fTextosSmall;

void setup(){
  pantalla = 0;
  size(700,600);
  
  fTitulo = createFont("alagard.ttf",80,false);
  fEncabezado = createFont("arpegius.ttf",50,false);
  fTextos = createFont("pixel-unicode.ttf",30,false);
  fTextosSmall = createFont("pixel-unicode.ttf",20,false);
}

void draw(){
  background(0);
  
  if(pantalla == 0){
    /* Pantalla de Inicio */
    /*
    PImage inicio = loadImage("menu.jpg");
    image(inicio,0,0);
    */
    fill(255);
    textFont(fTitulo);
    textAlign(CENTER,CENTER);
    text("A Shadow of Hope",width/2,90);
    
    fill(255,150);
    textFont(fTextos);
    text("Haga clic para iniciar", width/2, height/1.5);
    
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
    
  }else if(pantalla == 1){  
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
    text("Clic para continuar >",width-20,height-40);
    
  }else if(pantalla == 2){
    textAlign(CENTER,CENTER);
    textSize(80);
    text("Juego",width/2,height/2);        
  }
}

void mousePressed(){
  if(pantalla < 2){
    pantalla++;
  }
}
