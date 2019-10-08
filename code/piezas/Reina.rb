require_relative '../Pieza'

# Clase que representa a la pieza Reina.
class Reina < Pieza

  # Inicializador de una Reina.
  # columna:: Columna de la Reina.
  # renglón:: Renglón de la Reina.
  # color:: Color de la Reina (booleano).
  def initialize(columna, renglón, color)
    super(columna, renglón, color);
  end

  def posiblesMovimientos
    # Lista con los posibles movimientos
    # de la pieza.
    listaPM = []

    # NORTE.
    begin
      y = 1
      7.times do
        listaPM.push( desplazar(0, y) )
        y += 1
      end
    rescue
    end

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

    # ESTE.
    begin
      x = 1
      7.times do
        listaPM.push( desplazar(x, 0) )
        x += 1
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

    # SUR.
    begin
      y = -1
      7.times do
        listaPM.push( desplazar(0, y) )
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

    # OESTE.
    begin
      x = -1
      7.times do
        listaPM.push( desplazar(x, 0) )
        x -= 1
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

end