TRIGO BLANDO

Con el scrip intervalos.R se obtienen los intervalos donde se encuentran los marcadors (por desequilibrio de ligamiento). Es importante que la carpeta en la que se ejecute el scrip esté incluido el archivo "matriz LD TASSEL". Subo ese archivo como un zip porque es un archivo grande y github no me dejaba subirlo, así que lo he comprimido.

En intervalos_TB_Bonferroni.R metemos el output del archivo Intervalos.R y pondrá un nombre diferente a cada región. Con este archivo también, una vez se tengan los genes que hay en cada región (con anotacionesTB.R en la carpeta anotaciones) podemos añadirle al archivo una columna con el numero de genes que hay en cada región. Este script también se puede usar para hacerlo con archivos de trigo duro.
