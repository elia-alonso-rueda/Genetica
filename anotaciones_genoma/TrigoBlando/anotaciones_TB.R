################################
######### TRIGO BLANDO ######### 
################################
# Script para encontrar genes e informacion sobre ellos en regiones de interes de TRIGO BLANDO

#Cargar librerias
library(readxl)
library(dplyr)
library(stringr)
library(tidyverse)
library(datos)

##Cargar archivos
#Poner aqui la ruta del directorio donde esta el archivo con las regiones de interes y las anotaciones de los genomas
setwd("C:/Users/Elia/Desktop/genetica/anotaciones/TB")
#Input del user - regiones sobre las que queremos extraer informacion
INPUT <- read_delim("C:/Users/Elia/Desktop/genetica/TASSEL/GWAS calidad fertilidad/results_fertility/LD_regiones/bloques_fertility.txt")
INPUT <- select(INPUT, c(1,3,6,7)) # selecciono las columnas del input que quiero para la tabla nueva: nombre, cromosoma, inicio y final de cada region
# las columnas que tienen que estar seguro son el nombre de la region/trait/ID, el cromosoma, el inicio y el final de cada region
names(INPUT) <- c("Name", "Chr", "Start", "End") # le ponemos este nombre a las columnas. Atencion: que esten en el mismo orden que en la tabla
#poner las letras del cromosoma en minuscula para que no haya problema entre las de un arcivo y otro
# el substr de la posicion 1-2 es importante para el cromosoma UNKNOWN y que cuadre con el unknown de TRITB
INPUT$Chr <- tolower(substr(INPUT$Chr, 1, 2))

#cargar el genoma de trigo blando (previamente limpio en el script donde juntaba el gend e la version mas actualizada y la funcion que hay en la primera version)
TRITB <- read.delim("v2.1_funciones_merged.txt")
#poner las letras del cromosoma en minuscula para que no haya problema entre las de un archivo y otro (tolower)
#le voy a quitar la parte de chr porque en este caso, el nombre de los cromosomas que me devuelve TASSEL no tiene la parte de chr (substr)
TRITB$Chr <- tolower(substr(TRITB$Chr, 4, 5))


#Funcion para definir el comienzo y el final de la region genomica
#Input: principio y final de la region de interes y el genoma donde va a encontrar la region
set_limits <- function(start.input, end.input, anotation){
  # de ese subgenoma seleccionamos ahora  la parte en la que los comienzos sean menores que el final de la region de interes
  subanotation <- anotation[anotation$Start < end.input ,]
  # seleccionar la parte del genoma en los que los finales sean mayores que el comienzo de la region de interes
  subanotation <- subanotation[subanotation$End > start.input ,]
  return(subanotation)
}

#crear directorio para almacenar los resultados
date = as.character(Sys.Date()) # fecha de hoy
dir.create(paste("output_", date)) # crear el directorio con el nombre que le queramos dar + fecha de hoy
setwd(paste0(getwd(), paste("/output_", date))) # entrar en el directorio para que los archivos se generen ahi

info_total <- data.frame(Chr = as.character(), Secuencia =as.character(), Region.start = as.character(), Region.end= as.character(), num.genes= as.character(), Info = as.character())
for (ch in unique(INPUT$Chr)){ # recorrer el input cromosoma a cromosoma
  #subset del input y del genoma cromosoma por cromosoma
  INPUT_ch = INPUT[INPUT$Chr == ch ,]
  TRITB_ch = TRITB[TRITB$Chr == ch ,]
  #Recorrer el subset del cromosoma para:
  ## 1. encontrar el principio y el final de cada region genomica donde esta cada secuencia de interes y filtrar cada subgenoma para quedarme solo con esa region
  ## 2. sacar la informacion (numero de genes, id y note de cada gen dentro de esa region)
  for (i in 1:nrow(INPUT_ch)){ #recorrer la parte del genoma de ese cromosoma en concreto
    subgenome <- set_limits(INPUT_ch$Start[i], INPUT_ch$End[i], TRITB_ch)
    if (nrow(subgenome) > 0){
      for (r in 1:nrow(subgenome)){ #recorremos el subgenoma que comprende la region de interes y apuntamos la info
        new_row <- data.frame(ch, INPUT_ch$Name[i], min(subgenome$Start), max(subgenome$End), nrow(subgenome), subgenome$Info[r])
        names(new_row) <- c("Chr", "Secuencia", "Region.start", "Region.end", "num.genes", "Info")
        info_total <- rbind(info_total, new_row)
      }
    }
  }
}
#exportar a un archivo llamado total.txt
write.table(info_total, file= "total.txt" ,sep="\t", row.names = FALSE, append = FALSE)

## escribir info_summary solo con el ID y el note del gen 
info_summary <- info_total
for (i in 1:nrow(info_summary)){
  splitted <- str_split(info_summary$Info[i], ";")
  new_info <- str_c(splitted[[1]][1], splitted[[1]][2], sep = ";")
  info_summary$Info[i] <- new_info
}
#exportar a un archivo llamado summary.txt
write.table(info_summary, file= "summary.txt" ,sep="\t", row.names = FALSE, append=FALSE)

