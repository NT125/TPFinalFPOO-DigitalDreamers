/** Máquina de Estados: Verificando los estados del Juego */
class MaquinaEstados{
  
  /** Estado de inicio (Título) */
  public static final int TITULO = 0;
  
  /** Estado del tutorial (Cómo Jugar) */
  public static final int CONTROLES = 1;
  
  /** Estado in-game (Pleno Juego) */
  public static final int JUGANDO = 2;
  
  /** Estado de Derrota (Game Over) */
  public static final int PERDIENDO = 3;
  
  /** Estado de Victoria (Juego Finalizado) */
  public static final int GANANDO = 4;
}
