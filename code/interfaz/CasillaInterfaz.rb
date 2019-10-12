# Clase que representa una casilla en la interfaz.
class CasillaInterfaz

  # Métodos getter para la casilla.
  attr_reader :renglon, :columna, :color, :x, :y

  # Tamaño de las casillas
  @@tamaño = 40

  # Margen a partir del cual se "dibujan" las casillas
  @@margen = 50

  # Inicializador de una casilla.
  # columna:: Columna de la casilla (número del 1 al 8).
  # renglon:: Renglón de la casilla (número del 1 al 8).
  # color:: Color de la casilla (en hexadecimal de 3 dígitos)
  def initialize(columna, renglon, color, pieza)
    self.renglon = renglon
    self.columna = columna
    self.color = color
    @pieza = pieza
    getImage
    getXandY
  end

  # Método getter para el tamaño de las casillas.
  def self.tamano
    return @@tamaño
  end

  # Posiciones 'x' y 'y' en pantalla para cada casilla.
  private def getXandY
    @x = @@margen + (@@tamaño * (self.columna-1))
    @y = (@@margen + (@@tamaño * 8)) - (@@tamaño * self.renglon)
  end

  # Nos dice si los valores 'x' y 'y' se
  # encuentran dentro de la casilla.
  # x:: Valor en el eje X.
  # y:: Valor en el eje Y.
  def inside?(x, y)
    return x > @x && x < (@x + @@tamaño) && y > @y && y < (@y + @@tamaño)
  end

  # Método setter para el renglon.
  # renglon:: Renglón nuevo (entero entre 1 y 8).
  def renglon=(renglon)
    if (renglon >= 1 && renglon <= 8)
      @renglon = renglon
    else
      raise ArgumentError, "El renglon tiene que ser " +
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

  # Método setter para el color.
  # color:: Color nuevo (entero entre 0 y 4095, es
  # decir, entre los hexadecimales #000 y #FFF).
  def color=(color)
    if (color >= 0 && color <= 4095)
      @color = color
    else
      raise ArgumentError, "El color de una casilla tiene que ser " +
                            "un valor (decimal) entre 0 y 4095."
    end
  end

  # Devuelve el nombre de la imagen de la pieza
  # que se encuentra en la casilla.
  def getImage
    case @pieza.class.name
    when "Peon"
      if !@pieza.color
        return "peon_negro.png"
      else
        return "peon_blanco.png"
      end
    when "Caballo"
      if !@pieza.color
        return "caballo_negro.png"
      else
        return "caballo_blanco.png"
      end
    when "Reina"
      if !@pieza.color
        return "reina_negra.png"
      else
        return "reina_blanca.png"
      end
    when "Rey"
      if !@pieza.color
        return "rey_negro.png"
      else
        return "rey_blanco.png"
      end
    when "Alfil"
      if !@pieza.color
        return "alfil_negro.png"
      else
        return "alfil_blanco.png"
      end
    when "Torre"
      if !@pieza.color
        return "torre_negra.png"
      else
        return "torre_blanca.png"
      end
    end
    return ""
  end

end