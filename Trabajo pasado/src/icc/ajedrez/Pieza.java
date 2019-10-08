package icc.ajedrez;
import java.util.List;

/**Clase abstracta padre de las piezas de ajedrez.
*@author Sebastián A.
*/
public abstract class Pieza extends Posicion {

	private boolean color;

	/**Método constructor para las piezas.
	*@param columna Columna en la que irá la pieza.
	*@param renglón Renglón en el que irá la pieza.
	*@param color Color de la pieza.
	*/
	public Pieza(char columna,int renglón, boolean color) {
		super(columna, renglón);
		this.color = color;
	}

	/**Método para saber todos los posibles movimientos de la pieza.
	*@return Lista con los posibles movimientos de la pieza en la forma (columna,renglón).
	*/
	public abstract List posiblesMovimientos();

	/**Método getter para obtener el color de la pieza.
	*@return Color de la pieza.
	*/
	public boolean getColor() {
		return color;
	}

	/**Método para verificar si una pieza puede realizar cierto movimiento.
	*@param columna Columna de la posición que se quiere saber si es posible.
	*@param renglón Renglón de la posición que se quiere saber si es posible.
	*@return Devuelve "true" si la pieza puede llegar a dicho lugar y "false" en caso contrario.
	*/
	public boolean esVálida(char columna, int renglón) {

		List posiblesMovs = posiblesMovimientos();
		String posición = "("+columna+","+renglón+")";

		if ( posiblesMovs.contains(posición) ) {
			return true;
		}
		return false;

	} //Fin de esVálida().

	/**Método para obtener la pieza representada en forma de String.
	*@return Representación en cadena de la pieza.
	*/
	public String toString() {
		return "Esta pieza se encuentra en la posición: ("+getColumna()+","+getRenglón()+").";
	}

} //Fin de clase Pieza.