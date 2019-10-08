package icc.ajedrez;
import java.util.List;
import java.util.ArrayList;

/**Clase para el caballo del ajedrez.
*@author Sebastián A.
*/
public class Caballo extends Pieza {

	/**Método constructor para el caballo.
	*@param columna Columna en la que irá la pieza.
	*@param renglón Renglón en el que irá la pieza.
	*@param color Color de la pieza.
	*/
	public Caballo(char columna, int renglón, boolean color) {
		super(columna, renglón, color);
	} //Fin de constructor Caballo.

	/**Método para saber todos los posibles movimientos de la pieza.
	*@return Lista con los posibles movimientos de la pieza en la forma (columna,renglón).
	*/
	public List posiblesMovimientos() {

		int posibles = 0;
		int renglónContador;
		char columnaContador;
		char getColumna;
		List<String> listaDePosibles = new ArrayList<String>();

		//NORTE->ESTE.
		getColumna = getColumna();
		renglónContador = getRenglón() + 2;
		columnaContador = ++getColumna;
		if (renglónContador < 9 && columnaContador <= 'h') {
			posibles += 1;
			listaDePosibles.add("("+columnaContador+","+renglónContador+")");
		}

		//NORTE->OESTE.
		getColumna = getColumna();
		renglónContador = getRenglón() + 2;
		columnaContador = --getColumna;
		if (renglónContador < 9 && columnaContador <= 'h') {
			posibles += 1;
			listaDePosibles.add("("+columnaContador+","+renglónContador+")");
		}

		//SUR->ESTE.
		getColumna = getColumna();
		renglónContador = getRenglón() - 2;
		columnaContador = ++getColumna;
		if (renglónContador > 0 && columnaContador <= 'h') {
			posibles += 1;
			listaDePosibles.add("("+columnaContador+","+renglónContador+")");
		}

		//SUR->OESTE.
		getColumna = getColumna();
		renglónContador = getRenglón() - 2;
		columnaContador = --getColumna;
		if (renglónContador > 0 && columnaContador <= 'h') {
			posibles += 1;
			listaDePosibles.add("("+columnaContador+","+renglónContador+")");
		}

		//ESTE->NORTE.
		getColumna = getColumna();
		renglónContador = getRenglón() + 1;
		columnaContador = ++getColumna;
		columnaContador = ++columnaContador;
		if (renglónContador > 0 && columnaContador <= 'h') {
			posibles += 1;
			listaDePosibles.add("("+columnaContador+","+renglónContador+")");
		}

		//ESTE->SUR.
		getColumna = getColumna();
		renglónContador = getRenglón() - 1;
		columnaContador = ++getColumna;
		columnaContador = ++columnaContador;
		if (renglónContador > 0 && columnaContador <= 'h') {
			posibles += 1;
			listaDePosibles.add("("+columnaContador+","+renglónContador+")");
		}

		//OESTE->NORTE.
		getColumna = getColumna();
		renglónContador = getRenglón() + 1;
		columnaContador = --getColumna;
		columnaContador = --columnaContador;
		if (renglónContador > 0 && columnaContador <= 'h') {
			posibles += 1;
			listaDePosibles.add("("+columnaContador+","+renglónContador+")");
		}

		//OESTE->SUR.
		getColumna = getColumna();
		renglónContador = getRenglón() - 1;
		columnaContador = --getColumna;
		columnaContador = --columnaContador;
		if (renglónContador > 0 && columnaContador <= 'h') {
			posibles += 1;
			listaDePosibles.add("("+columnaContador+","+renglónContador+")");
		}

		return listaDePosibles;

	} //Fin de posiblesMovimientos().

	/**Método para obtener la pieza representada en forma de String.
	*@return Representación en cadena de la pieza.
	*/
	public String toString() {
		String colorCaballo;
		if (getColor()) {colorCaballo = "blanco";} else {colorCaballo = "negro";}
		return "Este caballo "+colorCaballo+" se encuentra en la posición: ("+getColumna()+","+getRenglón()+").";
	}

} //Fin de clase Caballo.