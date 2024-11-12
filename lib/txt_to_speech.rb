require 'espeak' #gema para reproducir texto en voz
require 'pry-byebug' #para buguear

def start
  # Obtener los nombres de los directorios dentro del directorio books y guardarlos en un array
  books_dir = Dir.children('books').sort

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
  selected_book = books_dir[selection - 1] # -1 Debido a que books_dir es un array que comienza en 0
  base_dir = "books/#{selected_book}" # Definimos el directorio base

  # Obtener los capítulos
  chapters = Dir.children(base_dir).select { |d| d.start_with?('c') }.sort

  select_and_play_chapter(base_dir, chapters)
end

def select_and_play_chapter(base_dir, chapters)
  puts "--------------------------------"
  puts "Seleccione un capítulo para escuchar:"
  chapters.each_with_index do |chapter, index|
    puts "#{index + 1}. Capítulo #{chapter.gsub('c', '')}"
  end
  print "Ingrese el número del capítulo: "
  selected_chapter = gets.chomp.to_i
  ruta_chapter = File.join(base_dir, chapters[selected_chapter - 1])
  sections = Dir.children(ruta_chapter).select { |f| f.end_with?('.txt') }.sort
  puts "--------------------------------"
  puts "Seleccione una sección para escuchar:"
  sections.each_with_index do |section, index|
    puts "#{index + 1}. #{section.gsub('.txt', '')}"
  end
  print "Ingrese el número de la sección: "
  selected_section = gets.chomp.to_i
  play_text(base_dir, chapters[selected_chapter - 1], sections, selected_section, "es", chapters)
end

def play_text(base_dir, ruta_chapter, sections, selected_section, voice, chapters)
  index = selected_section - 1

  loop do
    ruta_section = File.join(base_dir, ruta_chapter, sections[index])

    text = File.read(ruta_section)
    speech = ESpeak::Speech.new(text,
      voice: voice,
      speed: 185,
      pitch: 50,
      capital: 25,
      amplitude: 110
    )
    #speed real es 185
    speech.speak
    puts "--------------------------------"
    puts "Ingrese"
    puts "'c' para continuar"
    puts "'s' para volver a los capítulos"
    puts "'r' para reproducir nuevamente"
    print ">"
    input = gets.chomp

    if input.downcase == 's'
      select_and_play_chapter(base_dir, chapters)
    elsif input.downcase == 'r'
      next
    elsif input.downcase == 'c'
      index += 1
      if index >= sections.length
        # Pasar al siguiente capítulo
        current_index = chapters.index(ruta_chapter)
        if current_index < chapters.length - 1
          ruta_chapter = chapters[current_index + 1]
          sections = Dir.children(File.join(base_dir, ruta_chapter)).select { |f| f.end_with?('.txt') }.sort
          index = 0
        else
          select_and_play_chapter(base_dir, chapters)
        end
      end
    end
  end
end

start
