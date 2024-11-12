loop do
  puts "Bienvenido al menú principal!"
  puts "--------------------------------"
  puts "¿Qué desea hacer?"

  puts "1. Oir algun libro"
  puts "2. Convertir PDF a TXT"
  puts "3. Salir"

  print "Ingrese su opción: "
  option = gets.chomp

  case option
  when "1"
    system("ruby txt_to_speech.rb")
  when "2"
    system("ruby pdf_to_txt.rb")
  when "3"
    puts "¡Adiós!"
    exit
  else
    puts "Opción inválida. Por favor, intente nuevamente."
  end
end
