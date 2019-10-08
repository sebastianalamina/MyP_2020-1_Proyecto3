require_relative '../Pieza'

# Clase que representa a la pieza Caballo.
class Caballo < Pieza

  # Inicializador de un Caballo.
  # columna:: Columna del Caballo.
  # renglón:: Renglón del Caballo.
  # color:: Color del Caballo (booleano).
  def initialize(columna, renglón, color)
    super(columna, renglón, color);
  end

  def posiblesMovimientos
    # Lista con los posibles movimientos
    # de la pieza.
    listaPM = []

    # En todos los siguientes casos nos
    # moveremos dos espacios hacia la
    # primera dirección y un espacio hacia
    # la segunda dirección.
    # Por ejemplo, NORTE -> ESTE es mover
    # el Caballo dos espacios hacia arriba
    # y uno hacia la derecha.

    # NORTE -> ESTE.
    begin
      x = desplazar(1, 2)
      listaPM.push(x)
    rescue
    end

    # NORTE -> OESTE.
    begin
      x = desplazar(-1, 2)
      listaPM.push(x)
    rescue
    end

    # ESTE -> NORTE.
    begin
      x = desplazar(2, 1)
      listaPM.push(x)
    rescue
    end

    # ESTE -> SUR.
    begin
      x = desplazar(2, -1)
      listaPM.push(x)
    rescue
    end

    # SUR -> ESTE.
    begin
      x = desplazar(1, -2)
      listaPM.push(x)
    rescue
    end

    # SUR -> OESTE.
    begin
      x = desplazar(-1, -2)
      listaPM.push(x)
    rescue
    end

    # OESTE -> NORTE.
    begin
      x = desplazar(-2, 1)
      listaPM.push(x)
    rescue
    end

    # OESTE -> SUR.
    begin
      x = desplazar(-2, 1)
      listaPM.push(x)
    rescue
    end

    # Se regresa la lista...
    return listaPM
  end

  def posiblesMovimientosTablero(tablero)
    # Lista con los posibles movimientos
    # de la pieza.
    listaPM = posiblesMovimientos

    # Se revisa cada posición posible del Caballo en
    # general y se quitan aquellas en donde hay piezas
    # del mismo color que la del caballo.
    for x in listaPM
      pieza = tablero.getPieza(x.columna, x.renglón)
      if pieza && self.color == pieza.color
        listaPM.delete(x)
      end
    end

    # Se regresa la lista...
    return listaPM
  end

end