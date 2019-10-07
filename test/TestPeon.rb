require_relative "../code/piezas/Peon"
require_relative "../code/Posicion"
require_relative "TestMovimientos"

#Clase para tests de Peón
class TestPeon

  #Prueba para el constructor de la pieza Peón.
  def testConstructor
    columna = rand(1... 8)
    renglón = rand(1... 8)
    mensaje_error = "Algo salió mal en testConstructor"
    begin
      Peon.new(rand(-8... -1), rand(1... 8), "blanca")
      assert(false, mensaje_error + "[columna]")
    rescue ArgumentError => ae
    end
    begin
      Peon.new(rand(1... 8), rand(-8... -1, "negra"))
      assert(false, mensaje_error + "[renglón]")      
    rescue ArgumentError => ae
    end
    begin
      Peon.new(rand(1... 8), rand(1... 8), "roja")
      assert(false, mensaje_error + "[color]")
    rescue ArgumentError => ae
    end
    peon = Peon.new(columna, renglón, "blanco")
    assert(peon.posición == Posicion.new(columna, renglón), "Algo salió mal al iniciar la posición")
  end

  #Prueba el método desplazar de la pieza Peón. Se prueban movimientos
  #que una pieza peón debe poder realizar, así como movimientos no válidos para esta pieza y 
  #se prueba que la pieza no salga del tablero.
  def testDesplazar
    i = 10
    while i != 0
      columna = rand(1... 8)
      renglón = rand(1... 8)
      peon = Peon.new(renglón, columna, "blanco")
      TestMovimientos.testDerechaArriba(peon, 0, 1)
      i--
    end
  end

  #Prueba el método to_s de la pieza Peón.
  def testTo_s
    columna = rand(1.. 8)
    renglón = rand(1.. 8)
    posición = Posicion.new(columna, renglón)
    peon_to_s = "Esta pieza blanca (Peon) se encuentra en la posición #{posición}"
    peon = Peon.new(rand(1.. 8), rand(1.. 8), "blanca")
    assert(peon_to_s == peon.to_s)
  end

end