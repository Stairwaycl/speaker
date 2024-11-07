require 'espeak'

# Obtener los nombres de los directorios dentro de books
books_dir = Dir.children('books').select { |d| d != '.' && d != '..' }.sort

# Menú para seleccionar el libro
puts "--------------------------------"
puts "Seleccione un libro para escuchar:"
books_dir.each_with_index do |book, index|
  puts "#{index + 1}. #{book.capitalize}"
end

# Obtener la selección del usuario
print "Ingrese el número de su selección: "
selection = gets.chomp.to_i

# Obtener el nombre del libro seleccionado
selected_book = books_dir[selection - 1]
ruta_base = "books/#{selected_book}"

# Obtener los capítulos del libro seleccionado
chapters = Dir.children(ruta_base).select { |d| d.start_with?('c') }.sort


def seleccionar_capitulo(ruta_base, chapters)
  puts "--------------------------------"
  puts "Seleccione un capítulo para escuchar:"
  chapters.each_with_index do |chapter, index|
    puts "#{index + 1}. Capítulo #{chapter.gsub('c', '')}"
  end
  print "Ingrese el número del capítulo: "
  selected_chapter = gets.chomp.to_i
  ruta_chapter = File.join(ruta_base, chapters[selected_chapter - 1])
  sections = Dir.children(ruta_chapter).select { |f| f.end_with?('.txt') }.sort
  puts "--------------------------------"
  puts "Seleccione una sección para escuchar:"
  sections.each_with_index do |section, index|
    puts "#{index + 1}. #{section.gsub('.txt', '')}"
  end
  print "Ingrese el número de la sección: "
  selected_section = gets.chomp.to_i
  play_text(ruta_base, chapters[selected_chapter - 1], sections, selected_section, "es", chapters)
end

def play_text(ruta_base, ruta_chapter, sections, selected_section, voice, chapters)
  ruta_section = File.join(ruta_base, ruta_chapter, sections[selected_section - 1])

  loop do
    text = File.read(ruta_section) # Vuelve a leer el archivo aquí
    speech = ESpeak::Speech.new(text,
      voice: voice,
      speed: 185,
      pitch: 50,
      capital: 25,
      amplitude: 110
    )
    speech.speak
    puts "--------------------------------"
    puts "Ingrese"
    puts "'c' para continuar"
    puts "'s' para volver a los capítulos"
    puts "'r' para reproducir nuevamente"
    print ">"
    input = gets.chomp
    if input.downcase == 's'
      seleccionar_capitulo(ruta_base, chapters)
    elsif input.downcase == 'r'
      next
    elsif input.downcase == 'c'
      break
    end
  end
end

seleccionar_capitulo(ruta_base, chapters)
