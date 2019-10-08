require_relative '../Pieza'

# Clase que representa a la pieza Rey.
class Rey < Pieza

  # Inicializador de un Rey.
  # columna:: Columna del Rey.
  # renglón:: Renglón del Rey.
  # color:: Color del Rey (booleano).
  def initialize(columna, renglón, color)
    super(columna, renglón, color);
  end

  def posiblesMovimientos
    # Lista con los posibles movimientos
    # de la pieza.
    listaPM = []

    # NORTE.
    begin
      listaPM.push( desplazar(0, 1) )
    rescue
    end

    # NORESTE.
    begin
      listaPM.push( desplazar(1, 1) )
    rescue
    end

    # ESTE.
    begin
      listaPM.push( desplazar(1, 0) )
    rescue
    end

    # SURESTE.
    begin
      listaPM.push( desplazar(1, -1) )
    rescue
    end

    # SUR.
    begin
      listaPM.push( desplazar(0, -1) )
    rescue
    end

    # SUROESTE.
    begin
      listaPM.push( desplazar(-1, -1) )
    rescue
    end

    # OESTE.
    begin
      listaPM.push( desplazar(-1, 0) )
    rescue
    end

    # NOROESTE.
    begin
      listaPM.push( desplazar(-1, 1) )
    rescue
    end

    # Se regresa la lista...
    return listaPM
  end

  def posiblesMovimientosTablero(tablero)
    # Lista con los posibles movimientos
    # de la pieza.
    listaPM = []

    # NORTE.
    begin
      x = desplazar(0, 1)
      pieza = tablero.getPieza(x.columna, x.renglón)
      if !pieza || self.color != pieza.color
        listaPM.push(x)
      end
    rescue
    end

    # NORESTE.
    begin
      x = desplazar(1, 1)
      pieza = tablero.getPieza(x.columna, x.renglón)
      if !pieza || self.color != pieza.color
        listaPM.push(x)
      end
    rescue
    end

    # ESTE.
    begin
      x = desplazar(1, 0)
      pieza = tablero.getPieza(x.columna, x.renglón)
      if !pieza || self.color != pieza.color
        listaPM.push(x)
      end
    rescue
    end

    # SURESTE.
    begin
      x = desplazar(1, -1)
      pieza = tablero.getPieza(x.columna, x.renglón)
      if !pieza || self.color != pieza.color
        listaPM.push(x)
      end
    rescue
    end

    # SUR.
    begin
      x = desplazar(0, -1)
      pieza = tablero.getPieza(x.columna, x.renglón)
      if !pieza || self.color != pieza.color
        listaPM.push(x)
      end
    rescue
    end

    # SUROESTE.
    begin
      x = desplazar(-1, -1)
      pieza = tablero.getPieza(x.columna, x.renglón)
      if !pieza || self.color != pieza.color
        listaPM.push(x)
      end
    rescue
    end

    # OESTE.
    begin
      x = desplazar(-1, 0)
      pieza = tablero.getPieza(x.columna, x.renglón)
      if !pieza || self.color != pieza.color
        listaPM.push(x)
      end
    rescue
    end

    # NOROESTE.
    begin
      x = desplazar(-1, 1)
      pieza = tablero.getPieza(x.columna, x.renglón)
      if !pieza || self.color != pieza.color
        listaPM.push(x)
      end
    rescue
    end

    # Se regresa la lista...
    return listaPM
  end

end