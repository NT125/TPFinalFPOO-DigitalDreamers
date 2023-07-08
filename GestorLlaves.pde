/** Clase que contendrá el ArrayList de las llaves esparcidas por el escenario */
class GestorLlaves {
  /** -- ATRIBUTOS -- */
  /** Representa una lista dinamica que contiene a las llaves */
  private ArrayList<Llave> llaves;

  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public GestorLlaves(int nivel) {
    llaves = new ArrayList <Llave>();
    generarNivel(nivel);
  }

  /** -- MÉTODOS -- */
  /** Genera a las llaves segun el nivel */
  public void generarNivel(int nivel) {
    switch(nivel) {
    case 1:
      {
        Llave l;
        l= new Llave(new PVector(width/4, height/4), 45, 45);
        llaves.add(l);
        /*  Aun hay errores al poner ambas llaves
         l= new Llave(new PVector(width/2,height/2),45,45);
         llaves.add(l); */
        break;
      } //end case 1
    }//end Switch
  }
  /** Evalua la colision entre la llave y otro objeto  */
  public void colisionarObjetos(Jugador jugador, Puerta puerta, Colisionador colisionador) {
    for (Llave l : llaves) {
      // Verifica la colision entre el jugador y la llave
      if (colisionador.colisionarRectangulo(jugador,l)) {
        l.setPosicion(new PVector(jugador.getPosicion().x, jugador.getPosicion().y));
      }

      //Verificando la colision de la llave con la puerta
      if (colisionador.colisionarRectangulo(l,puerta)) {
        estado = MaquinaEstados.GANANDO;
      }
    }
  }
  /** Dibuja las llaves en el escenario */
  public void dibujarLlaves() {
    for (Llave l : llaves) {
      l.display();
    }
  }
}
