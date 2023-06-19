/** clase que representa a la antorcha*/
class Antorcha{
  /** atributos */
  private boolean encendido;  //Representa a si la antorcha esta prendida
  
  /** ---------------- ZONA DE CONSTRUCTORES ---------------- */
  //Constructor por defecto
  public Antorcha(){}
  //Constructor parametrizado
  public Antorcha(boolean encendido){
    this.encendido = encendido;
  }
  /** ---------------- ZONA DE METODOS ---------------- */
  public void mover(){
    
  }
  /** ---------------- ZONA DE METODOS ASESORES ---------------- */
  /* getters */
  public boolean getEncendido(){
    return this.encendido;
  }
  /* setters */
  public void setEncendido(boolean encendido){
    this.encendido=encendido;
  }
  
}
