library(readxl)
library(dplyr)
library(multtest)

## TRIGO BLANDO ##
# cargar archivo entero
setwd("C:/Users/Elia/Desktop/genetica/TASSEL/analisis_ecococlimaticas/TD")
GLM_Stats_MQ <- read.delim("C:/Users/Elia/Desktop/genetica/TASSEL/analisis_ecococlimaticas/TB/GLM_Stats_MQ.txt")

## CORRECCION 1 - PAQUETE MULTTEST
adjusted_p <- mt.rawp2adjp(GLM_Stats_MQ$p, proc=c("Bonferroni", "Holm", "Hochberg", "SidakSS", "SidakSD",
                                                      "BH", "BY","ABH","TSBH"), alpha = 0.05)
View(adjusted_p$adjp)

## CORRECCION 2 - BONFERRONI
#cargar archivo una vez ya he filtrado por pvalor <= 0.05
setwd("C:/Users/Elia/Desktop/genetica/TASSEL/analisis_ecococlimaticas")
GLM_Stats_MQ_005 <- read_excel("GLM_Stats_MQ_005.xlsx")

# calcular el nuevo valor de pvalue: 0.05 / 4476 (num de tests independientes)
b <- 0.05/4476
# quedarme con los pvalores menores que b
GLM_Stats_MQ_bonferroni <- GLM_Stats_MQ[GLM_Stats_MQ$p < b ,]
View(GLM_Stats_MQ_bonferroni)
# almacenarlo en un excel
write.table(GLM_Stats_MQ_bonferroni, "LD_regiones/GLM_Stats_MQ_Bonferroni.txt", sep = ";")

## TRIGO DURO ##
GLM_Stats_MQ <- read.delim("C:/Users/Elia/Desktop/genetica/TASSEL/analisis_ecococlimaticas/TD/GLM_Stats_MQ_TD.txt", na = "NaN")
#me quedo solo con las columnas que me hacen falta
GLM_Stats_MQ <- select(GLM_Stats_MQ,c(1,2,3,4,6))
GLM_Stats_MQ <- GLM_Stats_MQ[!is.na(GLM_Stats_MQ$p),]

## CORRECCION 1 - PAQUETE MULTTEST
#le pongo a la columna de pvalor el nombre de rawp para luego poder hacer el join con la tabla de la funcion rawp2adjp
names(GLM_Stats_MQ)[5] = "rawp"
adjusted_p <- mt.rawp2adjp(GLM_Stats_MQ$rawp, proc=c("Bonferroni", "Holm", "Hochberg", "SidakSS", "SidakSD",
                                                "BH", "BY","ABH","TSBH"), alpha = 0.05)
adj <- data.frame(adjusted_p$adjp)
adj_ABH <- select(adj, c(1, "ABH"))
GLM_Stats_MQ_ABH <- merge(x=GLM_Stats_MQ, y=adj_ABH, by = "rawp") #esto hay que arreglarlo

## CORRECCION 2 - BONFERRONI
# calcular el nuevo valor de pvalue: 0.05 / 4376 (num de tests independientes)
b <- 0.05/4376
# quedarme con los pvalores menores que b
GLM_Stats_MQ_bonferroni <- GLM_Stats_MQ[GLM_Stats_MQ$p < b ,]
#limpiar el archivo 
GLM_Stats_MQ_bonferroni <- GLM_Stats_MQ_bonferroni[!is.na(GLM_Stats_MQ_bonferroni$Trait),]
print(unique(GLM_Stats_MQ_bonferroni$Trait))
# almacenarlo en un excel
write.table(GLM_Stats_MQ_bonferroni, "C:/Users/Elia/Desktop/genetica/TASSEL/analisis_ecococlimaticas/TD/GLM_Stats_MQ_Bonferroni_TD.txt", sep = ";", row.names = FALSE, append = FALSE)
