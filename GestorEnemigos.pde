/** Clase que contiene el ArrayList de los Enemigos: Gestionará la aparición de varios enemigos */
class GestorEnemigos {
  /** -- ATRIBUTOS -- */
  /** Representa la lista dinamica que contiene a los enemigos */
  private ArrayList<Enemigo> enemigos;

  /** -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public GestorEnemigos() {
    enemigos = new ArrayList <Enemigo>();
    generarEnemigos();
  }

  /* -- MÉTODOS -- */
  /** Mostrando los enemigos */
  public void mostrarEnemigos() {
    for (Enemigo e : this.enemigos) {
      e.display();
      e.mover();
      e.rebotar();
    }
  }
  /** Genera el grupo de enemigos */
  public void generarEnemigos() {
    Enemigo e;
    e = new Enemigo(new PVector(600, 70), 45, 45, new PVector(80, -99.9));
    this.enemigos.add(e);
    e = new Enemigo(new PVector(200, 100), 45, 45, new PVector(108, 39.3));
    this.enemigos.add(e);
    e = new Enemigo(new PVector(500, 400), 45, 45, new PVector(50, -30.9));
    this.enemigos.add(e); 
  }
  
  /** Verificar la colisión con el jugador de cada instancia de Enemigo */
  public void verificarColisionesJugador(Jugador jugador, Colisionador colisionador) {
    for (Enemigo e: this.enemigos){
      e.colisionarJugador(jugador,colisionador);
    }
  }

  /** Evalua la colision de un enemigo con otro */
  public void colisionarEnemigos(Colisionador colisionador) {
    for (int i= 0; i<this.enemigos.size(); i++) {
      Enemigo e = this.enemigos.get(i);
      for (int j=i+1; j<this.enemigos.size(); j++) {
        Enemigo circulo2 = this.enemigos.get(j);
        if (colisionador.colisionarCirculo(e,circulo2)) {
          e.cambiarDireccion();
          circulo2.cambiarDireccion();
        }
      }
    }
  }//Fin colisionarEnemigos.
  
  /** Evalua la colision de un enemigo con un arbol */
  public void colisionarArboles(ArrayList<Arbol> arboles, Colisionador colisionador) {
    for (int i= 0; i<this.enemigos.size(); i++) {
      Enemigo e= this.enemigos.get(i);
      for (int j=0; j<arboles.size(); j++) {
        Arbol a = arboles.get(j);
        if (colisionador.colisionarCirculo(e,a)) {
          e.cambiarDireccion();
        }
      }
    }
  }//Fin colisionarEnemigos.
}
