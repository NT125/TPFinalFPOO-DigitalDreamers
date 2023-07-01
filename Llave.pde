class Llave extends SpriteObject implements IVisualizable{
  
   /** -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Llave() {}
  
  /** Constructor parametrizado */
  public Llave(PVector posicion, int ancho, int alto) {
    this.posicion = posicion;
    this.spriteSheet = requestImage("llave.png");
    this.ancho = ancho;
    this.alto = alto;   
    this.estado = MaquinaEstadosAnimacion.ESTATICO;
  }   

  public void display(){
    tint(105, 22, 32);
      this.render(this.estado);
      tint(255);
  }

}
