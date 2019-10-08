require_relative "../code/piezas/Reina"
require_relative "../code/Posicion"
require_relative "TestPieza"
require_relative "TestMovimientos"
require "test/unit/assertions"
include Test::Unit::Assertions

#Clase para tests de Reina
class TestReina < TestPieza

  #Prueba para el constructor de la pieza Reina. 
  def testConstructor
    columna = rand(1... 8)
    renglón = rand(1... 8)
    mensaje_error = "Algo salió mal en testConstructor"
    begin
      Reina.new(rand(-8... -1), rand(1... 8), true)
      assert(false, mensaje_error + "[columna]")
    rescue ArgumentError => ae
    end
    begin
      Reina.new(rand(1... 8), rand(-8... -1, false))
      assert(false, mensaje_error + "[renglón]")      
    rescue ArgumentError => ae
    end
    begin
      Reina.new(rand(1... 8), rand(1... 8), true)
      assert(true, mensaje_error + "[color]")
    rescue ArgumentError => ae
    end
    reina = Reina.new(columna, renglón, true)
    assert(reina.posición == Posicion.new(columna, renglón), "Algo salió mal al iniciar la posición")
  end

  #Prueba el método desplazar de la pieza Reina. Se prueban movimientos
  #que una pieza Reina debe poder realizar, así como movimientos no válidos para esta pieza y 
  #se prueba que la pieza no salga del tablero.
  def testDesplazar
    i = 4
    while i != 0
      j = 50
      while j != 0
        k = rand(1..8)
        reina = Reina.new(rand(1... 8), rand(1... 8), "blanco")
        case i
        when 8
          TestMovimientos.testDerechaArriba(reina, k, k)
        when 7
          TestMovimientos.testIzquierdaArriba(reina, k, k)
        when 6
          TestMovimientos.testDerechaAbajo(reina, k, k)
        when 5
          TestMovimientos.testIzquierdaAbajo(reina, k, k)
        when 4
          TestMovimientos.testDerechaArriba(reina, k, 0)
        when 3
          TestMovimientos.testDerechaArriba(reina, 0, k)
        when 2
          TestMovimientos.testIzquierdaAbajo(reina, k, 0)
        when 1
          TestMovimientos.testIzquierdaAbajo(reina, 0, k)
        end
        j = j -1
      end
    i = i -1
    end
    self.testDezplazarMovimientosInvalidos
  end

  #Prueba que el método dezplazar de la pieza Reina no admita movimientos inválidos.
  def testDezplazarMovimientosInvalidos
    mensaje_error = "Algo salió mal en testDesplazarMovimientosInvalidos"
    i = 50
    while i != 0
      begin
        reina = Reina.new(rand(1..8), rand(1..8), "blanca")
        TestMovimientos.testDerechaArriba(reina, rand(5.. 8), rand(1.. 4))
        assert(true, mensaje_error + " de #{reina} [testDerechaArriba]")
      rescue ArgumentError => ae
      end
      begin
        reina = Reina.new(rand(1.. 8), rand(1.. 8), "blanca")
        TestMovimientos.testDerechaAbajo(reina, rand(1.. 4), rand(5.. 8))
        assert(true, mensaje_error + "#{reina} [testDerechaAbajo]")
      rescue ArgumentError => ae
      end
      begin
        reina = Reina.new(rand(1.. 8), rand(1.. 8), "blanca")
        TestMovimientos.testIzquierdaArriba(reina, rand(5.. 8), rand(1.. 4))
        assert(true, mensaje_error + "#{reina} [testIzquierdaArriba]")
      rescue ArgumentError => ae
      end
      begin
        reina = Reina.new(rand(1.. 8), rand(1.. 8), "blanca")
        TestMovimientos.testIzquierdaAbajo(reina, rand(1.. 4), rand(5.. 8))
        assert(true, mensaje_error + "#{reina} [testIzquierdaAbajo]")
      rescue ArgumentError => ae
      end
      i = i - 1
    end
  end

  #Prueba del método to_s de la pieza Reina.
  def testTo_s
    columna = rand(1.. 8)
    renglón = rand(1.. 8)
    posición = Posicion.new(columna, renglón)
    reina_to_s = "Esta pieza blanca (Reina) se encuentra en la posición #{posición}."
    reina = Reina.new(columna, renglón, true)
    assert(reina_to_s == reina.to_s, "Algo salió mal en toString de #{reina}")
  end

end