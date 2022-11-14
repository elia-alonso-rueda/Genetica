script para buscar polimorfismos entre marcadores

*input*: el df de entrada debe tener como columnas, por un lado una con IDs de los individuos y luego tantas columnas como marcadores se vayan a analizar. Meto en esta carpeta un archivo que yo utilicé de input con este script como ejemplo.

*USO DEL SCRIPT*:
Para comprobar polimorfismos, se tienen que poner en list1 y list2 los nombres de los marcadores tal cual y como aparecen en las columnas, si no, no funcionará - recomiendo ponerlos como los índices de las columnas dentro del comando name, tal y como aparece en este script.

Nos devolverá una tabla con aquellos individos en los que todos los alelos de los marcadores lista 1 tengan el mismo valor (0, 1 o 2) y a la vez sean diferentes de la lista 2, que también serán un valor único 0, 1, o 2.

Por ejemplo, los individuos que en la lista 1 de marcadores todos sean 0 y en la lista 2 todos sean 1.

Dentro de la funcion "buscar_marcadores" hay que definir qué alelos (0, 1 o 2) queremos ver para cada lista (en unique(values1) y unique(values2).

