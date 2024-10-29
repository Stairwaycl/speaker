require 'espeak'

# Menú para seleccionar el libro
puts "Seleccione un libro para escuchar:"
puts "1. En el jardín de la paz (Paz-hombres) - Rabino Shalom Arush"
puts "2. Sefer Bereshit - Moshe Rabenu"
puts "3. Kitzur Shuljan Aruj - Rabino Shlomo Ganzfried"

# Obtener la selección del usuario
print "Ingrese el número de su selección: "
seleccion = gets.chomp

case seleccion
when "1"
  ruta_libro = "books/arush/paz-hombres/c9"
  files = Dir.children(ruta_libro).select { |f| f.end_with?('.txt') }.sort
  files.each do |file|
    file_path = File.join(ruta_libro, file)
    text = File.read(file_path)
    speech = ESpeak::Speech.new(text,
      voice: "es",
      speed: 175,
      pitch: 50,
      capital: 25,
      amplitude: 110
    )
    speech.speak
    puts "Presione 'c' para continuar o 's' para salir"
    input = gets.chomp
    if input.downcase == 's'
      break
    end
  end

when "2"
  ruta_libro = "books/moshe-rabenu/bereshit/sefer-bereshit-en.txt"
  text = File.read(ruta_libro)
  secciones = text.scan(/.{1,500}/)
  secciones.each do |seccion|
    speech = ESpeak::Speech.new(seccion,
      voice: "en",
      speed: 175,
      pitch: 35,
      capital: 25,
      amplitude: 110
    )
    speech.speak
    puts "Presione 'c' para continuar o 's' para salir"
    input = gets.chomp
    if input.downcase == 's'
      break
    end
  end

when "3"
  ruta_libro = "books/ganzfried/kitzur-shuljan-arusj/c1.txt"
  text = File.read(ruta_libro)
  secciones = text.scan(/.{1,500}/)
  secciones.each do |seccion|
    speech = ESpeak::Speech.new(seccion, voice: "es", speed: 150, pitch: 40)
    speech.speak
    puts "Presione 'c' para continuar o 's' para salir"
    input = gets.chomp
    if input.downcase == 's'
      break
    end
  end
else
  puts "Selección inválida"
end
