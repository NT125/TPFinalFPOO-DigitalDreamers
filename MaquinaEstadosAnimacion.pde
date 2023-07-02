/** Máquina de Estados de Animación: Gestiona los estados de animación de los elementos renderizables del juego */

class MaquinaEstadosAnimacion{
  /** Estado de reposo */
  public static final int IDLE = 0;
  
  /** Estado de Movimiento a la derecha */
  public static final int MOV_ABAJO = 1;
  
  /** Estado de Movimiento a la izquierda */
  public static final int MOV_DERECHA = 2;
  
  /** Estado de Movimiento hacia arriba */
  public static final int MOV_ARRIBA = 3;
  
  /** Estado de Movimiento hacia abajo */
  public static final int MOV_IZQUIERDA = 4;
  
  /** Estado estático, para objetos sin animación que sólo se renderizan */
  public static final int ESTATICO = 5;
  
  /** Estado en reposo a la derecha */
  public static final int ESTATICO_ABAJO = 6;
  
  /** Estado en reposo a la izquierda */
  public static final int ESTATICO_DERECHA = 7;
  
  /** Estado en reposo hacia arriba */
  public static final int ESTATICO_ARRIBA = 8;
  
  /** Estado en reposo hacia abajo */
  public static final int ESTATICO_IZQUIERDA = 9;
  
}
