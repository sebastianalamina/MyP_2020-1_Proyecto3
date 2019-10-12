# "require" de todas las piezas
x = File.join(__dir__, 'piezas', '*.rb')
Dir[x].each do |file|
  require_relative file
end
# "require" de AjedrezInterfaz.rb (código interfaz).
require_relative './interfaz/AjedrezInterfaz'
require_relative './Tablero'

# El código dentro de este método sólo se ejecuta
# si este archivo se llama desde la terminal (no
# se ejecuta si se requiere en otro archivo).
# Por lo que se toma como el método Main.
if __FILE__ == $0
  interfaz()
end