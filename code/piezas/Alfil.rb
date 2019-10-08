require_relative '../Pieza'

# Clase que representa a la pieza Alfil.
class Alfil < Pieza

  # Inicializador de un Alfil.
  # columna:: Columna del Alfil.
  # renglón:: Renglón del Alfil.
  # color:: Color del Alfil (booleano).
  def initialize(columna, renglón, color)
    super(columna, renglón, color);
  end

  def posiblesMovimientos
    # Lista con los posibles movimientos
    # de la pieza.
    listaPM = []

    # NORESTE.
    begin
      x = 1
      y = 1
      7.times do
        listaPM.push( desplazar(x, y) )
        x += 1
        y += 1
      end
    rescue
    end

    # SURESTE.
    begin
      x = 1
      y = -1
      7.times do
        listaPM.push( desplazar(x, y) )
        x += 1
        y -= 1
      end
    rescue
    end

    # SUROESTE.
    begin
      x = -1
      y = -1
      7.times do
        listaPM.push( desplazar(x, y) )
        x -= 1
        y -= 1
      end
    rescue
    end

    # NOROESTE.
    begin
      x = -1
      y = 1
      7.times do
        listaPM.push( desplazar(x, y) )
        x -= 1
        y += 1
      end
    rescue
    end

    # Se regresa la lista...
    return listaPM
  end

  def posiblesMovimientosTablero(tablero)
    # Lista con los posibles movimientos
    # de la pieza.
    listaPM = []

    # NORESTE.
    begin
      for i in 1..7
        x = desplazar(i, i)
        pieza = tablero.getPieza(x.columna, x.renglón)
        if !pieza || self.color != pieza.color
          listaPM.push(x)
        end
        break if pieza
      end
    rescue
    end

    # SURESTE.
    begin
      for i in 1..7
        x = desplazar(i, -i)
        pieza = tablero.getPieza(x.columna, x.renglón)
        if !pieza || self.color != pieza.color
          listaPM.push(x)
        end
        break if pieza
      end
    rescue
    end

    # SUROESTE.
    begin
      for i in 1..7
        x = desplazar(-i, -i)
        pieza = tablero.getPieza(x.columna, x.renglón)
        if !pieza || self.color != pieza.color
          listaPM.push(x)
        end
        break if pieza
      end
    rescue
    end

    # NOROESTE.
    begin
      for i in 1..7
        x = desplazar(-i, i)
        pieza = tablero.getPieza(x.columna, x.renglón)
        if !pieza || self.color != pieza.color
          listaPM.push(x)
        end
        break if pieza
      end
    rescue
    end

    # Se regresa la lista...
    return listaPM
  end

end