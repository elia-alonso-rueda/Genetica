#Funcion que calcula hasta donde llega el desequilibrio de ligamiento de un determinado marcador.
#Se considera que un intervalo acaba en la posici?n del primer marcador adyacente al que no est? asociado.
library(dplyr)
setwd("C:/Users/Elia/OneDrive - Universidad Politécnica de Madrid/genetica/TASSEL/analisis_ecococlimaticas/LD_regiones")
#cargar la matriz de LD - da problemas al cargarlo asi que revisar que se ha cargado bien o importarlo manualmente
matriz.LD.TASSEL <- read.delim("C:/Users/Elia/OneDrive - Universidad Politécnica de Madrid/genetica/TASSEL/analisis_ecococlimaticas/LD_regiones/matriz LD TASSEL.txt")

Intervalos <- function(chr,pos,R2=.3){
  #asociaciones <- read.delim(paste("correlaciones_cromosoma/chr",chr,".txt",sep=""))
  asociaciones <- matriz.LD.TASSEL
  df <- asociaciones[,c(8,9,2,3,14)]
  rownames(df) <- c(1:nrow(df))
  extremos <- c(pos,pos)
  
  if (pos %in% df$Position1){
    inicio <- subset(df,Position1 == pos)$Site1[1]
    for (i in seq(inicio,1,by=-1)){
      if (inicio != i){
        corr <- subset(df,Site1 == inicio & Site2 == i)
        extremos[1] <- corr$Position2
        if (corr$R.2 < R2 | corr$R.2 == "NaN"){
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
        if (corr$R.2 < R2 | corr$R.2 == "NaN"){
          break
        }
      } 
    }
  }
  return(extremos)
}

#asociaciones_TFG <- read.delim2("asociaciones_TFG.txt")
#cargar el archivo de resultados de TASSEL despues de haber hecho correccion de Bonferroni - da problemas al cargarlo asi que revisar que se ha cargado bien o importarlo manualmente
GLM_Stats_MQ_Bonferroni <- read.csv("C:/Users/Elia/OneDrive - Universidad Politécnica de Madrid/genetica/TASSEL/analisis_ecococlimaticas/LD_regiones/GLM_Stats_MQ_Bonferroni.txt", sep=";")
asociaciones_TFG <- GLM_Stats_MQ_Bonferroni

output <- c()
for (i in 1:nrow(asociaciones_TFG)){
  #chr <- asociaciones_TFG[i,]$Chr_Dsv
  #pos <- asociaciones_TFG[i,]$Pos_Dsv
  chr <- asociaciones_TFG[i,]$Chr
  pos <- asociaciones_TFG[i,]$Pos
  trait <- asociaciones_TFG[i,]$Trait
  output <- rbind(output,Intervalos(chr,pos))
}
output <- data.frame(output)
names(output) <- c("Inicio", "Final")

#juntar la info de los markers (chr y trait) con el inicio y el final de la secuencia
info_marker <- select(asociaciones_TFG, 1, 3)
output_completo <- cbind(info_marker, output)

write.table(output_completo,file="intervalos_raw_Bonferroni.txt",sep="\t")
