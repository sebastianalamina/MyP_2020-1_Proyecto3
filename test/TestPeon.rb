require_relative "../code/piezas/Peon"
require_relative "../code/Posicion"

#Clase para tests de Peón
class TestPeon

    def testConstructor
      columna = rand(1... 8)
      renglón = rand(1... 8)
      mensaje_error = "Algo salió mal en testConstructor"
      begin
        Peon.new(rand(-8... -1), rand(1... 8), "blanca")
        assert(false, mensaje_error + "[columna]")
      rescue Exception => e
      end
      begin
        Peon.new(rand(1... 8), rand(-8... -1, "negra"))
        assert(false, mensaje_error + "[renglón]")      
      rescue Exception => e
      end
      begin
        Peon.new(rand(1... 8), rand(1... 8), "roja")
        assert(false, mensaje_error + "[color]")
      rescue Exception => e
      end
      peon = Peon.new(columna, renglón, "blanco")
      assert(peon.posición == Posicion.new(columna, renglón), "Algo salió mal al iniciar la posición")
    end

    def testDesplazar
      columna = rand(1... 8)
      renglón = rand(1... 8)
      peon = Peon.new(renglón, columna, "blanco")
      while renglón < 8
        renglón++
        peon.desplazar(0, 1)
        assert(peon.posición == Posicion.new(columna, renglón), "Algo salió mal en testDesplazar [inconcistencia de posición]")
      end
      begin
        peon.desplazar(0, 1)
        assert(false, "Algo salió mal en testDesplazar [fuera de tablero]")
      rescue ArgumentError => ae
      end
    end

    def testTo_s
      columna = rand(1.. 8)
      renglón = rand(1.. 8)
      posición = Posicion.new(columna, renglón)
      peon_to_s = "Esta pieza blanca (Peon) se encuentra en la posición #{posición}"
      peon = Peon.new(rand(1.. 8), rand(1.. 8), "blanca")
      assert(peon_to_s == peon.to_s)
    end
end