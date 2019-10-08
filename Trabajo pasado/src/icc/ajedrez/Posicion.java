package icc.ajedrez;

/**Clase para ajustar y acceder a la posición de las piezas.
*@author Sebastián A.
*/
public class Posicion {

	private int renglón;
	private char columna;

	/**Método constructor para la posición de las piezas.
	*@param columna Columna en la que irá la pieza.
	*@param renglón Renglón en la que irá la pieza.
	*/
	public Posicion(char columna,int renglón) {
		setRenglón(renglón);
		setColumna(columna);
	}

	/**Método setter para ajustar el renglón de la pieza.
	*@param nuevoRenglón Renglón al que se ajustará la pieza.
	*/
	public void setRenglón(int nuevoRenglón) {
		if (nuevoRenglón >= 1 && nuevoRenglón <= 8)
			renglón = nuevoRenglón;
		else
			throw new IllegalArgumentException("Número incorrecto para el renglón.");
	}

	/**Método setter para ajustar la columna de la pieza.
	*@param nuevaColumna Columna a la que se ajustará la pieza.
	*/
	public void setColumna(char nuevaColumna) {
		if (nuevaColumna >= 'a' && nuevaColumna <= 'h')
			columna = nuevaColumna;
		else
			throw new IllegalArgumentException("Caracter incorrecto para la columna.");
	}

	/**Método getter para obtener el renglón de la pieza.
	*@return Renglón actual de la pieza.
	*/
	public int getRenglón() {
		return renglón;
	}

	/**Método getter para obtener la columna de la pieza.
	*@return Columna actual de la pieza.
	*/
	public char getColumna() {
		return columna;
	}

} //Fin de clase Posicion.