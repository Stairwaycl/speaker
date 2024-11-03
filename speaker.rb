require 'espeak'

# Obtener los nombres de los directorios dentro de books
books_dir = Dir.children('books').select { |d| d != '.' && d != '..' }

# Menú para selectionar el libro
puts "--------------------------------"
puts "Selectione un libro para escuchar:"
books_dir.sort.each_with_index do |libro, index|
  puts "#{index + 1}. #{libro.capitalize}"
end

# Obtener la selección del usuario
print "Ingrese el número de su selección: "
selection = gets.chomp

def reproducir_texto(ruta_base, voice)
  salir = false
  dirs = Dir.children(ruta_base).select { |d| d.start_with?('c') }.sort

  dirs.each do |dir|
    break if salir
    ruta_libro = File.join(ruta_base, dir)
    files = Dir.children(ruta_libro).select { |f| f.end_with?('.txt') }.sort

    files.each do |file|
      break if salir
      file_path = File.join(ruta_libro, file)
      text = File.read(file_path)
      speech = ESpeak::Speech.new(text,
        voice: voice,
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
end

case selection
when "1"
  ruta_base = "books/en-el-jardin-de-la-paz-solo-para-hombres"
  reproducir_texto(ruta_base, "es")

when "2"
  ruta_base = "books/bereshit"
  reproducir_texto(ruta_base, "en")

when "3"
  ruta_base = "books/kitzur-shuljan-arusj"
  reproducir_texto(ruta_base, "es")

else
  puts "Selección inválida"
end
