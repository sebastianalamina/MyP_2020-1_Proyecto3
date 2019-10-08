# Clase que representa una posición en el tablero.
class Posicion

  # Método getter para el renglón.
  attr_reader :renglón
  
  # Método getter para la columna.
  attr_reader :columna

  # Inicializador de una posición.
  # columna:: Columna de la posición.
  # renglón:: Renglón de la posición.
  def initialize(columna, renglón)
    self.renglón = renglón
    self.columna = columna
  end

  # Método setter para el renglón.
  # renglón:: Renglón nuevo (entero entre 1 y 8).
  def renglón=(renglón)
    if (renglón >= 1 && renglón <= 8)
      @renglón = renglón
    else
      raise ArgumentError, "El renglón tiene que ser " +
                            "un valor entre 1 y 8."
    end
  end

  # Método setter para la columna.
  # columna:: Columna nueva (entero entre 1 y 8).
  def columna=(columna)
    if (columna >= 1 && columna <= 8)
      @columna = columna
    else
      raise ArgumentError, "La columna tiene que ser " +
                            "un valor entre 1 y 8."
    end
  end

  # Método to_s de la posición.
  def to_s
    # Columna de la pieza...
    col = "x"
    case self.columna
    when 1
      col = "a"
    when 2
      col = "b"
    when 3
      col = "c"
    when 4
      col = "d"
    when 5
      col = "e"
    when 6
      col = "f"
    when 7
      col = "g"
    when 8
      col = "h"
    end
    # Construcción del string...
    return "(#{col}, #{self.renglón})"
  end

  # Método == de la posición. Dos posiciones son
  # iguales si tienen misma columna y renglón.
  def ==(other)
    return other.class == self.class \
    && other.columna == self.columna \
    && other.renglón == self.renglón
  end

end