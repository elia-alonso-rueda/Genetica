#Funcion que calcula hasta donde llega el desequilibrio de ligamiento de un determinado marcador.
#Se considera que un intervalo acaba en la posici?n del primer marcador adyacente al que no est? asociado.
library(dplyr)
library(readr)
setwd("C:/Users/Elia/Desktop/genetica/TASSEL/analisis_ecococlimaticas/TD/LD_regiones")

Intervalos <- function(chr,pos,R2=.3){
  asociaciones <- read_delim(paste("correlaciones_cromosoma/chr",chr,".txt",sep=""), delim = "\t")
  df <- asociaciones[,c(8,9,2,3,14)]
  names(df) <- c("Position2", "Site2","Position1","Site1","R_2")
  rownames(df) <- c(1:nrow(df))
  extremos <- c(pos,pos)
  
  if (pos %in% df$Position1){
    inicio <- subset(df,Position1 == pos)$Site1[1]
    for (i in seq(inicio,1,by=-1)){
      if (inicio != i){
        corr <- subset(df,Site1 == inicio & Site2 == i)
        extremos[1] <- corr$Position2
        if (corr$R_2 < R2 | corr$R_2 == "NaN"){
          break
        }
      } 
    }
  }
  
  if (pos %in% df$Position2){
    for (j in seq(inicio,max(df$Site1),by=1)){
      if (inicio != j){
        corr <- subset(df,Site2 == inicio & Site1 == j)
        extremos[2] <- corr$Position1
        if (corr$R_2 < R2 | corr$R_2 == "NaN"){
          break
        }
      } 
    }
  }
  return(extremos)
}

#asociaciones_TFG <- read.delim2("asociaciones_TFG.txt")
#cargar el archivo de resultados de TASSEL despues de haber hecho correccion de Bonferroni - da problemas al cargarlo asi que revisar que se ha cargado bien o importarlo manualmente
asociaciones_TFG <- read.csv("C:/Users/Elia/Desktop/genetica/TASSEL/analisis_ecococlimaticas/TD/GLM_Stats_MQ_Bonferroni_TD.txt", sep=";")

output <- c()
for (i in 1:nrow(asociaciones_TFG)){
  chr <- asociaciones_TFG[i,]$Chr
  pos <- asociaciones_TFG[i,]$Pos
  output <- rbind(output,Intervalos(chr,pos))
}
output <- data.frame(output)
names(output) <- c("Inicio", "Final")
#juntar la info de los markers con el inicio y el final de la secuencia
output_completo <- cbind(asociaciones_TFG, output)
# guardar
write.table(output_completo,file="intervalos_raw_Bonferroni.txt",sep="\t", row.names = FALSE, append = FALSE)
