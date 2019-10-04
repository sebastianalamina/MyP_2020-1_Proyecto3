# "require" de todos los archivos .rb en "code".
x = File.join(__dir__, '..', 'code', '*.rb')
Dir[x].each do |file|
  require_relative file
end

# "require" de todas las piezas .rb en "code/piezas".
x = File.join(__dir__, '..', 'code', 'piezas', '*.rb')
Dir[x].each do |file|
  require_relative file
end

# Método "main" de las pruebas...
if __FILE__ == $0
  puts "Aquí van las pruebas jeje"

end