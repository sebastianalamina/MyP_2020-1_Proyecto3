require_relative "../piezas/Caballo"
require_relative "../Posicion"
require_relative "TestPieza"
require_relative "TestMovimientos"
require "test/unit/assertions"
include Test::Unit::Assertions

#Clase para tests de Caballo
class TestCaballo < TestPieza

  #Prueba para el constructor de la pieza Caballo. 
  def testConstructor
    columna = rand(1... 8)
    renglón = rand(1... 8)
    mensaje_error = "Algo salió mal en testConstructor"
    begin
      Caballo.new(rand(-8... -1), rand(1... 8), "blanca")
      assert(false, mensaje_error + "[columna]")
    rescue ArgumentError => ae
    end
    begin
      Caballo.new(rand(1... 8), rand(-8... -1, "negra"))
      assert(false, mensaje_error + "[renglón]")      
    rescue ArgumentError => ae
    end
    begin
      Caballo.new(rand(1... 8), rand(1... 8), "roja")
      assert(false, mensaje_error + "[color]")
    rescue ArgumentError => ae
    end
    caballo = Caballo.new(columna, renglón, "blanco")
    assert(caballo.posición == Posicion.new(columna, renglón), "Algo salió mal al iniciar la posición")
  end

  #Prueba el método desplazar de la pieza Caballo. Se prueban movimientos
  #que una pieza Caballo debe poder realizar, así como movimientos no válidos para esta pieza y 
  #se prueba que la pieza no salga del tablero.
  def testDesplazar
    i = 8
    while i != 0
      j = 50
      while j != 0
        caballo = Caballo.new(rand(1... 8), rand(1... 8), "blanco")
        case i
        when 8
          TestMovimientos.testDerechaArriba(caballo, 1, 2)
        when 7
          TestMovimientos.testDerechaArriba(caballo, 2, 1)
        when 6
          TestMovimientos.testIzquierdaArriba(caballo, 1, 2)
        when 5
          TestMovimientos.testIzquierdaArriba(caballo, 2, 1)
        when 4
          TestMovimientos.testDerechaAbajo(caballo, 1, 2)
        when 3
          TestMovimientos.testDerechaAbajo(caballo, 2, 1)
        when 2
          TestMovimientos.testIzquierdaAbajo(caballo, 1, 2)
        when 1
          TestMovimientos.testIzquierdaAbajo(caballo, 2, 1)
        end
        j = j - 1
      end
      i = i - 1
    end
    self.testDesplazarMovimientosInvalidos
  end

  #Prueba que el método dezplazar de la pieza Caballo no admita movimientos inválidos.
  def testDezplazarMovimientosInvalidos
    mensaje_error = "Algo salió mal en testDesplazarMovimientosInvalidos"
    i = 50
    while (i != 0)
      begin
        caballo = Caballo.new(rand(1..8), rand(1..8), "blanca")
        TestMovimientos.testDerechaArriba(caballo, rand(3.. 8), rand(3.. 8))
        assert(false, mensaje_error + " de #{caballo} [testDerechaArriba]")
      rescue ArgumentError => ae
      end
      begin
        caballo = Caballo.new(rand(1.. 8), rand(1.. 8), "blanca")
        TestMovimientos.testDerechaAbajo(caballo, rand(1.. 8), rand(3.. 8))
        assert(false, mensaje_error + "#{caballo} [testDerechaAbajo]")
      rescue ArgumentError => ae
      end
      begin
        caballo = Caballo.new(rand(1.. 8), rand(1.. 8), "blanca")
        TestMovimientos.testIzquierdaArriba(caballo, rand(1.. 8), rand(3.. 8))
        assert(false, mensaje_error + "#{caballo} [testIzquierdaArriba]")
      rescue ArgumentError => ae
      end
      begin
        caballo = Caballo.new(rand(1.. 8), rand(1.. 8), "blanca")
        TestMovimientos.testIzquierdaAbajo(caballo, rand(3.. 8), rand(1.. 8))
        assert(false, mensaje_error + "#{caballo} [testIzquierdaAbajo]")
      rescue ArgumentError => ae
      end
      i = i - 1
    end
  end

   #Prueba del método to_s de la pieza Caballo.
  def testTo_s
    columna = rand(1.. 8)
    renglón = rand(1.. 8)
    posición = Posicion.new(columna, renglón)
    caballo_to_s = "Esta pieza blanca (Caballo) se encuentra en la posición #{posición}"
    caballo = Caballo.new(columna, renglón, "blanca")
    assert(caballo_to_s == caballo.to_s, "Algo salió mal en toString de #{caballo}")
  end

end