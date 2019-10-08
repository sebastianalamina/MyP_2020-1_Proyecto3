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

end