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
    assert(peon.posición == Posicion.new(columna, renglón), "Algo salió mal al iniciar la posición")

  #Prueba el método desplazar de la pieza Alfil. Se prueban movimientos
  #que una pieza Alfil debe poder realizar, así como movimientos no válidos para esta pieza y 
  #se prueba que la pieza no salga del tablero.
  def testDesplazar
    i = 4
    while i != 0
      j = 50
      while j != 0
        k = rand(1... 8)
        l = rand(1... 8)
        alfin = Alfin.new(rand(1... 8), rand(1... 8), "blanco")
        case i
        when 4
          TestMovimientos.testDerechaArriba(alfil, k, l)
        when 3
          TestMovimientos.testIzquierdaArriba(alfin, k, l)
        when 2
          TestMovimientos.testDerechaAbajo(alfin, k, l)
        when 1
          TestMovimientos.testIzquierdaAbajo(alfil, k, l)
        j--
      end
    i--
    end
  end    

end
