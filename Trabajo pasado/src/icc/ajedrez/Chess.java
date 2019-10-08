package icc.ajedrez;
import java.util.Scanner;

/**Clase para hacer uso del Ajedrez - Práctica 8 (Ajedrez).
*@author Sebastián A.
*/
public class Chess {

	private Scanner lector;

	/**Constructor de la clase Chess.
	*/
	public Chess() {
		lector = new Scanner(System.in);
	} //Fin de constructor Chess().

	/**Método main.
	*@param args Argumentos (no son necesarios para este programa).
	*/
	public static void main (String[] args) {
		Chess interfaz = new Chess();
		interfaz.menuInteractivo();
	} //Fin de método main.

	//Método privado que llama al menú interactivo para el usuario desde el método main.
	private void menuInteractivo() {
		System.out.println("Vamos a crear una pieza...");
		Pieza pieza = crearPieza(preguntarPieza());
		System.out.println("\n"+pieza.toString()+"\n");
		imprimeTablero(pieza);

		boolean seguirPreguntando = true;
		int opción = 0;

		do {

			System.out.println("\n\n1) Saber si cierto movimiento es válido.");
			System.out.println("2) Conocer todos los movimientos válidos.");
			System.out.println("3) Mover de lugar a la pieza (a cualquier parte del tablero.");
			System.out.println("4) Crear otra pieza (y descartar esta).");
			System.out.println("5) Salir.");
			System.out.println("¿Qué deseas hacer: ");

			try {
				opción = Integer.parseInt(lector.nextLine());
				if (opción < 1 || opción > 5) {
					throw new IllegalArgumentException("Número incorrecto para el renglón.");
				}
			}
			catch (IllegalArgumentException e) {
				System.out.println("El valor debe ser entre 1 y 5.");
			}
			catch (Exception e) {
				System.out.println("Introduce un valor válido.");
			}

			switch (opción) {
				case 1:
					if ( pieza.esVálida(preguntarColumna(),preguntarRenglón()) ) {
						System.out.println("Ese movimiento sí es válido.");
					} else {
						System.out.println("Ese movimiento no es válido.");
					}
					break;
				case 2:
					System.out.println("Los posibles movimientos para esta pieza son: "+pieza.posiblesMovimientos());
					break;
				case 3:
					pieza.setColumna(preguntarColumna());
					pieza.setRenglón(preguntarRenglón());
					imprimeTablero(pieza);
					break;
				case 4:
					seguirPreguntando = false;
					menuInteractivo();
					break;
				case 5:
					seguirPreguntando = false;
					break;
			}

		} while (seguirPreguntando);

	}

	//Método que se encarga de imprimir el tablero según la posición de la pieza actual.
	private void imprimeTablero(Pieza pieza) {

		System.out.println("\t  a b c d e f g h");
		System.out.println("\t ╔═╦═╦═╦═╦═╦═╦═╦═╗");
		for (int i = 0; i < 8; i++) {
			if ( pieza.getRenglón() != (8-i) ) {
				System.out.println("\t"+(8-i)+"║ ║ ║ ║ ║ ║ ║ ║ ║");
			} else {
				switch (pieza.getColumna()) {
					case 'a': System.out.println("\t"+(8-i)+"║X║ ║ ║ ║ ║ ║ ║ ║"); break;
					case 'b': System.out.println("\t"+(8-i)+"║ ║X║ ║ ║ ║ ║ ║ ║"); break;
					case 'c': System.out.println("\t"+(8-i)+"║ ║ ║X║ ║ ║ ║ ║ ║"); break;
					case 'd': System.out.println("\t"+(8-i)+"║ ║ ║ ║X║ ║ ║ ║ ║"); break;
					case 'e': System.out.println("\t"+(8-i)+"║ ║ ║ ║ ║X║ ║ ║ ║"); break;
					case 'f': System.out.println("\t"+(8-i)+"║ ║ ║ ║ ║ ║X║ ║ ║"); break;
					case 'g': System.out.println("\t"+(8-i)+"║ ║ ║ ║ ║ ║ ║X║ ║"); break;
					case 'h': System.out.println("\t"+(8-i)+"║ ║ ║ ║ ║ ║ ║ ║X║"); break;
				} //Fin del switch.
			} //Fin del if.
			if ( i != 7 ) {
				System.out.println("\t ╠═╬═╬═╬═╬═╬═╬═╬═╣");
			}
		}
		System.out.println("\t ╚═╩═╩═╩═╩═╩═╩═╩═╝");
		System.out.println("\t  a b c d e f g h");

	} //Fin de método imprimeTablero().

	//Método privado que crea la pieza indicada.
	private Pieza crearPieza(int cuálPieza) {

		char col = preguntarColumna();
		int ren = preguntarRenglón();
		boolean color = preguntarColor();

		switch (cuálPieza) {
			case 1:
				return new Rey(col,ren,color);
			case 2:
				return new Reina(col,ren,color);
			case 3:
				return new Caballo(col,ren,color);
			case 4:
				return new Alfil(col,ren,color);
			case 5:
				return new Torre(col,ren,color);
			case 6:
				return new Peon(col,ren,color);
		} //Fin del switch.

		return null;

	} //Fin de crearPieza().

	//Método privado que se encarga de preguntar al usuario por el renglón deseado.
	private int preguntarRenglón() {

		boolean seguirPreguntando = true;
		int renglónDado = 1;

		do {

			System.out.println("Dame el renglón deseado: ");

			try {
				renglónDado = Integer.parseInt(lector.nextLine());
				if (renglónDado < 1 || renglónDado > 8) {
					throw new IllegalArgumentException("Número incorrecto para el renglón.");
				}
				seguirPreguntando = false;
			}
			catch (IllegalArgumentException e) {
				System.out.println("El valor debe ser entre 1 y 8.");
			}
			catch (Exception e) {
				System.out.println("Introduce un valor válido.");
			}

		} while (seguirPreguntando);

		return renglónDado;

	} //Fin de preguntarRenglón().

	//Método privado que se encarga de preguntar al usuario por la columna deseada.
	private char preguntarColumna() {

		boolean seguirPreguntando = true;
		char columnaDada = 'a';

		do {

			System.out.println("Dame la columna deseada: ");
			try {
				columnaDada = (lector.nextLine()).charAt(0);
				columnaDada = Character.toLowerCase(columnaDada);
				if (columnaDada < 'a' || columnaDada > 'h') {
					throw new IllegalArgumentException("Caracter incorrecto para la columna.");
				}
				seguirPreguntando = false;
			} catch (IllegalArgumentException e1) {
				System.out.println("El valor debe ser entre 'a' y 'h'.");
			} catch (RuntimeException e2) {
				System.out.println("Introduce un valor válido.");
			}

		} while (seguirPreguntando);

		return columnaDada;

	} //Fin de preguntarColumna().

	//Método privado que se encarga de preguntar al usuario por el color deseado (blanco o negro).
	private boolean preguntarColor() {

		boolean seguirPreguntando = true;
		String colorDado;
		boolean color = true;

		do {

			System.out.println("Dame el color deseado: ");
			try {
				colorDado = (lector.nextLine()).toLowerCase();
				if ( colorDado.equals("blanco") || colorDado.equals("negro") ) {
					if ( colorDado.equals("blanco") ) {color = true;
					} else {color = false;}
					seguirPreguntando = false;
				} else {
					throw new IllegalArgumentException("Color incorrecto para la pieza.");
				}
			} catch (IllegalArgumentException e1) {
				System.out.println("El valor debe ser o \"blanco\" o \"negro\".");
			} catch (RuntimeException e2) {
				System.out.println("Introduce un valor válido.");
			}

		} while (seguirPreguntando);

		return color;

	} //Fin de preguntarColor().

	//Método privado que se encarga de preguntar al usuario por la pieza deseada.
	private int preguntarPieza() {

		boolean seguirPreguntando = true;
		int piezaDada = 1;

		do {

			System.out.println("1) Rey.");
			System.out.println("2) Reina.");
			System.out.println("3) Caballo.");
			System.out.println("4) Alfil.");
			System.out.println("5) Torre.");
			System.out.println("6) Peón.");


			System.out.println("¿Qué pieza deseas?: ");
			try {
				piezaDada = Integer.parseInt(lector.nextLine());
				if (piezaDada < 1 || piezaDada > 6) {
					throw new IllegalArgumentException("Número incorrecto.");
				}
				seguirPreguntando = false;
			} catch (IllegalArgumentException e1) {
				System.out.println("El valor debe ser entre 1 y 6.");
			} catch (RuntimeException e2) {
				System.out.println("Introduce un valor válido.");
			}

		} while (seguirPreguntando);

		return piezaDada;

	} //Fin de preguntarPieza().

} //Fin de clase Chess.