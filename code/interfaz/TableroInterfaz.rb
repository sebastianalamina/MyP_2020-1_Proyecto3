require_relative '../Tablero'
require_relative './CasillaInterfaz'
# Clase que representa un tablero en la interfaz.
class TableroInterfaz

  attr_reader :casillas

  # Inicializador de un tablero para la interfaz.
  def initialize(tablero)
    # Se asocia un tablero de ajedrez.
    @tablero = tablero
    # Se crea un diccionario con todas las casillas del tablero.
    @casillas = []
    # Se agrega cada casilla al diccionario.
    for col in (1..8)
      for ren in (1..8)
        bool = (col+ren) % 2 == 0
        color = bool ? 0 : 4095
        pieza = tablero.getPieza(col, ren)
        @casillas.push( CasillaInterfaz.new(col, ren, color, pieza) )
      end
    end
  end

end