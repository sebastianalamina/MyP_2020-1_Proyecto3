require_relative "../piezas/Alfil"
require_relative "../Posicion"
require_relative "TestPieza"
require_relative "TestMovimientos"
require "test/unit/assertions"
include Test::Unit::Assertions

#Clase para tests de Alfil
class TestAlfil < TestPieza

  #Prueba para el constructor de la pieza Alfil.
  def testConstructor
    columna = rand(1... 8)
    renglón = rand(1... 8)
    mensaje_error = "Algo salió mal en testConstructor"
    begin
      Alfil.new(rand(-8... -1), rand(1... 8), "blanca")
      assert(false, mensaje_error + "[columna]")
    rescue ArgumentError => ae
    end
    begin
      Alfil.new(rand(1... 8), rand(-8... -1, "negra"))
      assert(false, mensaje_error + "[renglón]")      
    rescue ArgumentError => ae
    end
    begin
      Alfil.new(rand(1... 8), rand(1... 8), "roja")
      assert(false, mensaje_error + "[color]")
    rescue ArgumentError => ae
    end
    alfil = Alfil.new(columna, renglón, "blanco")
    assert(alfil.posición == Posicion.new(columna, renglón), "Algo salió mal al iniciar la posición")
  end

  #Prueba el método desplazar de la pieza Alfil. Se prueban movimientos
  #que una pieza Alfil debe poder realizar, así como movimientos no válidos para esta pieza y
  #se prueba que la pieza no salga del tablero.
  def testDesplazar
    i = 4
    while i != 0
      j = 50
      while j != 0
        k = rand(1... 8)
        alfil = Alfil.new(rand(1... 8), rand(1... 8), "blanco")
        case i
        when 4
          TestMovimientos.testDerechaArriba(alfil, k, k)
        when 3
          TestMovimientos.testIzquierdaArriba(alfil, k, k)
        when 2
          TestMovimientos.testDerechaAbajo(alfil, k, k)
        when 1
          TestMovimientos.testIzquierdaAbajo(alfil, k, k)
        end
        j = j -1
      end
      i = i - 1
    end
    self.testDesplazarMovimientosInvalidos
  end

  #Prueba que el método dezplazar de la pieza Alfil no admita movimientos inválidos.
  def testDezplazarMovimientosInvalidos
    mensaje_error = "Algo salió mal en testDesplazarMovimientosInvalidos"
    i = 50
    while i != 0
      begin
        alfil = Alfil.new(rand(1..8), rand(1..8), "blanca")
        TestMovimientos.testDerechaArriba(alfil, rand(5.. 8), rand(1.. 4))
        assert(false, mensaje_error + " de #{alfil} [testDerechaArriba]")
      rescue ArgumentError => ae
      end
      begin
        alfil = Alfil.new(rand(1.. 8), rand(1.. 8), "blanca")
        TestMovimientos.testDerechaAbajo(alfil, rand(1.. 4), rand(5.. 8))
        assert(false, mensaje_error + "#{alfil} [testDerechaAbajo]")
      rescue ArgumentError => ae
      end
      begin
        alfil = Alfil.new(rand(1.. 8), rand(1.. 8), "blanca")
        TestMovimientos.testIzquierdaArriba(alfil, rand(5.. 8), rand(1.. 4))
        assert(false, mensaje_error + "#{alfil} [testIzquierdaArriba]")
      rescue ArgumentError => ae
      end
      begin
        alfil = Alfil.new(rand(1.. 8), rand(1.. 8), "blanca")
        TestMovimientos.testIzquierdaAbajo(alfil, rand(1.. 4), rand(5.. 8))
        assert(false, mensaje_error + "#{alfil} [testIzquierdaAbajo]")
      rescue ArgumentError => ae
      end
      i = i - 1
    end
  end

  #Prueba el método to_s de la pieza Alfil.
  def testTo_s
    columna = rand(1.. 8)
    renglón = rand(1.. 8)
    posición = Posicion.new(columna, renglón)
    alfil_to_s = "Esta pieza blanca (Alfil) se encuentra en la posición #{posición}"
    alfil = Alfil.new(columna, renglón, "blanca")
    assert(alfil_to_s == alfil.to_s, "Algo salió mal en testTo_s de #{alfil}")
  end

end
