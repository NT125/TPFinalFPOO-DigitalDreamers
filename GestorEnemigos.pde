/** Clase que contiene el ArrayList de los Enemigos: Gestionará la aparición de varios enemigos */
class GestorEnemigos {
  /* -- ATRIBUTOS -- */
  /** Representa la lista dinamica que contiene a los enemigos */
  private ArrayList<Enemigo> enemigos;

  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public GestorEnemigos(int nivel) {
    enemigos = new ArrayList <Enemigo>();
    generarNivel(nivel);
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
  /** Genera a los enemigos segun el nivel */
  public void generarNivel(int nivel) {
    switch(nivel) {
    case 1:
      {
        Enemigo e;
        e = new Enemigo(new PVector(600, 70), 45, 45, new PVector(60, -29.9));
        enemigos.add(e);
        e = new Enemigo(new PVector(200, 100), 45, 45, new PVector(68, -29.9));
        enemigos.add(e);
        e = new Enemigo(new PVector(500, 400), 45, 45, new PVector(20, 29.9));
        enemigos.add(e); 
        break;
      } //end case 1
    }//end Switch
  }
  /** Verificar colision con jugador*/
  public void colisionarObjetos(Jugador jugador) {
    for (Enemigo e : enemigos) {
      // Verifica la colision entre el jugador y el enemigo para pasar al estado perdiendo
      if (colisionador.colisionarCircRect(jugador,e)) {
        //estado= MaquinaEstados.PERDIENDO;
        e.setColor(color(#DB1818));
        println("hay colicion");
      } else{
        e.setColor(color(255,90));
      }
    }
  }
  /** Evalua la colision de un enemigo con otro */
  public void colisionarEnemigos() {
    for (int i= 0; i<enemigos.size(); i++) {
      for (int j=i+1; j<enemigos.size(); j++) {
        Enemigo e= enemigos.get(i);
        Enemigo circulo2 = enemigos.get(j);
        if (e.chocarCon(circulo2)) {
          e.cambiarDireccion();
          circulo2.cambiarDireccion();
        }
      }
    }
  }//Fin colisionarEnemigos.
}
