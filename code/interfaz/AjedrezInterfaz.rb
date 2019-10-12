require_relative './TableroInterfaz'

def interfaz

  # ----- Construcción del tablero de juego -----
  tableroDeJuego = Tablero.new()
  # Renglón 8...
  tableroDeJuego.agregaPieza( Torre.new(1, 8, false) )
  tableroDeJuego.agregaPieza( Rey.new(3, 8, false) )
  tableroDeJuego.agregaPieza( Torre.new(8, 8, false) )
  # Renglón 7...
  tableroDeJuego.agregaPieza( Peon.new(1, 7, false) )
  tableroDeJuego.agregaPieza( Caballo.new(4, 7, false) )
  tableroDeJuego.agregaPieza( Alfil.new(5, 7, false) )
  tableroDeJuego.agregaPieza( Peon.new(7, 7, false) )
  # Renglón 6...
  tableroDeJuego.agregaPieza( Alfil.new(3, 6, false) )
  tableroDeJuego.agregaPieza( Peon.new(8, 6, false) )
  # Renglón 5...
  tableroDeJuego.agregaPieza( Peon.new(2, 5, false) )
  tableroDeJuego.agregaPieza( Caballo.new(4, 5, false) )
  tableroDeJuego.agregaPieza( Peon.new(6, 5, false) )
  # Renglón 4...
  tableroDeJuego.agregaPieza( Peon.new(3, 4, true) )
  tableroDeJuego.agregaPieza( Peon.new(4, 4, true) )
  # Renglón 3...
  tableroDeJuego.agregaPieza( Reina.new(4, 3, true) )
  tableroDeJuego.agregaPieza( Caballo.new(6, 3, true) )
  tableroDeJuego.agregaPieza( Alfil.new(7, 3, true) )
  # Renglón 2...
  tableroDeJuego.agregaPieza( Peon.new(2, 2, true) )
  tableroDeJuego.agregaPieza( Peon.new(6, 2, true) )
  tableroDeJuego.agregaPieza( Peon.new(7, 2, true) )
  tableroDeJuego.agregaPieza( Peon.new(8, 2, true) )
  # Renglón 1...
  tableroDeJuego.agregaPieza( Torre.new(1, 1, true) )
  tableroDeJuego.agregaPieza( Rey.new(7, 1, true) )

  # ----- Creación del tablero de interfaz -----
  tab = TableroInterfaz.new(tableroDeJuego)

  # Interfaz con Shoes...
  Shoes.app(width: 420, height: 420) do

    # Diccionario que, dada una columna y un renglón,
    # nos devolverá un rectángulo de la interfaz.
    diccionario = {}

    # Por cada casilla 'c' en la lista de casillas
    # del tablero de interfaz...
    for c in tab.casillas
      # Se pinta blanco o café cada rectángulo (tablero)...
      fill (c.color == 0 ? "#320" : "#fff")
      cuadro = rect(left: c.x,
                    top: c.y,
                    width: CasillaInterfaz.tamano)
      # Se agregan piezas correspondientes...
      src = "interfaz/img/#{c.getImage}"
      imagen = image(src,
                    left: c.x,
                    top: c.y)
      # Se almacenan los rectángulos para modificarlos después...
      diccionario[[c.columna, c.renglon]] = cuadro
    end

    # Por cada click en pantalla...
    click do |button, x, y|
      # Se borra cualquier otro click anterior...
      for c in tab.casillas
        diccionario[[c.columna, c.renglon]].fill = (c.color == 0 ? "#320" : "#fff")
      end
      # Se dibujan los posibles movimientos de la pieza seleccionada...
      for c in tab.casillas
        if c.inside?(x, y)
          pieza = tableroDeJuego.getPieza(c.columna, c.renglon)
          if pieza
            diccionario[[c.columna, c.renglon]].fill = "#733"
            for pos in pieza.posiblesMovimientosTablero(tableroDeJuego)
              diccionario[[pos.columna, pos.renglón]].fill = "#173"
            end
          end
        end
      end
    end
    
  end # <- Fin de Shoes.app()
end # <- Fin de interfaz()