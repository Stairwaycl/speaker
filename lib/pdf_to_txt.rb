require 'pdf/reader'
require 'tty-prompt'

class PdfToTxt
  def initialize(pdf_file)
    @pdf_file = pdf_file
  end

  def convert_to_txt
    reader = PDF::Reader.new(@pdf_file)
    texto = ""

    reader.pages.each do |page|
      texto += page.text
    end

    texto
  end

  def save_to_file(txt_file)
    File.open(txt_file, 'w') do |f|
      f.write(convert_to_txt)
    end
  end
end

prompt = TTY::Prompt.new

pdf_file = prompt.ask('Ingrese la ruta del archivo PDF:', default: './archivo.pdf')
book_title = prompt.ask('Ingrese el título del libro:')

converter = PdfToTxt.new(pdf_file)

if !File.exist?(pdf_file)
  puts "Error: El archivo #{pdf_file} no existe."
  exit
else
  # Crea el directorio para el libro si no existe
  book_dir = "books/#{book_title}"
  Dir.mkdir(book_dir) unless Dir.exist?(book_dir)

  # Genera el nombre del archivo TXT. Por defecto es c01 porque los capitulos se separaran manualmente
  txt_file = "#{book_dir}/c01.txt"

  converter.save_to_file(txt_file)

  puts "Conversión realizada con éxito. Archivo TXT generado: #{txt_file}"
end
