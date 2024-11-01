Esta es una app que transforma .pdf a .txt y puede leer .txt reproduciendolo en audio.

Si se desea agregar nuevos libros, deben agregarse a la carpeta books, y dentro debe hacerse una carpeta con el nombre del autor (preferiblemente en minuscula y sin espacios), y dentro del nombre del autor, una carpeta con el nombre del libro con las mismas consideraciones que el autor, y dentro de ésta, carpetas, carpetas por capitulo, con el nombre "c + el numero del capítulo", y dentro de este, los archivos .txt por cada sección del capitulo con el nombre "s + numero del sección + nombre de seccion sin espacios". Del 1 al 9 en todos los casos, es preferible agregarle un 0 al principio, en especial si tiene mas de 9 secciones o más de 9 capítuos.

Por supuesto, el código puede modificarse para que se ajuste a las necesidades en speaker.rb

---------------------------


Al terminar, la idea es hacer un ejecutable .deb con ocra, ya que al hacerlo .deb, los usuarios no necesitaran instalar dependencias de forma manual

además, la idea es que se pueda cargar cualquier archivo del escritorio, no solo el que está por defecto en la app.

Hay que agregar en pdf-reader y en speaker, volver al index en un input


Sí, es posible descargar un PDF desde la terminal utilizando el comando wget o curl.
Opción 1: wget
Bash
wget https://ejemplo.com/archivo.pdf
Opción 2: curl
Bash
curl -O https://ejemplo.com/archivo.pdf


Convenios de Nomenclatura
feature/: Para características nuevas.
fix/: Para correcciones de errores.

Mejoras:

que calcule el tiempo que dura cada libro leidoc on el speaker, y que se pueda calcular cuanto se demoraria en leer el libro si uno lee tanto tiempo por día.

además, agregar un listado de preceptos que se encuentren en el libroen el jardin de la paz.

Está funcionando bien en el jardín de la paz, pero los demás libros no he revisado, ya que su estructura con los dir es diferente.
