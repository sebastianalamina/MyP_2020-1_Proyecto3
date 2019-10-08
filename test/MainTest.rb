require_relative "TestPeon"
require_relative "TestTorre"
require_relative "TestCaballo"
require_relative "TestAlfil"
require_relative "TestReina"
require_relative "TestRey"

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

def runTests(tester)
  tester.testConstructor
  tester.testDesplazar
  tester.testTo_s
end

# Método "main" de las pruebas...
if __FILE__ == $0
  testPeon = TestPeon.new
  runTests(testPeon)
  testTorre = TestTorre.new
  runTests(testTorre)
  testCaballo = TestCaballo.new
  runTests(testCaballo)
  testAlfil = TestAlfil.new
  runTests(testAlfil)
  testReina = TestReina.new
  runTests(testReina)
  testRey = TestRey.new
  runTests(testRey)
end