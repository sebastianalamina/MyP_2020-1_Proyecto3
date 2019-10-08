require_relative "../code/Pieza"
require_relative "../code/Posicion"
require "test/unit/assertions"
include Test::Unit::Assertions

class TestMovimientos
  
  #Método para probar los movimientos compuestos por saltos hacia la derecha y/o hacia arriba
  #de diferentes magnitudes.
  def self.testDerechaArriba(pieza, saltos_derecha, saltos_arriba)
    columna = pieza.posición.columna
    renglon = pieza.posición.renglón
    while (saltos_derecha <= 8 - columna) && (saltos_arriba <= 8 - renglon)
      columna += saltos_derecha
      renglon += saltos_arriba
      begin  
        nueva_posicion = pieza.desplazar(saltos_derecha, saltos_arriba)
        assert(nueva_posicion == Posicion.new(columna, renglon), "Algo salió mal en testDerechaArriba de #{pieza.class} [inconsistencia]")
      rescue ArgumentError => ae
        raise ArgumentError, "Algo salió mal [posición válida, marcada como inválida]"
      end
    end
    begin
      pieza.desplazar(saltos_derecha, saltos_arriba)
      assert(false, "Algo salió mal en testDerechaArriba de #{pieza.class} [fuera de tablero]")
    rescue ArgumentError => ae
    end
  end

  #Método para probar los movimientos compuestos por saltos hacia la izquierda y/o hacia arriba
  #de diferentes magnitudes.
  def self.testIzquierdaArriba(pieza, saltos_izquierda, saltos_arriba)
    columna = pieza.posición.columna
    renglon = pieza.posición.renglón
    while (saltos_izquierda <= columna - 1) && (saltos_arriba <= 8 - renglon)
      columna -= saltos_izquierda
      renglon += saltos_arriba
      begin  
        nueva_posicion = pieza.desplazar(saltos_derecha, saltos_arriba)
        assert(nueva_posicion == Posicion.new(columna, renglon), "Algo salió mal en testDerechaArriba de #{pieza.class} [inconsistencia]")
      rescue ArgumentError => ae
        raise ArgumentError, "Algo salió mal [posición válida, marcada como inválida]"
      end
    end
    begin
      pieza.desplazar(-saltos_izquierda, saltos_arriba)
      assert(false, "Algo salió mal en testIzquierdaArriba de #{pieza.class} [fuera de tablero]")
    rescue ArgumentError => ae
    end
  end

  #Método para probar los movimientos compuestos por saltos hacia la derecha y/o hacia abajo
  #de diferentes magnitudes.
  def self.testDerechaAbajo(pieza, saltos_derecha, saltos_abajo)
    columna = pieza.posición.columna
    renglon = pieza.posición.renglón
    while (saltos_derecha <= 8 - columna) && (saltos_abajo <= renglon - 1)
      columna += saltos_derecha
      renglon -= saltos_abajo
      begin  
        nueva_posicion = pieza.desplazar(saltos_derecha, saltos_arriba)
        assert(nueva_posicion == Posicion.new(columna, renglon), "Algo salió mal en testDerechaArriba de #{pieza.class} [inconsistencia]")
      rescue ArgumentError => ae
        raise ArgumentError, "Algo salió mal [posición válida, marcada como inválida]"
      end
    end
    begin
      pieza.desplazar(saltos_derecha, -saltos_abajo)
      assert(false, "Algo salió mal en testDerechaAbajo de #{pieza.class} [fuera de tablero]")
    rescue ArgumentError => ae
    end
  end

  #Mètodo para probar los movimientos compuestos hacia la izquierda y/o hacia abajo
  #de diferentes magnitudes.
  def self.testIzquierdaAbajo(pieza, saltos_izquierda, saltos_abajo)
    columna = pieza.posición.columna
    renglon = pieza.posición.renglón
    while (saltos_izquierda <= columna - 1) && (saltos_abajo <= renglon - 1)
      columna -= saltos_izquierda
      renglon -= saltos_abajo
      begin  
        nueva_posicion = pieza.desplazar(saltos_derecha, saltos_arriba)
        assert(nueva_posicion == Posicion.new(columna, renglon), "Algo salió mal en testDerechaArriba de #{pieza.class} [inconsistencia]")
      rescue ArgumentError => ae
        raise ArgumentError, "Algo salió mal [posición válida, marcada como inválida]"
      end
    end
    begin
      pieza.desplazar(-saltos_izquierda, -saltos_abajo)
      assert(false, "Algo salió mal en testIzquierdaAbajo de #{pieza.class} [fuera de tablero]")
    rescue ArgumentError => ae
    end
  end

end

