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
  # Lista de archivos .txt en el directorio, ordenados alfabéticamente
  files = Dir.children(ruta_libro).select { |f| f.end_with?('.txt') }.sort
  files.each do |file|
    file_path = File.join(ruta_libro, file)
    text = File.read(file_path)
    speech = ESpeak::Speech.new(text, voice: "es", speed: 200, pitch: 35)
    speech.speak
  end
when "2"
  ruta_libro = "books/moshe-rabenu/bereshit/sefer-bereshit-en.txt"
  text = File.read(ruta_libro)

  # Dividir el texto en secciones de 500 caracteres
  secciones = text.scan(/.{1,500}/)

  secciones.each do |seccion|
    speech = ESpeak::Speech.new(seccion, voice: "en", speed: 200, pitch: 35)
    speech.speak
  end
when "3"
  ruta_libro = "books/ganzfried/kitzur-shuljan-arusj/c1.txt"
  text = File.read(ruta_libro)

  # Dividir el texto en secciones de 500 caracteres
  secciones = text.scan(/.{1,500}/)

  secciones.each do |seccion|
    speech = ESpeak::Speech.new(seccion, voice: "es", speed: 150, pitch: 40)
    speech.speak
  end
else
  puts "Selección inválida"
end
