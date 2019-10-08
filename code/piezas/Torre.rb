require_relative '../Pieza'

# Clase que representa a la pieza Torre.
class Torre < Pieza

  # Inicializador de una Torre.
  # columna:: Columna de la Torre.
  # renglón:: Renglón de la Torre.
  # color:: Color de la Torre (booleano).
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

    # ESTE.
    begin
      x = 1
      7.times do
        listaPM.push( desplazar(x, 0) )
        x += 1
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

    # OESTE.
    begin
      x = -1
      7.times do
        listaPM.push( desplazar(x, 0) )
        x -= 1
      end
    rescue
    end
    
    # Se regresa la lista...
    return listaPM
  end

end