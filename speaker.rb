require 'espeak'

# Menú para seleccionar el libro
puts "Seleccione un libro para escuchar:"
puts "1. En el jardín de la paz - Rabino Shalom Arush"
puts "2. Sefer Bereshit - Moshe Rabenu"
puts "3. Kitzur Shuljan Aruj - Rabino Shlomo Ganzfried"

# Obtener la selección del usuario
print "Ingrese el número de su selección: "
seleccion = gets.chomp

case seleccion
when "1"
  ruta_base = "books/arush/paz-hombres"
  dirs = Dir.children(ruta_base).select { |d| d.start_with?('c') }.sort
  salir = false

  dirs.each do |dir|
    break if salir
    ruta_libro = File.join(ruta_base, dir)
    files = Dir.children(ruta_libro).select { |f| f.end_with?('.txt') }.sort

    files.each do |file|
      break if salir
      file_path = File.join(ruta_libro, file)
      text = File.read(file_path)
      speech = ESpeak::Speech.new(text,
        voice: "es",
        speed: 175,
        pitch: 50,
        capital: 25,
        amplitude: 110
      )

      loop do
        speech.speak
        puts "Presione 'c' para continuar, 's' para salir o 'r' para reproducir nuevamente"
        input = gets.chomp
        if input.downcase == 's'
          salir = true
          break
        elsif input.downcase == 'r'
          next
        elsif input.downcase == 'c'
          break
        end
      end
    end
  end
  exit if salir

when "2"
  ruta_base = "books/moshe-rabenu/bereshit/c1"
  files = Dir.children(ruta_base).select { |f| f.end_with?('.txt') }.sort
  salir = false

  files.each do |file|
    break if salir
    file_path = File.join(ruta_base, file)
    text = File.read(file_path)
    palabras = text.scan(/\b\w+\b/)
    indice = 0
    tamano_bloque = 50

    while indice < palabras.length
      break if salir
      bloque = palabras[indice...[indice + tamano_bloque, palabras.length].min].join(" ")
      speech = ESpeak::Speech.new(bloque,
        voice: "en",
        speed: 175,
        pitch: 35,
        capital: 25,
        amplitude: 110
      )

      loop do
        speech.speak
        puts "Presione 'c' para continuar, 's' para salir o 'r' para reproducir nuevamente"
        input = gets.chomp
        if input.downcase == 's'
          salir = true
          break
        elsif input.downcase == 'r'
          next
        elsif input.downcase == 'c'
          break
        end
      end
      indice += tamano_bloque
    end
  end
  exit if salir

when "3"
  ruta_base = "books/ganzfried/kitzur-shuljan-arusj/c1"
  files = Dir.children(ruta_base).select { |f| f.end_with?('.txt') }.sort
  salir = false

  files.each do |file|
    break if salir
    file_path = File.join(ruta_base, file)
    text = File.read(file_path)
    speech = ESpeak::Speech.new(text,
      voice: "es",
      speed: 150,
      pitch: 40
    )

    loop do
      speech.speak
      puts "Presione 'c' para continuar, 's' para salir o 'r' para reproducir nuevamente"
      input = gets.chomp
      if input.downcase == 's'
        salir = true
        break
      elsif input.downcase == 'r'
        next
      elsif input.downcase == 'c'
        break
      end
    end
  end
  exit if salir

else
  puts "Selección inválida"
end
