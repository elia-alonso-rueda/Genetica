library(dplyr)
library(ggplot2)
library(patchwork)
library(readr)

setwd("C:/Users/Elia/Desktop/genetica/90k")
# load("90K_Spain_Innovar_Extra.RData") # para cargar el .RData
# ### filtrado e imputacion que hizo humberto
# library(snpReady)
# mgeno_spain_fil <- raw.data(data = as.matrix(mgeno_spain[,3:ncol(mgeno_spain)]), frame = "wide", base = FALSE, sweep.sample = 0.3, call.rate = 0.8, maf = 0.01, imput = TRUE, imput.type = "knni", outfile = "012", plot = TRUE)

# save(mgeno_spain, mgeno_spain_fil, subgid, file = "90K_Spain_Innovar_Extra_VERSION2.RData", version = 2) #guardar el objeto compatible para versiones por debajo de la 3.5
# # guardar en archivos .txt
# # sin filtrar
# write.table(mgeno_spain, "mgeno_spain.txt", row.names = FALSE, append = FALSE, sep = "\t")
mgeno_spain <- read_delim("mgeno_spain.txt", delim = "\t", escape_double = FALSE, trim_ws = TRUE) # cargar tabla sin filtrar
# # filtrado
# mgeno_spain_filtrado <- data.frame(t(mgeno_spain_fil$M.clean))
# mgeno_spain_filtrado <- mgeno_spain_filtrado %>% mutate_if(is.numeric, round) # redondear los valores decimales obtenidos por imputacion para rellenar los NA
# mgeno_spain_filtrado$Name <- row.names(mgeno_spain_filtrado) # añadir columna con los nombres
# mgeno_spain_filtrado <- mgeno_spain_filtrado %>% select("Name", everything()) # poner la columna de nombres en el primer lugar
# mgeno_spain_filtrado <- merge(mgeno_spain_filtrado, mgeno_spain[,1:3], by = "Name") # cruzar ambas tablas para tener los valores de cromosoma y posicion de las accesiones despues de filtrar la tabla
# mgeno_spain_filtrado <- mgeno_spain_filtrado %>% select("Name","Chr","Position", everything()) # poner la columna de nombres en el primer lugar
# write.table(mgeno_spain_filtrado, "mgeno_spain_fil.txt", row.names = FALSE, append = FALSE, sep = "\t") # guardar la tabla con toda la info despues de haber filtrado
mgeno_spain_filtrado <- read_delim("mgeno_spain_fil.txt", delim = "\t") # cargar tabla filtrada

