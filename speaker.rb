require 'espeak'

# Obtener los nombres de los directorios dentro de books
books_dir = Dir.children('books').select { |d| d != '.' && d != '..' }.sort

# Menú para selectionar el book
puts "--------------------------------"
puts "Selectione un libro para escuchar:"
books_dir.each_with_index do |book, index|
  puts "#{index + 1}. #{book.capitalize}"
end

# Obtener la selección del usuario
print "Ingrese el número de su selección: "
selection = gets.chomp.to_i

def play_text(ruta_base, voice)
  go_to_menu = false
  dirs = Dir.children(ruta_base).select { |d| d.start_with?('c') }.sort

  dirs.each do |dir|
    break if go_to_menu
    ruta_book = File.join(ruta_base, dir)
    files = Dir.children(ruta_book).select { |f| f.end_with?('.txt') }.sort

    files.each do |file|
      break if go_to_menu
      file_path = File.join(ruta_book, file)
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
        puts "Ingrese"
        puts "'c' para continuar"
        puts "'s' para ir al menú principal"
        puts "'r' para reproducir nuevamente"
        print ">"
        input = gets.chomp
        if input.downcase == 's'
          go_to_menu = true
          break
        elsif input.downcase == 'r'
          next
        elsif input.downcase == 'c'
          break
        end
      end
    end
  end
  exit if go_to_menu
end

# Obtener el nombre del libro seleccionado
libro_seleccionado = books_dir[selection - 1]
ruta_base = "books/#{libro_seleccionado}"

play_text(ruta_base, "es")
