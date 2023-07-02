/** Clase que contiene el ArrayList de los Enemigos: Gestionará la aparición de varios enemigos */
class GestorEnemigos {
  /** -- ATRIBUTOS -- */
  /** ArrayList dinámico que contiene a los enemigos */
  private ArrayList<Enemigo> enemigos;

  /** -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public GestorEnemigos() {
    enemigos = new ArrayList <Enemigo>();
  }

  /** -- MÉTODOS -- */
  /** Mostrando los enemigos */
  public void mostrarEnemigos() {
    for (Enemigo e : enemigos) {
      e.display();
      e.mover();
      e.rebotar();
    }
  }
  /** Gestionando los estados de las llaves */
  public void generarNivel(int nivel) {
    switch(nivel) {
    case 1:
      {
        Enemigo e;
        e = new Enemigo(new PVector(600, 70), 45, 45, new PVector(60, -29.9));
        enemigos.add(e);
        e = new Enemigo(new PVector(300, 70), 45, 45, new PVector(60, -29.9));
        enemigos.add(e);
        e = new Enemigo(new PVector(100, 370), 45, 45, new PVector(60, -29.9));
        enemigos.add(e);
        break;
      } //end case 1
    }//end Switch
  }
  /** Verificar colision con jugador*/
  public void colisionarObjetos() {
    for (Enemigo e : enemigos) {
      // Verifica la colision entre el jugador y el enemigo para pasar al estado perdiendo
      if (colisiona(jugador.getPosicion(), jugador.getAncho(), jugador.getAlto(), e.getPosicion(), e.getAncho(), e.getAlto())) {
        estado= MaquinaEstados.PERDIENDO;
      }
    }
  }
  /** Gestionando la formacion de los enemigos */
  public void generarFormacion() {
  }
}
