/** Clase que contendrá el ArrayList de las llaves esparcidas por el escenario */
class GestorLlaves {
  /* -- ATRIBUTOS -- */
  /** Representa una lista dinamica que contiene a las llaves */
  private ArrayList<Llave> llaves;

  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public GestorLlaves(int nivel) {
    llaves = new ArrayList <Llave>();
    generarNivel(nivel);
  }

  /* -- MÉTODOS -- */
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
  public void colisionarObjetos() {/*
    for (Llave l : llaves) {
      // Verifica la colision entre el jugador y la llave
      if (colisionador.colisionar(jugador.getPosicion(), jugador.getAncho(), jugador.getAlto(), l.getPosicion(), l.getAncho(), l.getAlto())) {
        l.setPosicion(new PVector(jugador.getPosicion().x-2, jugador.getPosicion().y-5));
      }

      //Verificando la colision de la llave con la puerta
      if (colisionador.colisionar(l.getPosicion(), l.getAncho(), l.getAlto(), puerta.getPosicion(), puerta.getAncho(), puerta.getAlto())) {
        estado = MaquinaEstados.GANANDO;
      }
    }*/
  }
  /** Dibuja las llaves en el escenario */
  public void dibujarLlaves() {
    for (Llave l : llaves) {
      l.display();
    }
  }
}
