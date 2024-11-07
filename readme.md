Esta es una app que transforma .pdf a .txt y puede leer .txt reproduciendolo en audio.

Si se desea agregar nuevos libros, deben agregarse a la directorio books, y dentro una directorio con el nombre del libro con las mismas consideraciones que el autor, y dentro de ésta, directorios, directorios por capitulo, con el nombre "c + el numero del capítulo", y dentro de este, los archivos .txt por cada sección del capitulo con el nombre "s + numero del sección + nombre de seccion sin espacios". Del 1 al 9 en todos los casos, es preferible agregarle un 0 al principio, en especial si tiene mas de 9 secciones o más de 9 capítulos.

Por supuesto, el código puede modificarse para que se ajuste a las necesidades en speaker.rb

---------------------------

Mejoras:
Hacer un ejecutable .deb con ocra, ya que al hacerlo .deb, los usuarios no necesitaran instalar dependencias de forma manual

Que se pueda cargar cualquier archivo del escritorio, no solo el que está por defecto en la app.
que calcule el tiempo que dura cada libro leido con el speaker, y que se pueda calcular cuanto se demoraria en oir el libro si uno oye tanto tiempo o secciones por día.

Agregar un listado de preceptos que se encuentren en el libro en el jardin de la paz.
agregar "ir a la sección anterior" o "cambiar de libro"

Queremos agregar gem "threads" para poder ejecutar acciones mientras se está reproduciendo el audio.

agregar oidor de voz y conversion a .txt

agregar al menu el elegir el capitulo a estudiar y la seccion
