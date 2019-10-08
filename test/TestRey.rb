require_relative "../code/piezas/Rey"
require_relative "../code/Posicion"
require_relative "TestPieza"
require_relative "TestMovimientos"
require "test/unit/assertions"
include Test::Unit::Assertions

#Clase para tests de Rey
class TestRey < TestPieza

      #Prueba para el constructor de la pieza Rey. 
  def testConstructor
    columna = rand(1... 8)
    renglón = rand(1... 8)
    mensaje_error = "Algo salió mal en testConstructor"
    begin
      Rey.new(rand(-8... -1), rand(1... 8), "blanca")
      assert(false, mensaje_error + "[columna]")
    rescue ArgumentError => ae
    end
    begin
      Rey.new(rand(1... 8), rand(-8... -1, "negra"))
      assert(false, mensaje_error + "[renglón]")      
    rescue ArgumentError => ae
    end
    begin
      Rey.new(rand(1... 8), rand(1... 8), "roja")
      assert(false, mensaje_error + "[color]")
    rescue ArgumentError => ae
    end
    rey = Rey.new(columna, renglón, "blanco")
    assert(rey.posición == Posicion.new(columna, renglón), "Algo salió mal al iniciar la posición")
  end

  #Prueba el método desplazar de la pieza Rey. Se prueban movimientos
  #que una pieza rey debe poder realizar, así como movimientos no válidos para esta pieza y 
  #se prueba que la pieza no salga del tablero.
  def testDesplazar
    i = 8
    while i != 0
      j = 50
      while j != 0
        rey = Rey.new(rand(1... 8), rand(1... 8), "blanco")
        case i
        when 8
          TestMovimientos.testDerechaArriba(rey, 1, 0)
        when 7
          TestMovimientos.testDerechaArriba(rey, 0, 1)
        when 6
          TestMovimientos.testIzquierdaAbajo(rey, 1, 0)
        when 5
          TestMovimientos.tesIzquierdaAbajo(rey, 0, 1)
        when 4
          TestMovimientos.testDerechaArriba(rey, 1, 1)
        when 3
          TestMovimientos.testDerechaAbajo(rey, 1, 1)
        when 2
          TestMovimientos.testIzquierdaArriba(rey, 1, 1)
        when 1
          TestMovimientos.testIzquierdaAbajo(rey, 1, 1)
        end
        j = j - 1
      end
    i = i - 1
    end
    self.testDesplazarMovimientosInvalidos
  end

  #Prueba que el método dezplazar de la pieza Rey no admita movimientos inválidos.
  def testDezplazarMovimientosInvalidos
    mensaje_error = "Algo salió mal en testDesplazarMovimientosInvalidos"
    i = 50
    while i != 0
      begin
        rey = Rey.new(rand(1..8), rand(1..8), "blanca")
        TestMovimientos.testDerechaArriba(rey, rand(1.. 8), rand(2.. 8))
        assert(false, mensaje_error + " de #{rey} [testDerechaArriba]")
      rescue ArgumentError => ae
      end
      begin
        rey = Rey.new(rand(1.. 8), rand(1.. 8), "blanca")
        TestMovimientos.testDerechaAbajo(rey, rand(2.. 8), rand(1.. 8))
        assert(false, mensaje_error + "#{rey} [testDerechaAbajo]")
      rescue ArgumentError => ae
      end
      begin
        rey = Rey.new(rand(1.. 8), rand(1.. 8), "blanca")
        TestMovimientos.testIzquierdaArriba(rey, rand(1.. 8), rand(2.. 8))
        assert(false, mensaje_error + "#{rey} [testIzquierdaArriba]")
      rescue ArgumentError => ae
      end
      begin
        rey = Rey.new(rand(1.. 8), rand(1.. 8), "blanca")
        TestMovimientos.testIzquierdaAbajo(rey, rand(2.. 8), rand(1.. 8))
        assert(false, mensaje_error + "#{rey} [testIzquierdaAbajo]")
      rescue ArgumentError => ae
      end
      i = i - 1
    end
  end
  #Prueba del método to_s de la pieza Rey.
  def testTo_s
    columna = rand(1.. 8)
    renglón = rand(1.. 8)
    posición = Posicion.new(columna, renglón)
    rey_to_s = "Esta pieza blanca (Rey) se encuentra en la posición #{posición}"
    rey = Rey.new(columna, renglón, "blanca")
    assert(rey_to_s == rey.to_s, "Algo salió mal en toString de #{rey}")
  end

end