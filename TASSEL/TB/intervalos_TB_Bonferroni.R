setwd("C:/Users/Elia/Desktop/genetica/TASSEL/analisis_ecococlimaticas/TB/LD_regiones")

library(dplyr)
library(stringr)
library(tidyverse)
library(datos)
library(ggplot2)

#cargamos el archivo tal cual hemos sacado los intervalos de los marcadores de TASSEL y lo vamos a limpiar y ponerle nombre a cada una de las secuencias donde hay cada marcador
df <- read.delim("intervalos_raw_Bonferroni_TB.txt")
#le ponemos nombre a las regiones 
seq_name <- c()
for (ch in 1:length(unique(df$Chr))){
  print(paste(unique(df$Chr)[ch]))
  chr <- df %>% filter(Chr == unique(df$Chr)[ch])
  chr <- arrange(chr, Inicio)
  for (inicio in chr$Inicio){
    for (j in 1:length(unique(chr$Inicio))){
      if (inicio == unique(chr$Inicio)[j]){
        name <- str_c("TB",unique(df$Chr)[ch],j,sep="_")
        seq_name <- c(seq_name, name)
      }
    }
  }
}

df <- cbind(df, seq_name)
df <- df[ , c(8,1,2,3,4,5,6,7)]
write.table(df, "intervalos_raw_Bonferroni_TB.txt",sep="\t", append = FALSE, row.names = FALSE)


#################################
# una vez hemos sacado los genes de intervalos_raw_Bonferroni_TB con anotaciones_TB, le voy a poner otra columna a bloques_Bonferroni_TD con el numero de genes que tiene cada region
tdlm <- read.table("intervalos_raw_Bonferroni_TB.txt", header = TRUE)
notes <- read.table("results_TB 2022-05-26/summary_TB.txt", header = TRUE)
num_of_genes <- c()
for (seq in unique(notes$Secuencia)){
  tmp <- notes %>% filter(Secuencia == seq)
  num_of_genes <- c(num_of_genes, unique(tmp$num.genes))
}

#vamos a comprobar que estan en el mismo orden
print(unique(tdlm$seq_name))
print(unique(notes$Secuencia))

# le uno a la tabla de la muerte la columna con el numero de genes que tiene cada region
tdlm$num_de_genes <- num_of_genes
write.table(tdlm, "intervalos_raw_Bonferroni_TB_genes.txt", sep = "\t", row.names = FALSE, append = FALSE)
