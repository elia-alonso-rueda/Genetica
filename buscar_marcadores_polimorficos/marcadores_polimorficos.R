## script para buscar polimorfismos entre marcadores
# input: el df de entrada debe tener como columnas, por un lado una con IDs de los individuos y luego tantas columnas como marcadores se vayan a analizar
# para comprobar polimorfismos, se tienen que poner en list1 y list2 los nombres de los marcadores tal cual y como aparecen en las columnas, si no, no funciona
# recomiendo ponerlos como los índices de las columnas dentro del comando name, tal y como aparece en este script

# load libraries
library(dplyr)
library(ggplot2)
library(RColorBrewer)
# set working directory
setwd("C:/Users/Elia/Desktop/genetica/90k")

# funcion para buscar marcadores polimorficos
buscar_marcadores <- function(df, list1, list2){ # funcion para buscar marcadores a partir de un dataframe con los alelos y 2 listas introducidas por el user
  # subsets con los marcadores del input del user
  df1 <- select(df, all_of(list1))
  df2 <- select(df, all_of(list2))
  new_df <- data.frame() # data frame donde almacenar los marcadores polimorficos 
  for(i in 1:nrow(df)){ # recorremos el dataframe fila por fila
    values1 <- c()
    for(j in 1:ncol(df1)){
      values1 <- c(values1, df1[i,j]) # creamos un vector con los valores de esa fila para los elementos de la primera lista
    }
    if(length(unique(values1)) == 1 && (unique(values1) != 2)){ # si solo hay un valor unico (es decir, todos son 0 o todos son 1), miramos los valores de esa fila para los elementos de la segunda lista
      values2 <- c()
      for(k in 1:ncol(df2)){
        values2 <- c(values2, df2[i,k]) # añadimos los valores de esa fila para los elementos de la segunda lista
      }
      if((length(unique(values2)) == 1) && (unique(values1) != unique(values2)) && (unique(values2) != 2)){ # si tambien hay solo un valor unico y es diferente al de la primera lista, añadimos esa fila completa al nuevo dataframe
        new_df <- rbind(new_df, df[i,])
      }
    } 
  }  
  return(new_df)
}


# set working directory
# load / clean data
df <- read.table("mgeno_spain_fil.txt", header = TRUE, sep = "\t", check.names = FALSE)

# user input - tiene que crear una lista con el nombre de los marcadores entre los que quiere comprobar el polimorfismo; se puede crear cogiendo los nombres de las columnas de cada marcador, como se ve abajo
list1 <- names(df[,4:8])
list2 <- names(df[,19:23])
# obtener marcadores polimorficos con la funcion buscar_marcadores a partir del subset del dataframe con la info de los alelos y las listas introducidas por el user
polimorficos <- buscar_marcadores(df, list1, list2)
# quedarme solo con las columnas de los marcadores que aparecen en list1 y list2
polimorficos <- polimorficos %>% select(1:3, all_of(append(list1, list2))) %>% arrange(Position) %>% arrange(Chr) # quedarme solo con las columnas de los marcadores que estan en la lista que hemos introducido y ordenar el output por cromosoma y posicion
# guardar en un archivo .txt
write.table(polimorficos, file = "marcadores_polimorficos.txt", sep = ";", row.names = FALSE, append = FALSE)

# representacion de numero de marcadores distinto por cromosoma 
num_chr <- polimorficos %>% group_by(Chr) %>% summarise(numero_marcadores = n())
## bar plot
# png("marcadores_por_cromosoma.png", width = 950, height = 400) # si quiero guardarlo en un .png
ggplot(data=num_chr, aes(x=Chr, y=numero_marcadores, fill = Chr)) +
  geom_bar(stat="identity") +
  scale_fill_brewer(palette="Set3") +
  scale_y_continuous(breaks=as.vector(num_chr$numero_marcadores)) +
  # geom_text(aes(label=n), vjust=-0.3, size=3.5)+
  theme_minimal()      
# dev.off() # si quiero guardarlo en un .png



