require_relative '../Pieza'

# Clase que representa a la pieza Peón.
class Peon < Pieza

  # Inicializador de un Peón.
  # columna:: Columna del Peón.
  # renglón:: Renglón del Peón.
  # color:: Color del Peón (booleano).
  def initialize(columna, renglón, color)
    if color && renglón == 1
      raise ArgumentError, "Un peón blanco no puede ubicarse " +
                            "en el primer renglón."
    end

    if !color && renglón == 8
      raise ArgumentError, "Un peón negro no puede ubicarse " +
                            "en el último renglón."
    end

    super(columna, renglón, color);
  end

  # Método setter para el renglón de un peón.
  # renglón:: Renglón nuevo (entero entre 1 y 8).
  def renglón=(renglón)
    if color && renglón == 1
      raise ArgumentError, "Un peón blanco no puede ubicarse " +
                            "en el primer renglón."
    end

    if !color && renglón == 8
      raise ArgumentError, "Un peón negro no puede ubicarse " +
                            "en el último renglón."
    end

    if (renglón >= 1 && renglón <= 8)
      @posición.renglón = renglón
    else
      raise ArgumentError, "El renglón tiene que ser " +
                            "un valor entre 1 y 8."
    end
  end

  def posiblesMovimientos
    # Lista con los posibles movimientos
    # de la pieza.
    listaPM = []

    # Número de veces que se puede desplazar el peón.
    t = (self.posición.renglón == 2 || self.posición.renglón == 7) ? 2 : 1

    begin
      t.times do |z|
        if @color
          listaPM.push( desplazar(0, z+1) )
        else
          listaPM.push( desplazar(0, -(z+1)) )
        end
      end
    rescue
    end

    # Se regresa la lista...
    return listaPM
  end

  def posiblesMovimientosTablero(tablero)
    # Lista con los posibles movimientos
    # de la pieza.
    listaPM = posiblesMovimientos

    begin
      if color
        x = desplazar(0, 1)
        y = desplazar(0, 2)
      else
        x = desplazar(0, -1)
        y = desplazar(0, -2)
      end
    rescue
    end

    pieza1 = tablero.getPieza(x.columna, x.renglón)
    pieza2 = tablero.getPieza(y.columna, y.renglón)
    if pieza1
      listaPM = []
    elsif pieza2
      listaPM.delete(y)
    end

    # Arriba a la derecha
    if color
      begin
        z = desplazar(1, 1)
        pieza = tablero.getPieza(z.columna, z.renglón)
        if pieza && self.color != pieza.color
          listaPM.push(z)
        end
      rescue
      end
    end

    # Arriba a la izquierda
    if color
      begin
        z = desplazar(-1, 1)
        pieza = tablero.getPieza(z.columna, z.renglón)
        if pieza && self.color != pieza.color
          listaPM.push(z)
        end
      rescue
      end
    end

    # Abajo a la derecha
    if !color
      begin
        z = desplazar(1, -1)
        pieza = tablero.getPieza(z.columna, z.renglón)
        if pieza && self.color != pieza.color
          listaPM.push(z)
        end
      rescue
      end
    end

    # Abajo a la izquierda
    if !color
      begin
        z = desplazar(-1, -1)
        pieza = tablero.getPieza(z.columna, z.renglón)
        if pieza && self.color != pieza.color
          listaPM.push(z)
        end
      rescue
      end
    end

    # Se regresa la lista...
    return listaPM
  end

end