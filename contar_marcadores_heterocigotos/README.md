**script_90k.R**
- El input de este script son los .RDATA de 90K tanto filtradas como no filtradas (lo de los filtros está explicado en el cuaderno) que preparó Humberto.
- El output son las tablas preparadas para contar en ellas los heterocigotos (codificados con 1) tanto por filas como por columnas con el siguiente script.

**encontrar_heterocigotos.R**
- El input es una tabla con marcadores (columnas) de diferentes individuos (filas) en el que el hetercigoto recesivo es 0, el heterocigoto es 1 y el homocigoto dominante es 2. (cuidado porque el script selecciona los marcadores con un start_with("GID), si los marcadores tienen otro nombre habría que cambiar este criterio de selección!)
- El output son 2 tablas por cada set de datos, tanto filtrado como no filtrado: una tabla donde se ha sumado el numero de heterocigotos por individuo y se ha añadido como una columna al final (suma_heterocigotos_individuos) y otra en la que se ha sumado el numero de heterocigotos por columna y se ha añadido una fila al final (suma_heterocigotos_GID)
