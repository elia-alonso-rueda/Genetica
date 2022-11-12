################################
########## TRIGO DURO ########## 
################################
# Script para encontrar genes e informacion sobre ellos en regiones de interes de TRIGO DURO
# Input necesario: anotacion del genoma de trigo duro (TRITD_HC) y regiones de interés

#Cargar librerias
library(readxl)
library(dplyr)
library(stringr)
library(tidyverse)
library(datos)
#Poner aqui la ruta del directorio donde esta el archivo con las regiones de interes y las anotaciones de los genomas
setwd("C:/Users/Elia/Desktop/genetica/anotaciones/TD")

##Cargar archivos
#Input del user - regiones sobre las que queremos extraer informacion
INPUT <- read.table("bloques_Bonferroni_TD.txt", header = TRUE)
INPUT <- select(INPUT, c(1,4,7,8))
names(INPUT) <- c("Name", "Chr", "Start", "End" )
#poner las letras del cromosoma en minuscula para que no haya problema entre las de un arcivo y otro
for (ch in 1:nrow(INPUT)){
  INPUT$Chr[ch] <- tolower(INPUT$Chr[ch])
}


# #Cargar y limpiar la anotacion genoma trigo duro
# TRITD <- read.delim("TRITD_HC.gff3", header=FALSE)
# #Seleccionar las columnas que van a hacer falta 
# TRITD <- select(TRITD, c(1,3,4,5,9))
# #Nombres de las columnas en TRITD
# names(TRITD) <- c("Chr", "type", "Start", "End", "Info")
# #Seleccionar solo las filas de gen y del primer RNA inmediatamente siguiente (para quedarnos solo con la info del primer mRNA en el caso de que haya varios)
# TRITD <- TRITD[!(TRITD$type == "CDS"),]
# new_TRITD <- data.frame()
# for (i in 1:nrow(TRITD)){
#   print(i)
#   if(TRITD$type[i]=="gene"){
#     new_TRITD <- rbind(new_TRITD, TRITD[i+1 ,])
#   }
# }
# #almacenar la anotacion limpia en un nuevo archivo para cargar directamente el limpio y no tener que estar haciendo esto cada vez que se ejecuta el script
# write.table(new_TRITD, "new_TRITD.txt", sep="\t")

# cargar directamente el genoma de trigo duro ya limpio
TRITD <- read.delim("new_TRITD.txt", header=TRUE)

# le voy a quitar la parte de chr porque en este caso, el nombre de los cromosomas que me devuelve TASSEL no tiene la parte de chr y necesito que luego el nombre del cromosoma coincida
#y lo pongo en minuscula
TRITD$Chr[ch] <- tolower(substr(TRITD$Chr[ch], 4, 5))

#Funcion para definir el comienzo y el final de la region genomica
#Input: principio y final de la region de inter?s y el genoma donde va a encontrar la region
set_limits <- function(start.input, end.input, anotation){
  # seleccionar la parte del genoma en los que los finales sean mayores que el comienzo de la region de interes
  subanotation <- anotation[anotation$End >= start.input ,]
  # de ese subgenoma seleccionamos ahora  la parte en la que los comienzos sean menores que el final de la region de interes
  subanotation <- subanotation[subanotation$Start <= end.input ,]
  return(subanotation)
}

#directorio para almacernar los resultados
date = as.character(Sys.Date())
dir.create(paste("output_", date))
setwd(paste0(getwd(), paste("/output_", date)))

info_total <- data.frame(Chr = as.character(), Secuencia =as.character(), Region.start = as.character(), Region.end= as.character(), num.genes= as.character(), Info = as.character())
for (ch in unique(INPUT$Chr)){ # recorrer el input cromosoma a cromosoma
  print(ch) # para ver por que cromosoma vamos
  #subset del input y del genoma cromosoma por cromosoma
  INPUT_ch = INPUT[INPUT$Chr == ch ,]
  TRITD_ch = TRITD[TRITD$Chr == ch ,]
  #Recorrer el subset del cromosoma para:
  ## 1. encontrar el principio y el final de cada region genomica donde esta cada secuencia de interes y filtrar cada subgenoma para quedarme solo con esa region
  ## 2. sacar la informacion 
  for (i in 1:nrow(INPUT_ch)){
    subgenome <- set_limits(INPUT_ch$Start[i], INPUT_ch$End[i], TRITD_ch)
    if (nrow(subgenome) > 0){
      for (r in 1:nrow(subgenome)){
        # ir metiendo en el nuevo data set el cromosoma en el que esta, el nombre de la secuencia de interes, el principio y el final de la region genomica, el numero de genes que hay en esa region y la informacion de cada uno de ellos
        new_row <- data.frame(ch, INPUT_ch$Name[i], min(subgenome$Start), max(subgenome$End), nrow(subgenome),subgenome$Info[r])
        info_total <- rbind(info_total, new_row)
      } 
    } 
  }
}
names(info_total) <- c("Chr", "Secuencia", "Region.start", "Region.end", "num.genes", "Info")
# exportarlo a un archivo en la carpeta de resultados
write.table(info_total, file= "total_TD.txt" ,sep="\t", append = FALSE, row.names = FALSE)

#limpiar la info para devolver un archivo solo con el ID del gen y el note de cada gen
info_summary <- info_total
for (i in 1:nrow(info_summary)){
  splitted <- str_split(info_summary$Info[i], ";")
  id <- substr(splitted[[1]][2],8,nchar(splitted[[1]][2]))
  note <- substr(splitted[[1]][5],6,nchar(splitted[[1]][5]))
  if(is.na(note)){
    note = "No note registered for this gen"
  }
  new_info <- str_c(id, note, sep = ";")
  info_summary$Info[i] <- new_info
}

#exportarlo a un archivo llamado summary_TD
write.table(info_summary, file= "summary_TD.txt" ,sep="\t", append = FALSE, row.names = FALSE)
