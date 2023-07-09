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
    for (Enemigo e : enemigos) {
      e.display();
      e.mover();
      e.rebotar();
    }
  }
  /** Genera el grupo de enemigos */
  public void generarEnemigos() {
    Enemigo e;
    e = new Enemigo(new PVector(600, 70), 45, 45, new PVector(80, -99.9));
    enemigos.add(e);
    e = new Enemigo(new PVector(200, 100), 45, 45, new PVector(108, 39.3));
    enemigos.add(e);
    e = new Enemigo(new PVector(500, 400), 45, 45, new PVector(50, -30.9));
    enemigos.add(e); 
  }
  /** Verificar colision con jugador*/
  public void colisionarJugador(Jugador jugador, Colisionador colisionador) {
    for (Enemigo e : enemigos) {
      // Verifica la colision entre el jugador y el enemigo para pasar al estado perdiendo
      if (colisionador.colisionarCircRect(e,jugador)) {
        println("hay colicion");
        estado= MaquinaEstados.PERDIENDO;
      }
    }
  }
  /** Evalua la colision de un enemigo con otro */
  public void colisionarEnemigos(Colisionador colisionador) {
    for (int i= 0; i<enemigos.size(); i++) {
      Enemigo e= enemigos.get(i);
      for (int j=i+1; j<enemigos.size(); j++) {
        Enemigo circulo2 = enemigos.get(j);
        if (colisionador.colisionarCirculo(e,circulo2)) {
          e.cambiarDireccion();
          circulo2.cambiarDireccion();
        }
      }
    }
  }//Fin colisionarEnemigos.
  
  /** Evalua la colision de un enemigo con un arbol */
  public void colisionarArboles(ArrayList<Arbol> arboles, Colisionador colisionador) {
    for (int i= 0; i<enemigos.size(); i++) {
      Enemigo e= enemigos.get(i);
      for (int j=0; j<arboles.size(); j++) {
        Arbol a = arboles.get(j);
        if (colisionador.colisionarCirculo(e,a)) {
          e.cambiarDireccion();
        }
      }
    }
  }//Fin colisionarEnemigos.
}
