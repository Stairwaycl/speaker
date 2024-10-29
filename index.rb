loop do
  puts "Bienvenido al menú principal!"
  puts "--------------------------------"

  puts "1. Oír un libro (speaker.rb)"
  puts "2. Convertir PDF a TXT (pdf-reader.rb)"
  puts "3. Salir"

  print "Ingrese su opción: "
  opcion = gets.chomp

  case opcion
  when "1"
    system("ruby speaker.rb")
  when "2"
    system("ruby pdf-reader.rb")
  when "3"
    puts "Adiós!"
    exit
  else
    puts "Opción inválida. Por favor, intente nuevamente."
  end
end
