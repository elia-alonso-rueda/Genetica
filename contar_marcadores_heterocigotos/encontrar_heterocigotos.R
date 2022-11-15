library(dplyr)
library(ggplot2)
library(patchwork)
library(readr)

setwd("C:/Users/Elia/Desktop/genetica/90k")
mgeno_spain <- read_delim("mgeno_spain.txt", delim = "\t", escape_double = FALSE, trim_ws = TRUE) # cargar tabla sin filtrar
mgeno_spain_filtrado <- read_delim("mgeno_spain_fil.txt", delim = "\t") # cargar tabla filtrada

# por individuos (es decir por filas)
ind_todos1 <- function(df){ # como input el df en el que queremos encontrar las lineas que tienen heterocigotos (codificados con un 1)
  df_sel <- df %>% select(starts_with("GID"))
  df_ind <- cbind(df, min = apply(df_sel, 1, min, na.rm = TRUE))
  df_ind <- cbind(df_ind, max = apply(df_sel, 1, max, na.rm = TRUE))
  print(paste("Numero de individuos con todos heterocigotos:", nrow(df_ind %>% filter(min == 1) %>% filter(max == 1))))
  todos <- df_ind %>% filter(min == 1) %>% filter(max == 1)
  individuos <- select(todos, Name)
  return(individuos)
}
individuos_sinfiltrar <- ind_todos1(mgeno_spain) # ID de los individuos en los que todos son heterocigotos
individuos_filtrado <- ind_todos1(mgeno_spain_filtrado) # ID de los individuos en los que todos son heterocigotos

# por marcadores (es decir por columnas)
marc_todos1 <- function(df){
  df_sel <- df %>% select(starts_with("GID"))
  df_sel <- as.data.frame(t(df_sel))
  df_marc <- cbind(df_sel, min = apply(df_sel, 1, min, na.rm = TRUE))
  df_marc <- cbind(df_marc, max = apply(df_sel, 1, max, na.rm = TRUE))
  todos <- df_marc %>% filter(min == 1) %>% filter(max == 1)
  print(paste("Numero de marcadores con todos heterocigotos:", nrow(todos)))
  marcadores <- row.names(todos)
  return(marcadores)
}
marcadores_sinfiltrar <- marc_todos1(mgeno_spain) # ID de los marcadores en que todos son heterocigotos
marcadores_filtrado <- marc_todos1(mgeno_spain_filtrado) # ID de los marcadores en que todos son heterocigotos

rep_2 <- function(x){ # convertimos los 2 en 0 para quedarnos con 1 simplemente en los heterocigotos y los homocigotos tenerlos todos codificados como 0
  if(x == 2 | is.na(x)){
    x = 0
  }
  else{
    x = x
  }
}

# EN EL QUE NO ESTA FILTRADO
df_01 <- as.data.frame(apply(mgeno_spain %>% select(starts_with("GID")), MARGIN = c(1,2), rep_2))
individuos_suma1 <- apply(df_01, 1, sum)
individuos_suma1 <- cbind(mgeno_spain, sum = individuos_suma1)
marcadores_suma1 <- rbind(mgeno_spain %>% select(starts_with("GID")), apply(df_01, 2, sum))
row.names(marcadores_suma1)[nrow(marcadores_suma1)] <- "sum"
## guardar las tablas en archivos
write.table(marcadores_suma1, "suma_heterocigotos_individuos.txt", sep = "\t", append = FALSE, row.names = FALSE)
write.table(marcadores_suma1, "suma_heterocigotos_GID.txt", sep = "\t", append = FALSE, row.names = TRUE)

# EN EL FILTRADO
df_01 <- as.data.frame(apply(mgeno_spain_filtrado %>% select(starts_with("GID")), MARGIN = c(1,2), rep_2))
individuos_suma1 <- apply(df_01, 1, sum)
individuos_suma1 <- cbind(mgeno_spain_filtrado, individuos_suma1)
marcadores_suma1 <- rbind(mgeno_spain_filtrado %>% select(starts_with("GID")), apply(df_01, 2, sum))
row.names(marcadores_suma1)[nrow(marcadores_suma1)] <- "sum"
## guardar las tablas en archivos
write.table(marcadores_suma1, "suma_heterocigotos_individuos_filtrado.txt", sep = "\t", append = FALSE, row.names = FALSE)
write.table(marcadores_suma1, "suma_heterocigotos_GID_filtrado.txt", sep = "\t", append = FALSE, row.names = TRUE)



