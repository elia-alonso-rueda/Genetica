### Script para crear un pasaporte para sacar variables ecoclimaticas con CAPFITOGEN3
## El input tiene que ser una tabla del estilo de la de "Passaporte" de trigo blando
## Como output se genera un .txt listo para sacar las variables ecoclimaticas con CAPFITOGEN3

#Cargamos librerias
# Para preparar el pasaporte.txt
library(readxl)
library(xlsx)
library(readr)
# Para hacer el PCA
library(stats)
library(FactoMineR)
library(factoextra)
library(corrplot)
# Para modificar data frames
library(dplyr)

#PART 1 - ECOGEO CAPFITOGEN 
# Establecemos el working directory en el que estamos trabajando.
#Tener en cuenta que todos los archivos que carguemos tienen que estar en este directorio
#Si los archivos que vamos a coger ya estan en este directorio no hace falta el setwd
setwd("C:/Users/Elia/Desktop/genetica/coordenadas y variables ecoclimaticas/CAPFITOGEN3/analisis/TB")
# Cargar datos de pasaporte 
Passaporte <- read_excel("Passaporte.xlsx")
#Eliminar filas que tengan valores nulos en las coordenadas
Passaporte <- Passaporte[!is.na(Passaporte$LATITU),]
Passaporte <- Passaporte[!is.na(Passaporte$LONGIT),]

##PASAMOS LAS COORDENADAS A FORMATO DECIMAL PARA UTILIZAR ECOGEO
# Creamos un vector nuevo en el que almacenar los nuevos valores de longitud sin el 0 que tiene al principio que le sobra
new_longitud <- c()
#Quitar el 0 que le sobra al principio a los valores de longitud
for (long in Passaporte$LONGIT){
  if (nchar(long) > 7){
    new_longitud = c(new_longitud,substr(long,2,8))
  }
}
# Sustituir la columna de longitud del data set por la nueva sin el 0 que le sobraba al principio
if (length(new_longitud) > 0){
  Passaporte$LONGIT <- new_longitud
}

#Pasar las coordenadas de DMS tal y como las tenemos ahora a formato decimal para la herramienta ECOGEO de CAPFITOGEN
#En longitud
## Creamos un vector en el que almacenar los datos de longitud en formato decimal
dec_long = c()
##Sustituimos los guiones por 0 para poder calcular el valor
Passaporte$LONGIT = gsub('-','0',Passaporte$LONGIT)
for (long in Passaporte$LONGIT){
  #Me aseguro de que en las columnas de longitud y latitud no hay ningun valor con menos o mas de 7 caracteres
  if (nchar(long) > 7){
    print("Longitud con mas de 7 caracteres: ",long)
  }
  if (nchar(long) < 7){
    print("Longitud con menos de 7 caracteres: ",long)
  }
  #Los grados son los dos primeros digitos, los minutos los 2 segundos y los segundos los 2 ultimos
  deg = as.numeric(substr(long,1,2))
  min = as.numeric(substr(long,3,4))
  seg = as.numeric(substr(long,5,6))
  #Hago el calculo para pasar a formato decimal y dejo 5 decimales en el numero
  decimal = round(deg + (min/60)+ (seg/3600), 5)
  if (substr(long,7,7) == "W"){
    decimal = decimal*(-1)
  }
  #Lo almaceno en el vector
  dec_long = c(dec_long, decimal)
}

# En latitud
## Creamos un vector en el que almacenar los datos de longitud en formato decimal
dec_lat = c()
##Sustituimos los guiones por 0 para poder calcular el valor
Passaporte$LATITU = gsub('-','0',Passaporte$LATITU)
for (lat in Passaporte$LATITU){
  #Me aseguro de que en las columnas de longitud y latitud no hay ningun valor con menos o mas de 7 caracteres
  if (nchar(lat) > 7){
    print("Longitud con mas de 7 caracteres: ",lat)
  }
  if (nchar(lat) < 7){
    print("Longitud con menos de 7 caracteres: ",lat)
  }
  #Los grados son los dos primeros digitos, los minutos los 2 segundos y los segundos los 2 ultimos
  deg = as.numeric(substr(lat,1,2))
  min = as.numeric(substr(lat,3,4))
  seg = as.numeric(substr(lat,5,6))
  #Hago el calculo para pasar a formato decimal y dejo 5 decimales en el numero
  decimal = round(deg + (min/60)+ (seg/3600), 5)
  if (substr(lat,7,7) == "S"){
    decimal = decimal*(-1)
  }
  #Lo almaceno en el vector
  dec_lat = c(dec_lat, decimal)
}

# Ahora vamos a generar el pasaporte que necesitamos para utilizar la herramienta ECOGEO de CAPFITOGEN
# Vamos a ir creando columna por columna de la manera en que lo requiere el programa
INSTCODE = substr(Passaporte$BGE,1,3)
ACCENUMB = substr(Passaporte$BGE,4,9)
COLLNUMB <- c(rep(NA, nrow(Passaporte)))
COLLCODE <- c(rep(NA, nrow(Passaporte)))
COLLNAME <- c(rep(NA, nrow(Passaporte)))
COLLINSTADDRESS <- c(rep(NA, nrow(Passaporte)))
COLLMISSID <- c(rep(NA, nrow(Passaporte)))
GENUS <- c(rep("Triticum", nrow(Passaporte)))
SPECIES <- c(rep("aes", nrow(Passaporte)))
SPAUTHOR <- c(rep(NA, nrow(Passaporte)))
SUBTAXA <- c(rep("subsp. vulgare", nrow(Passaporte)))
SUBTAUTHOR <- c(rep(NA, nrow(Passaporte)))
CROPNAME <- c(rep("wheat", nrow(Passaporte)))
ACCENAME <- c(rep(NA, nrow(Passaporte)))
ACQDATE <- c(rep(NA, nrow(Passaporte)))
ORIGCTY <- c(rep("ESP", nrow(Passaporte)))
NAMECTY <- c(rep(NA, nrow(Passaporte)))
ADM1 <- Passaporte$ESTREG
ADM2 <- Passaporte$PROVIN
ADM3 <- c(rep(NA, nrow(Passaporte)))
ADM4 <- Passaporte$MUNICI
COLLSITE <- c(rep(NA, nrow(Passaporte)))
DECLATITUDE <- dec_lat
LATITUDE <- Passaporte$LATITU
DECLONGITUDE <- dec_long
LONGITUDE <- Passaporte$LONGIT
COORDUNCERT <- c(rep(NA, nrow(Passaporte)))
COORDDATUM <- c(rep(NA, nrow(Passaporte)))
GEOREFMETH <- c(rep(NA, nrow(Passaporte)))
ELEVATION <- Passaporte$ALTITU
COLLDATE <- c(rep(NA, nrow(Passaporte)))
BREDCODE <- c(rep(NA, nrow(Passaporte)))
BREDNAME <- c(rep(NA, nrow(Passaporte)))
SAMPSTAT <- c(rep(NA, nrow(Passaporte)))#300?
ANCEST <- c(rep(NA, nrow(Passaporte)))
COLLSRC <- c(rep(NA, nrow(Passaporte)))#20?
DONORCODE <- c(rep(NA, nrow(Passaporte)))
DONORNAME <- c(rep(NA, nrow(Passaporte)))
DONORNUMB <- c(rep(NA, nrow(Passaporte)))
OTHERNUMB <- c(rep(NA, nrow(Passaporte)))
DUPLSITE <- c(rep(NA, nrow(Passaporte)))
DUPLINSTNAME <- c(rep(NA, nrow(Passaporte)))
STORAGE <- c(rep(NA, nrow(Passaporte)))
MLSSTAT	 <- c(rep(NA, nrow(Passaporte)))
REMARKS <- c(rep(NA, nrow(Passaporte)))

df_pasaporte <- data.frame(INSTCODE,ACCENUMB,COLLNUMB,COLLCODE,COLLNAME,COLLINSTADDRESS,COLLMISSID,GENUS,SPECIES,SPAUTHOR,SUBTAXA,SUBTAUTHOR,CROPNAME,	
                           ACCENAME,ACQDATE,ORIGCTY,NAMECTY,ADM1,ADM2,ADM3,ADM4,COLLSITE,DECLATITUDE,
                           LATITUDE,DECLONGITUDE,LONGITUDE,COORDUNCERT,COORDDATUM,GEOREFMETH,ELEVATION,
                           COLLDATE,BREDCODE,BREDNAME,SAMPSTAT,ANCEST,COLLSRC,DONORCODE,DONORNAME,DONORNUMB,	
                           OTHERNUMB,DUPLSITE,DUPLINSTNAME,STORAGE,MLSSTAT,REMARKS)

# !!!!!! IMPORTANTE !!!!!!
# Exportamos el data frame en .txt directamente a la carpeta pasaporte donde esta instalado el programa
#Importante poner esa ruta del ordenador en el que se esta usando CAPFITOGEN
#Si se genera en cualquier otra carpeta, copiar el archivo y pegarlo en la carpeta pasaporte de capfitogen
write_delim(df_pasaporte, "C:/Users/Elia/CAPFITOGEN3/Pasaporte/data.txt", delim = "\t")
# Lo exporto tambien al directorio de trabajo para tenerlo mas a mano
write_delim(df_pasaporte, "data.txt", delim = "\t")

## AÑADIR RANGO Y MEDIA DE LA TABLA DE VARIABLES RESULTANTE DE CAPFITOGEN
tabla_variables <- read.delim("C:/Users/Elia/Desktop/genetica/coordenadas y variables ecoclimaticas/CAPFITOGEN3/analisis/TB/results/EcogeographicCharacterization_Spain/TablaVarEcogeograficasspain.txt")
tabla_variables_extra <- rbind(tabla_variables, apply(tabla_variables, MARGIN = 2, FUN = summary))

## AÑADIR ASTERISCO EN LAS VARIABLES QUE HAN SALIDO SIGNIFICATIVAS EN GWAS
bonferroni_tassel <- read.table("C:/Users/Elia/Desktop/genetica/TASSEL/analisis_ecococlimaticas/TB/GLM_Stats_MQ_Bonferroni.txt", sep = ";")
sig <- unique(bonferroni_tassel$Trait)
tabla_variables_extra <- rbind(tabla_variables_extra, rep("-",ncol(tabla_variables_extra)))
for(i in sig){
  print(i)
  print(tabla_variables_extra[nrow(tabla_variables_extra),i])
  tabla_variables_extra[nrow(tabla_variables_extra),i] <- "*"
  print(tabla_variables_extra[nrow(tabla_variables_extra),i])
}

## AÑADIR ASTERISCO EN LAS VARIABLES QUE HAN SALIDO SIGNIFICATIVAS EN EL ANOVA CON MARCADORES
anova_marcadores <- read.table("C:/Users/Elia/Desktop/genetica/analisis_patri/ANOVA_variables_ecoclimaticas/TB/anova_005_tb.txt", sep = " ", header = TRUE)
sig <- unique(anova_marcadores$Cuantitativas)
tabla_variables_extra <- rbind(tabla_variables_extra, rep("-",ncol(tabla_variables_extra)))
for(i in sig){
  print(i)
  print(tabla_variables_extra[nrow(tabla_variables_extra),i])
  tabla_variables_extra[nrow(tabla_variables_extra),i] <- "*"
  print(tabla_variables_extra[nrow(tabla_variables_extra),i])
}

## AÑADIR ASTERISCO EN LAS VARIABLES QUE HAN SALIDO SIGNIFICATIVAS EN EL ANOVA CON GS1 Y GS2
anova_marcadores <- read.table("C:/Users/Elia/Desktop/genetica/coordenadas y variables ecoclimaticas/CAPFITOGEN3/analisis/TB/marcadores_genes_GS/anova_005_tb.txt", sep = " ", header = TRUE)
sig <- unique(anova_marcadores$Cuantitativas)
tabla_variables_extra <- rbind(tabla_variables_extra, rep("-",ncol(tabla_variables_extra)))
for(i in sig){
  print(i)
  print(tabla_variables_extra[nrow(tabla_variables_extra),i])
  tabla_variables_extra[nrow(tabla_variables_extra),i] <- "*"
  print(tabla_variables_extra[nrow(tabla_variables_extra),i])
}

## GUARDAR TABLA EN LA CARPETA DE RESULTADOS
row.names(tabla_variables_extra)[137] <- "GWAS"
row.names(tabla_variables_extra)[138] <- "MARCADORES MOLECULARES"
row.names(tabla_variables_extra)[139] <- "GS"
write.table(tabla_variables_extra, "C:/Users/Elia/Desktop/genetica/coordenadas y variables ecoclimaticas/CAPFITOGEN3/analisis/TB/results/EcogeographicCharacterization_Spain/variables_ecogeograficas_extra.txt", sep = "\t", append = FALSE, row.names = TRUE)

## PREPARAR ARCHIVO PHENO FOR TASSEL
#Preparar variables ecoclimaticas como fenotipo para TASSEL
#Exportar tabla solo con variables ecoclimaticas y ajustar formato para lanzar el tassel
# !!! !!! CUIDADO !!! !!! se borran los archivos que se habian generado aqui previamente con el nombre con el que se habian generado; si se quieren generar otros con datos nuevos, cambiar el nombre de los archivos que se crean en las lineas mas abajo; si no, esos datos nuevos se van a almacenar en los archivos preexistentes 
setwd(paste("C:/User/Elia/Desktop/genetica/TASSEL/analisis_ecococlimaticas/TB"))
unlink("tabla_variables.txt")
unlink("pheno_ecoclimaticas_TB.txt")
tabla_tassel <- select(tabla_variables, -DECLATITUDE, -DECLONGITUDE, -alt, -POP)
tabla_tassel$ACCENUMB <- Passaporte$AGL
names(tabla_tassel)[1] = "Taxa"
write_delim(tabla_tassel, "tabla_variables.txt", delim = "\t")
tabla_tassel <- read.delim("tabla_variables.txt", header = FALSE)
names(tabla_tassel) <- c("taxa", rep("data", 74))
#Poner directorio en el que queremos exportar la tabla para usarla en tassel
write(paste("<Phenotype>"), file="pheno_ecoclimaticas.txt", append=TRUE)
write.table(tabla_tassel, file="pheno_ecoclimaticas_TB.txt", append=TRUE, sep = "\t", row.names = FALSE, quote=FALSE)
#eliminar la tabla de variables que es innecesaria aqui, ya la tenemos de cuando hemos ejecutado capfitogen
unlink("tabla_variables.txt")
