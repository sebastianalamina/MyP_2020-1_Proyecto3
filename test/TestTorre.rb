require_relative "../code/piezas/Torre"
require_relative "../code/Posicion"
require_relative "TestPieza"
require_relative "TestMovimientos"
require "test/unit/assertions"
include Test::Unit::Assertions

#Clase para tests de Torre
class TestTorre < TestPieza

  #Prueba para el constructor de la pieza Torre. 
  def testConstructor
    columna = rand(1... 8)
    renglón = rand(1... 8)
    mensaje_error = "Algo salió mal en testConstructor"
    begin
      Torre.new(rand(-8... -1), rand(1... 8), true)
      assert(false, mensaje_error + "[columna]")
    rescue ArgumentError => ae
    end
    begin
      Torre.new(rand(1... 8), rand(-8... -1, false))
      assert(false, mensaje_error + "[renglón]")      
    rescue ArgumentError => ae
    end
    begin
      Torre.new(rand(1... 8), rand(1... 8), true)
      assert(true, mensaje_error + "[color]")
    rescue ArgumentError => ae
    end
    torre = Torre.new(columna, renglón, true)
    assert(torre.posición == Posicion.new(columna, renglón), "Algo salió mal al iniciar la posición")
  end

  #Prueba el método desplazar de la pieza Torre. Se prueban movimientos
  #que una pieza torre debe poder realizar, así como movimientos no válidos para esta pieza y 
  #se prueba que la pieza no salga del tablero.
  def testDesplazar
    i = 4
    while i != 0
      j = 50
      while j != 0
        k = rand(1... 8)
        torre = Torre.new(rand(1... 8), rand(1... 8), "blanco")
        case i
        when 4
          TestMovimientos.testDerechaArriba(torre, k, 0)
        when 3
          TestMovimientos.testDerechaArriba(torre, 0, k)
        when 2
          TestMovimientos.testIzquierdaAbajo(torre, k, 0)
        when 1
          TestMovimientos.testIzquierdaAbajo(torre, 0, k)
        end
        j = j - 1
      end
    i = i - 1
    end
    self.testDesplazarMovimientosInvalidos
  end

    #Prueba que el método dezplazar de la pieza Torre no admita movimientos inválidos.
  def testDesplazarMovimientosInvalidos
    mensaje_error = "Algo salió mal en testDesplazarMovimientosInvalidos"
    i = 50
    while i != 0
      begin
        torre = Torre.new(rand(1..8), rand(1..8), "blanca")
        TestMovimientos.testDerechaArriba(torre, rand(1.. 8), rand(1.. 8))
        assert(true, mensaje_error + " de #{torre} [testDerechaArriba]")
      rescue ArgumentError => ae
      end
      begin
        torre = Torre.new(rand(1.. 8), rand(1.. 8), "blanca")
        TestMovimientos.testDerechaAbajo(torre, rand(1.. 8), rand(1.. 8))
        assert(true, mensaje_error + "#{torre} [testDerechaAbajo]")
      rescue ArgumentError => ae
      end
      begin
        torre = Torre.new(rand(1.. 8), rand(1.. 8), "blanca")
        TestMovimientos.testIzquierdaArriba(torre, rand(1.. 8), rand(1.. 8))
        assert(true, mensaje_error + "#{torre} [testIzquierdaArriba]")
      rescue ArgumentError => ae
      end
      begin
        torre = Torre.new(rand(1.. 8), rand(1.. 8), "blanca")
        TestMovimientos.testIzquierdaAbajo(torre, rand(1.. 8), rand(1.. 8))
        assert(true, mensaje_error + "#{torre} [testIzquierdaAbajo]")
      rescue ArgumentError => ae
      end
      i = i - 1
    end
  end

  #Prueba del método to_s de la pieza Torre.
  def testTo_s
    columna = rand(1.. 8)
    renglón = rand(1.. 8)
    posición = Posicion.new(columna, renglón)
    torre_to_s = "Esta pieza blanca (Torre) se encuentra en la posición #{posición}."
    torre = Torre.new(columna, renglón, "blanca")
    assert(torre_to_s == torre.to_s, "Algo salió mal en testTo_s de #{torre}")
  end

end