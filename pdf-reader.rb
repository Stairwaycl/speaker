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
txt_file = prompt.ask('Ingrese el nombre del archivo TXT:', default: 'archivo.txt')

converter = PdfToTxt.new(pdf_file)

if !File.exist?(pdf_file)
  puts "Error: El archivo #{pdf_file} no existe."
  exit
end

converter.save_to_file(txt_file)

puts "Conversión realizada con éxito. Archivo TXT generado: #{txt_file}"
