require_relative './Posicion'

# Clase que representa una pieza del ajedrez.
class Pieza

  # Método getter para la posición.
  attr_reader :posición

  # Método getter para el color.
  attr_reader :color

  # Inicializador de una pieza. La crea e indica
  # en qué lugar se encuentra y de qué color es.
  # columna:: Columna en la que se encontrará la pieza.
  # renglón:: Renglón en el que se encontrará la pieza.
  # color:: Color que tendrá la pieza (booleano).
  def initialize(columna, renglón, color)
    @posición = Posicion.new(columna, renglón)
    @color = color
  end

  # Devuelve una lista con todos los posibles
  # movimientos de la pieza.
  def posiblesMovimientos
    raise "Método sin implementación; las clases " +
          "hijas deben implementarlo."
  end

  # Devuelve la posición de la pieza desplazada "x" lugares
  # horizontalmente y "y" lugares verticalmente.
  # x:: Número de columnas por desplazar.
  # y:: Número de renglones por desplazar.
  def desplazar(x, y)
    a = @posición.columna + x
    b = @posición.renglón + y
    return Posicion.new(a, b)
  end

  # Método to_s de las piezas.
  def to_s
    # Color de la pieza...
    c = @color ? "blanca" : "negra"

    # Construcción del string...
    # NOTA: como cada pieza (Caballo, Reina, Rey, etc.) llamará a este
    # método por su cuenta, self.class no devuelve "Pieza" si no la
    # clase de correspondiente a la pieza que llame el método...
    s = "Esta pieza #{c} (#{self.class}) se encuentra en "
    s += "la posición #{@posición}."
    return s
  end

end