require_relative "../code/piezas/Torre"
require_relative "../code/Posicion"
require_relative "TestMovimientos"

#Clase para tests de Torre
class TestTorre

  #Prueba para el constructor de la pieza Torre. 
  def testConstructor
    columna = rand(1... 8)
    renglón = rand(1... 8)
    mensaje_error = "Algo salió mal en testConstructor"
    begin
      Torre.new(rand(-8... -1), rand(1... 8), "blanca")
      assert(false, mensaje_error + "[columna]")
    rescue ArgumentError => ae
    end
    begin
      Torre.new(rand(1... 8), rand(-8... -1, "negra"))
      assert(false, mensaje_error + "[renglón]")      
    rescue ArgumentError => ae
    end
    begin
      Torre.new(rand(1... 8), rand(1... 8), "roja")
      assert(false, mensaje_error + "[color]")
    rescue ArgumentError => ae
    end
    torre = Torre.new(columna, renglón, "blanco")
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
          TestMovimientos.testDerechaAbajo(torre, k, 0)
        when 1
          TestMovimientos.testDerechaAbajo(torre, 0, k)
        j--
        end
      end
    i--
    end
  end

end