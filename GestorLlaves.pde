/** Clase que contendrá el ArrayList de las llaves esparcidas por el escenario */
class GestorLlaves {
  /* -- ATRIBUTOS -- */
  /** Representa una lista dinamica que contiene a las llaves */
  private ArrayList<Llave> llaves;

  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public GestorLlaves() {
    this.llaves = new ArrayList <Llave>();
    generarLlaves();
  }

  /* -- MÉTODOS -- */
  /** Genera las llaves */
  public void generarLlaves(){
    Llave l;
    l = new Llave(new PVector(width/4, height/4), 45, 45);
    this.llaves.add(l);
    l = new Llave(new PVector(width/3, height/1.2), 45, 45);
    this.llaves.add(l);
  }
  
  /** Evalua la colision entre la llave y otro objeto  */
  public void colisionarJugador(Jugador jugador, Colisionador colisionador) {
    for (Llave l : this.llaves) {
      // Verifica la colision entre el jugador y la llave
      if (colisionador.colisionarRectangulo(jugador,l)) {
        l.setPosicion(new PVector(jugador.getPosicion().x, jugador.getPosicion().y));
      }
    }
  }
  
  /** Permite "abrir la puerta" y ganar el juego*/
  public void abrirPuerta(){
    boolean abierta = true;
    for (Llave l : this.llaves){
      if(!l.colisionarPuerta()){
        abierta = false;
      }
    }
    if (abierta){
      estado = MaquinaEstados.GANANDO;
    }    
  }
  
  /** Dibuja las llaves en el escenario */
  public void dibujarLlaves() {
    for (Llave l : this.llaves) {
      l.display();
    }
  }
}
