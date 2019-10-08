package icc.ajedrez;
import java.util.List;
import java.util.ArrayList;

/**Clase para el alfil del ajedrez.
*@author Sebastián A.
*/
public class Alfil extends Pieza {

	/**Método constructor para el alfil.
	*@param columna Columna en la que irá la pieza.
	*@param renglón Renglón en el que irá la pieza.
	*@param color Color de la pieza.
	*/
	public Alfil(char columna, int renglón, boolean color) {
		super(columna, renglón, color);
	} //Fin de constructor Alfil.

	/**Método para saber todos los posibles movimientos de la pieza.
	*@return Lista con los posibles movimientos de la pieza en la forma (columna,renglón).
	*/
	public List posiblesMovimientos() {

		int posibles = 0;
		int renglónContador;
		char columnaContador;
		char getColumna;
		List<String> listaDePosibles = new ArrayList<String>();

		//NORESTE.
		getColumna = getColumna();
		renglónContador = getRenglón() + 1;
		columnaContador = ++getColumna;
		while (renglónContador < 9 && columnaContador <= 'h') {
			posibles += 1;
			listaDePosibles.add("("+columnaContador+","+renglónContador+")");
			renglónContador += 1;
			columnaContador += 1;
		}

		//SURESTE.
		getColumna = getColumna();
		renglónContador = getRenglón() - 1;
		columnaContador = ++getColumna;
		while (renglónContador > 0 && columnaContador <= 'h') {
			posibles += 1;
			listaDePosibles.add("("+columnaContador+","+renglónContador+")");
			renglónContador -= 1;
			columnaContador += 1;
		}

		//SUROESTE.
		getColumna = getColumna();
		renglónContador = getRenglón() - 1;
		columnaContador = --getColumna;
		while (renglónContador > 0 && columnaContador >= 'a') {
			posibles += 1;
			listaDePosibles.add("("+columnaContador+","+renglónContador+")");
			renglónContador -= 1;
			columnaContador -= 1;
		}

		//NOROESTE.
		getColumna = getColumna();
		renglónContador = getRenglón() + 1;
		columnaContador = --getColumna;
		while (renglónContador < 9 && columnaContador >= 'a') {
			posibles += 1;
			listaDePosibles.add("("+columnaContador+","+renglónContador+")");
			renglónContador += 1;
			columnaContador -= 1;
		}

		return listaDePosibles;

	} //Fin de posiblesMovimientos().

	/**Método para obtener la pieza representada en forma de String.
	*@return Representación en cadena de la pieza.
	*/
	public String toString() {
		String colorAlfil;
		if (getColor()) {colorAlfil = "blanco";} else {colorAlfil = "negro";}
		return "Este alfil "+colorAlfil+" se encuentra en la posición: ("+getColumna()+","+getRenglón()+").";
	}

} //Fin de clase Alfil.