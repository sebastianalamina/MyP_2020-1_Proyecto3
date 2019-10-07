require_relative "../code/piezas/Alfil"
require_relative "../code/Posicion"
require_relative "TestMovimientos"

#Clase para tests de Alfil
class TestAlfil

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
        j--
      end
    i--
    end
  end

  #Prueba el método to_s de la pieza Alfil.
  def testTo_s
    columna = rand(1.. 8)
    renglón = rand(1.. 8)
    posición = Posicion.new(columna, renglón)
    alfil_to_s = "Esta pieza blanca (Alfil) se encuentra en la posición #{posición}"
    alfil = Alfil.new(columna, renglón, "blanca")
    assert(alfil_to_s == alfil.to_s)
  end

end
