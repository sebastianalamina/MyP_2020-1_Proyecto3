require_relative "../code/piezas/Peon"
require_relative "../code/Posicion"
require_relative "TestPieza"
require_relative "TestMovimientos"
require "test/unit/assertions"
include Test::Unit::Assertions

#Clase para tests de Peón
class TestPeon < TestPieza

  #Prueba para el constructor de la pieza Peón.
  def testConstructor
    columna = rand(1... 8)
    renglón = rand(2... 8)
    mensaje_error = "Algo salió mal en testConstructor"
    begin
      Peon.new(rand(-8... -1), rand(1... 8), true)
      assert false, mensaje_error + "[columna]"
    rescue ArgumentError => ae
    end
    begin
      Peon.new(rand(1... 8), rand(-8... -1, false))
      assert false, mensaje_error + "[renglón]"     
    rescue ArgumentError => ae
    end
    begin
      Peon.new(rand(1... 8), 1, true)
      assert false, mensaje_error + "[color]"
    rescue ArgumentError => ae
    end
    peon = Peon.new(columna, renglón, true)
    assert peon.posición == Posicion.new(columna, renglón), "Algo salió mal al iniciar la posición"
  end

  #Prueba el método desplazar de la pieza Peón. Se prueban movimientos
  #que una pieza peón debe poder realizar, así como que la pieza no salga del tablero.
  def testDesplazar
    i = 50
    while i != 0
      columna = rand(1... 8)
      renglón = rand(2... 8)
      peon = Peon.new(columna, renglón, true)
      TestMovimientos.testDerechaArriba(peon, 0, 1, true)
      i = i - 1
    end
    i = 50
    #Checa que un peón en el renglón 2 pueda moverse una columna a la derecha y un renglón
    #hacia arriba si el movimiento es válido.
    while i != 0
      columna = rand(1... 8)
      peon = Peon.new(columna, 2, true)
      if columna < 8
        posicion = peon.desplazar(1, 1)
        assert posicion == Posicion.new(columna + 1, 3), "Algo salió mal en testDesplazar de #{peon}"
      end
      i = i - 1
    end
    i = 50
    #Checa que un peón en el renglón 2 pueda moverse una columna a la izquierda y un renglón
    #hacia arriba si el movimiento es válido.
    while i != 0
      columna = rand(1... 8)
      peon = Peon.new(columna, 2, true)
      if columna > 1
        posicion = peon.desplazar(-1, 1)
        assert posicion == Posicion.new(columna - 1, 3)
      end
      i = i - 1
    end
    self.testDesplazarMovimientosInvalidos
  end

  #Prueba que el método dezplazar de la pieza Peón no admita movimientos inválidos.
  def testDesplazarMovimientosInvalidos
    mensaje_error = "Algo salió mal en testDezplazarMovimientosInvalidos"
    i = 50
    while i != 0
      begin
        peon = Peon.new(rand(2..8), rand(2..8), true)
        TestMovimientos.testDerechaArriba(peon, rand(2.. 8), rand(2.. 8), false)
        assert false, mensaje_error + " de #{peon} [testDerechaArriba]"
      rescue ArgumentError => ae
      end
      begin
        peon = Peon.new(rand(2.. 8), rand(2.. 8), true)
        TestMovimientos.testDerechaAbajo(peon, rand(1.. 8), rand(1.. 8), false)
        assert false, mensaje_error + "#{peon} [testDerechaAbajo]"
      rescue ArgumentError => ae
      end
      begin
        peon = Peon.new(rand(2.. 8), rand(2.. 8), true)
        TestMovimientos.testIzquierdaArriba(peon, rand(2.. 8), rand(2.. 8), false)
        assert false, mensaje_error + "#{peon} [testIzquierdaArriba]"
      rescue ArgumentError => ae
      end
      begin
        peon = Peon.new(rand(2.. 8), rand(2.. 8), true)
        TestMovimientos.testIzquierdaAbajo(peon, rand(2.. 8), rand(2.. 8), false)
        assert false, mensaje_error + "#{peon} [testIzquierdaAbajo]"
      rescue ArgumentError => ae
      end
      i = i - 1
    end
  end

  #Prueba el método to_s de la pieza Peón.
  def testTo_s
    columna = rand(1.. 8)
    renglón = rand(2.. 8)
    posición = Posicion.new(columna, renglón)
    peon_to_s = "Esta pieza blanca (Peon) se encuentra en la posición #{posición}."
    peon = Peon.new(columna, renglón, true)
    assert peon_to_s == peon.to_s, "Algo salió mal en testTo_s #{peon}"
  end

end