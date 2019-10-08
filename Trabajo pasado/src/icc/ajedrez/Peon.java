package icc.ajedrez;
import java.util.List;
import java.util.ArrayList;

/**Clase para el peón del ajedrez.
*@author Sebastián A.
*/
public class Peon extends Pieza {

	/**Método constructor para el peón.
	*@param columna Columna en la que irá la pieza.
	*@param renglón Renglón en el que irá la pieza.
	*@param color Color de la pieza.
	*/
	public Peon(char columna, int renglón, boolean color) {
		super(columna, renglón, color);
	} //Fin de constructor Peon.

	/**Método para saber todos los posibles movimientos de la pieza.
	*@return Lista con los posibles movimientos de la pieza en la forma (columna,renglón).
	*/
	public List posiblesMovimientos() {

		int posibles = 0;
		int renglónContador = getRenglón();
		char columnaContador = getColumna();
		List<String> listaDePosibles = new ArrayList<String>();

		if (getColor()) { //Si el peón es blanco...

			//NORTE pues es blanco.
			if (renglónContador == 2) { //Si el peón no se ha movido...
				posibles += 2;
				renglónContador += 1;
				listaDePosibles.add("("+columnaContador+","+renglónContador+")");
				renglónContador += 1;
				listaDePosibles.add("("+columnaContador+","+renglónContador+")");
			} /*Fin si el peón no se ha movido. */ else { //Si el peón ya se ha movido...
				if (renglónContador < 8) { //Para evitar contar el renglón 9.
					posibles += 1;
					renglónContador += 1;
					listaDePosibles.add("("+columnaContador+","+renglónContador+")");
				}
			} //Fin si el peón ya se ha movido.

		} /*Fin si el peón es blanco. */ else { //Si el peón es negro...

			//SUR pues es negro.
			if (renglónContador == 7) { //Si el peón no se ha movido...
				posibles += 2;
				renglónContador -= 1;
				listaDePosibles.add("("+columnaContador+","+renglónContador+")");
				renglónContador -= 1;
				listaDePosibles.add("("+columnaContador+","+renglónContador+")");
			} /*Fin si el peón no se ha movido. */ else { //Si el peón ya se ha movido...
				if (renglónContador > 1) { //Para evitar contar el renglón 0.
					posibles += 1;
					renglónContador -= 1;
					listaDePosibles.add("("+columnaContador+","+renglónContador+")");
				}
			} //Fin si el peón ya se ha movido.

		} //Fin si el peón es negro.

		return listaDePosibles;

	} //Fin de posiblesMovimientos().

	/**Método para obtener la pieza representada en forma de String.
	*@return Representación en cadena de la pieza.
	*/
	public String toString() {
		String colorPeón;
		if (getColor()) {colorPeón = "blanco";} else {colorPeón = "negro";}
		return "Este peón "+colorPeón+" se encuentra en la posición: ("+getColumna()+","+getRenglón()+").";
	}

} //Fin de clase Peon.