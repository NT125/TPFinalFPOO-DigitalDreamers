/** Clase que contiene el Array Fijo de las antorchas: Gestionará la aparición de 5 las antorchas disponibles */
class GestorAntorcha{
  /* -- ATRIBUTOS -- */
  /** Representa a las Antorchas que tendrá disponible el jugador */
  private Antorcha[] antorchas;
  
  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto, no es necesario un constructor parametrizado */
  public GestorAntorcha(){
    antorchas = new Antorcha[5];
  }
  
  /* -- MÉTODOS -- */
  /** Elimina la antorcha */
  public void eliminarAntorcha(){}
  
}
