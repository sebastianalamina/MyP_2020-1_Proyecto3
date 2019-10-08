# Clase que representa un tablero.
class Tablero

  # Inicializador de un tablero.
  def initialize()
    # Se crea un diccionario.
    @tablero = {}
    # Por defecto, cualquier llave tendrá
    # un valor nulo (ningún objeto).
    @tablero.default = nil
  end

  # Agrega una pieza al tablero.
  # pieza:: Pieza que será agregada al tablero. Cada
  # pieza tiene su correspondiente posición.
  def agregaPieza(pieza)
    pos = [pieza.posición.columna, pieza.posición.renglón]
    @tablero[pos] = pieza
  end

  # Quita una pieza del tablero.
  # columna:: Columna de la posición de la pieza
  # que se desea eliminar.
  # renglón:: Renglón de la posición de la pieza
  # que se desea eliminar.
  def quitaPieza(columna, renglón)
    pos = [columna, renglón]
    @tablero[pos] = nil
  end

  # Devuelve la pieza en la posición deseada.
  # 'nil' si no hay ninguna pieza en dicha posición
  # columna:: Columna de la posición deseada.
  # renglón:: Renglón de la posición deseada.
  def getPieza(columna, renglón)
    pos = [columna, renglón]
    return @tablero[pos]
  end

  # Mueve una pieza de la posición (columna1, renglón1) a
  # la posición (columna2, renglón2). Si no hay una pieza
  # en la primera posición, se arroja un error. Si hay una
  # pieza en la segunda posición, la quita del tablero.
  # columna1:: Columna de la primera posición.
  # renglón1:: Renglón de la primera posición.
  # columna2:: Columna de la segunda posición.
  # renglón2:: Renglón de la segunda posición.
  def moverPieza(columna1, renglón1, columna2, renglón2)
    # Se obtiene la pieza de la primera posición
    # y la primera posición.
    pieza1 = self.getPieza(columna1, renglón1)
    posicion1 = [columna1, renglón1]
    # Si pieza1 es 'nil', no hay ninguna pieza en dicha posición.
    if pieza1 == nil
      raise ArgumentError, "No hay ninguna pieza en la " +
                            "posición #{posicion1}."
    end

    posicion2 = [columna2, renglón2]
    posiblesPieza1 = pieza1.posiblesMovimientosTablero(self)
    # Condición para mover la pieza1 a la posición deseada.
    cond = posiblesPieza1.include?( Posicion.new(columna2, renglón2) )

    if cond
      @tablero[posicion2] = pieza1
      @tablero[posicion1] = nil
      # Y se cambia la posición de la pieza.
      pieza1.columna = columna2
      pieza1.renglón = renglón2
    else
      raise ArgumentError, "La pieza en la posición #{posicion1} no " +
                            "puede ser movida a la posición #{posicion2}." 
    end
  end

  # Método to_s del tablero.
  def to_s
    s = " ┌─┬─┬─┬─┬─┬─┬─┬─┐\n"
    8.times do |i|
      s += (8-i).to_s
      s += "│"
      8.times do |j|
        col = j+1
        ren = 8-i
        s += stringPieza(col, ren) + "│"
      end
      s += "\n"
      if (i < 7)
        s += " ├─┼─┼─┼─┼─┼─┼─┼─┤\n"
      end
    end
    s += " └─┴─┴─┴─┴─┴─┴─┴─┘\n"
    s += "  a b c d e f g h \n"
    return s
  end

  # Regresa en forma de string ASCII la pieza
  # de cierta posición en el tablero.
  # columna:: Columna de la posición deseada.
  # renglón:: Renglón de la posición deseada.
  def stringPieza(columna, renglón)
    t = @tablero[[columna, renglón]]
    if t == nil
      return " "
    end
    case t.class.name
    when "Peon"
      if t.color
        return "♙"
      else
        return "♟"
      end
    when "Caballo"
      if t.color
        return "♘"
      else
        return "♞"
      end
    when "Reina"
      if t.color
        return "♕"
      else
        return "♛"
      end
    when "Rey"
      if t.color
        return "♔"
      else
        return "♚"
      end
    when "Alfil"
      if t.color
        return "♗"
      else
        return "♝"
      end
    when "Torre"
      if t.color
        return "♖"
      else
        return "♜"
      end
    end
  end

end