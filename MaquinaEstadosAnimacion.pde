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
}