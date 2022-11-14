## LOAD LIBRARIES
library(tidyverse)
library(hrbrthemes)
library(viridis)
library(readxl)
library(RColorBrewer)
library(ggpubr)
library(gridExtra)
library(car)
library(nortest)
library(datos)
## SET WORKING DIRECTORY
setwd("C:/Users/Elia/Desktop/genetica/analisis_patri/TRIGO DURO")

## EXPLORATORY DATA ANALYSIS DE VARIABLES CATEGORICAS
td <- read_excel("Datos TD.xlsx", na = "NA") # cargar datos
td <- select(td,-(1:2),-(4:9)) # seleccionar columnas que me interesan
names(td) <- gsub("-", "_", names(td))
# convertir las columnas de caracteres en factors
td <- td %>% mutate_at(c(1:5), as.factor)
summary(td)

# VARIABLES CATEGORICAS - tabla de datos y graficos
## M_VrnA1
### POBLACION GENERAL
tmp <- data.frame(td %>% count(M_VrnA1)) # en la poblacion general
ggplot(td[!is.na(td$M_VrnA1),], aes(x = M_VrnA1, fill = M_VrnA1)) + 
  geom_bar(position="stack", stat="count") +
  ggtitle("Pob general") +
  scale_fill_brewer(palette='Dark2', na.value = '#F0FFFF') +
  theme(legend.position = "bottom", legend.title = element_blank())
### POR POP
tmp <- data.frame(td %>% group_by(Pop) %>% count(M_VrnA1)) # por Pop
ggplot(td[!is.na(td$M_VrnA1),], aes(fill= M_VrnA1, x = Pop)) + 
  geom_bar(position="fill", stat="count") +
  ggtitle("Por pop") +
  scale_fill_brewer(palette='Dark2', na.value = '#F0FFFF') +
  theme(legend.position = "bottom", legend.title = element_blank(), axis.title.y=element_blank())
### POR SSP
tmp <- data.frame(td %>% group_by(Subspecies) %>% count(M_VrnA1)) # por ssp
ggplot(td[!is.na(td$M_VrnA1),], aes(fill= M_VrnA1, x = Subspecies)) + 
  geom_bar(position="fill", stat="count") +
  ggtitle("Por ssp") +
  scale_fill_brewer(palette='Dark2', na.value = '#F0FFFF') +
  theme(legend.position = "bottom", legend.title = element_blank(), axis.title.y=element_blank())

## M_VrnB1
### POBLACION GENERAL
tmp <- data.frame(td %>% count(M_VrnB1)) # en la poblacion general
ggplot(td[!is.na(td$M_VrnB1),], aes(x = M_VrnB1, fill = M_VrnB1)) + 
  geom_bar(position="stack", stat="count") +
  ggtitle("Pob general") +
  scale_fill_brewer(palette='Set1', na.value = '#F0FFFF') +
  theme(legend.position = "bottom", legend.title = element_blank())
### POR POP
tmp <- data.frame(td %>% group_by(Pop) %>% count(M_VrnB1)) # por Pop
ggplot(td[!is.na(td$M_VrnB1),], aes(fill= M_VrnB1, x = Pop)) + 
  geom_bar(position="fill", stat="count") +
  ggtitle("Por pop") +
  scale_fill_brewer(palette='Set1', na.value = '#F0FFFF') +
  theme(legend.position = "bottom", legend.title = element_blank(), axis.title.y=element_blank())
### POR SSP
tmp <- data.frame(td %>% group_by(Subspecies) %>% count(M_VrnB1)) # por Pop
ggplot(td[!is.na(td$M_VrnB1),], aes(fill= M_VrnB1, x = Subspecies)) + 
  geom_bar(position="fill", stat="count") +
  ggtitle("Por ssp") +
  scale_fill_brewer(palette='Set1', na.value = '#F0FFFF') +
  theme(legend.position = "bottom", legend.title = element_blank(), axis.title.y=element_blank())

## F
### POBLACION GENERAL
tmp <- data.frame(td %>% count(F)) # en la poblacion general
ggplot(td[!is.na(td$`F`),], aes(x = `F`, fill = `F`)) + 
  ggtitle("Pob general") +
  geom_bar(position="stack", stat="count") +
  #scale_fill_brewer(palette='Set2', na.value = '#F0FFFF') +
  theme(legend.position = "bottom", legend.title = element_blank())
### POR POP
tmp <- data.frame(td %>% group_by(Pop) %>% count(F)) # por Pop
ggplot(td[!is.na(td$`F`),], aes(fill= `F`, x = Pop)) + 
  geom_bar(position="fill", stat="count") +
  ggtitle("Por pop") +
  #scale_fill_brewer(palette='Set2', na.value = '#F0FFFF') +
  theme(legend.position = "bottom", legend.title = element_blank(), axis.title.y=element_blank())
### POR SSP
tmp <- data.frame(td %>% group_by(Subspecies) %>% count(F)) # por Pop
ggplot(td[!is.na(td$`F`),], aes(fill= `F`, x = Subspecies)) + 
  geom_bar(position="fill", stat="count") +
  ggtitle("Por ssp") +
  #scale_fill_brewer(palette='Set2', na.value = '#F0FFFF') +
  theme(legend.position = "bottom", legend.title = element_blank(), axis.title.y=element_blank())

## VARIABLES NUMERICAS
## summary
tmp <- apply(td[,6:10], 2, summary)
tmp <- rbind(tmp, var = apply(td[,6:10], 2, var))
tmp <- rbind(tmp, sd = apply(td[,6:10], 2, sd))
write.table(data.frame(tmp), file = "summary_numericas_TD.txt", row.names = TRUE, append = FALSE)

## TEST DE NORMALIDAD SHAPIRO-WILK EN LA POBLACION GENERAL
test <- data.frame() # data frame donde almacenar todos los resultados
for(numerica in 6:10){ # recorro las columnas de variables numericas
  test <- rbind(test, data.frame(names(td[numerica]), shapiro.test(td[,numerica][[1]])[["statistic"]], shapiro.test(td[,numerica][[1]])[["p.value"]]))
}
names(test) <- c("Variable", "Statistic", "p.value") # pongo nombres a las columnas
write.table(test_sw, file = "shapiro_wilk_TD.txt", row.names = FALSE, append = FALSE) # guardo en un archivo .txt

## boxplots
b1 <- ggplot(td[!is.na(td$DE_CRF),], aes(x=DE_CRF)) + geom_boxplot(fill="#E0EEE0") + theme(axis.title.y=element_blank(), axis.title.x=element_blank()) 
b2 <- ggplot(td[!is.na(td$DE_Ll),], aes(x=DE_Ll)) + geom_boxplot(fill="#79CDCD") + theme(axis.title.y=element_blank(), axis.title.x=element_blank())
b3 <- ggplot(td[!is.na(td$DE_J),], aes(x=DE_J)) + geom_boxplot(fill="#CDB5CD") + theme(axis.title.y=element_blank(), axis.title.x=element_blank())
b4 <- ggplot(td[!is.na(td$DM_CRF),], aes(x=DM_CRF)) + geom_boxplot(fill="#FFFACD") + theme(axis.title.y=element_blank(), axis.title.x=element_blank())
b5 <- ggplot(td[!is.na(td$DM_Ll),], aes(x=DM_Ll)) + geom_boxplot(fill="#FFE4E1") + theme(axis.title.y=element_blank(), axis.title.x=element_blank())
## density plots
p1 <- ggplot(td[!is.na(td$DE_CRF),], aes(x=DE_CRF)) + geom_density(fill="#E0EEE0") + theme(axis.title.y=element_blank()) 
p2 <- ggplot(td[!is.na(td$DE_Ll),], aes(x=DE_Ll)) + geom_density(fill="#79CDCD") + theme(axis.title.y=element_blank())
p3 <- ggplot(td[!is.na(td$DE_J),], aes(x=DE_J)) + geom_density(fill="#CDB5CD") + theme(axis.title.y=element_blank())
p4 <- ggplot(td[!is.na(td$DM_CRF),], aes(x=DM_CRF)) + geom_density(fill="#FFFACD") + theme(axis.title.y=element_blank())
p5 <- ggplot(td[!is.na(td$DM_Ll),], aes(x=DM_Ll)) + geom_density(fill="#FFE4E1") + theme(axis.title.y=element_blank())
ggarrange(plotlist = list(b1,b2,b3,b4,b5,p1,p2,p3,p4,p5), nrow = 2, ncol = 5)

# ANOVA CON TODOS LOS DATOS
test_anova <- data.frame() # parametrico
test_tukey <- data.frame() # post hoc
dir.create("pairwise_boxplots_TD") # directorio donde almacenar los boxplots por pares del test Tukey
for(numerica in 6:10){ # recorro las columnas de variables numericas
  for(categorica in 1:5){ # recorro las columnas de las variables categoricas
    # TEST ANOVA
    anova <- aov(td[,numerica][[1]] ~ as.factor(td[,categorica][[1]]), data = td)
    test_anova <- rbind(test_anova, data.frame(names(td[numerica]), names(td[categorica]), data.frame(summary(anova)[[1]])[1,5]))
    # test post hoc para las significativas (p-valor < 0.05)
    if(data.frame(summary(anova)[[1]])[1,5] < 0.05){
      tukey <- data.frame(TukeyHSD(anova)[["as.factor(td[, categorica][[1]])"]])
      tukey <- cbind(tukey, Cuantitativa = rep(names(td[numerica]), nrow(tukey)), Cualitativa = rep(names(td[categorica]), nrow(tukey)), Pair = row.names(tukey))
      test_tukey <- rbind(test_tukey, tukey)
      # guardar box-plots en .png dentro de la carpeta que hemos creado
      setwd("pairwise_boxplots_TD")
      png(paste(names(td[categorica]),"-",names(td[numerica]),"_TD.png")) # Dispositivo PNG
      plot(TukeyHSD(anova)) # Código
      dev.off() # Cerramos el dispositivo
      setwd("C:/Users/Elia/Desktop/genetica/analisis_patri/TRIGO DURO")
    }
  }
}
names(test_anova) <- c("Cualitativas", "Cuantitativas", "p.valor")
write.table(test_anova, file = "anova_TD.txt", row.names = FALSE, append = FALSE)

test_anova_005 <- test_anova[test_anova$p.valor < 0.05,] # anovas con p-valor < 0.05
write.table(test_anova_005, file = "anova_005_TD.txt", row.names = FALSE, append = FALSE)

test_tukey = test_tukey[ , c(5,6,7,1,2,3,4)]
write.table(test_tukey, file = "Tukey_TD.txt", row.names = FALSE, append = FALSE)

test_tukey_005 <- test_tukey[test_tukey$p.adj < 0.05,] # tukeys con p-valor < 0.05
write.table(test_tukey_005, file = "tukey_005_TD.txt", row.names = FALSE, append = FALSE)

# KRUSKAL-WALLIS CON TODOS LOS DATOS
test_kw <- data.frame()
test_wilcox <- data.frame()
for(numerica in 6:10){ # recorro las columnas de variables numericas
  for(categorica in 1:5){ # recorro las columnas de las variables categoricas
    # TEST KRUSKAL-WALLIS
    kw <- kruskal.test(td[,numerica][[1]] ~ as.factor(td[,categorica][[1]]), data = td)
    test_kw <- rbind(test_kw, data.frame(names(td[numerica]), names(td[categorica]), kw[["p.value"]]))
    if(kw[["p.value"]] < 0.05){  # test post hoc para las significativas (p-valor < 0.05)
      wilcox <- pairwise.wilcox.test(x = td[,numerica][[1]], g = td[,categorica][[1]], p.adjust.method = "holm" )      
      tmp <- data.frame(wilcox[["p.value"]]) # almacenar en una variable temporal la matriz de p-valores para poder recorrerla y convertirla en la tabla de datos
      for(i in 1:ncol(tmp)){
        for(j in 1:nrow(tmp)){
          test_wilcox <- rbind(test_wilcox, data.frame(names(td[numerica]), names(td[categorica]), str_c(c(names(tmp[i]), row.names(tmp[1])[j]), collapse = "-"), tmp[j,i]))
        }
      }
    }
  }
}
names(test_kw) <- c("Cuantitativas", "Cualitativas", "p.valor")
write.table(test_kw, file = "kruskal-wallis_TD.txt", row.names = FALSE, append = FALSE)

test_kw_005 <- test_kw[test_kw$p.valor < 0.05,] # anovas con p-valor < 0.05
write.table(test_kw_005, file = "kruskal-wallis_005_TD.txt", row.names = FALSE, append = FALSE)

names(test_wilcox) <- c("Cuantitativas", "Cualitativas","Pair", "p.valor")
test_wilcox <- na.omit(test_wilcox) # quito los null values que son los pares del mismo tipo
test_wilcox$Pair <- str_replace(test_wilcox$Pair,"X", "") # quito las X que hay en la columna de pares de population
write.table(test_wilcox, file = "wilcox_TD.txt", row.names = FALSE, append = FALSE)

test_wilcox_005 <- filter(test_wilcox, p.valor < 0.05) # filtrar los pares con p-valor < 0.05
write.table(test_wilcox_005, file = "wilcox_005_TD.txt", row.names = FALSE, append = FALSE) # guardar en un archivo .txt

## TEST DE HOMOCEDASTICIDAD (HOMOGENEIDAD DE VARIANZAS) LEVENE
test <- data.frame() # data frame vacio donde almacenar todos los resultados 
for(numerica in 6:10){ # recorro las columnas de variables numericas
  for(categorica in 1:5){ # recorro las columnas de las variables categoricas
    levene <- leveneTest(td[,numerica][[1]] ~ td[,categorica][[1]], data = td) # test de levene en cada variable categorica para cada variable numerica
    test <- rbind(test, data.frame(names(td[numerica]), names(td[categorica]), levene[1,3]))
  }
}
names(test) <- c("Numericas", "Categoricas", "p.value") # nombres a las columnas
test <- test %>% filter(p.value > 0.05) # me quedo con las que tienen la misma varianza con un nivel de significancia del 95%
write.table(test, file = "levene_TD.txt", row.names = FALSE, append = FALSE) # guardo en un archivo .txt

## boxplots por ssp
b1 <- ggplot(td[!is.na(td$DE_CRF),], aes(y=Subspecies,x=DE_CRF, color = Subspecies)) + 
  geom_boxplot(fill="#E0EEE0", alpha = 0.9) +
  scale_color_brewer(palette="Greens") +
  theme(legend.position = "none")
b2 <- ggplot(td[!is.na(td$DE_Ll),], aes(y=Subspecies,x=DE_Ll, color = Subspecies)) + 
  geom_boxplot(fill="#79CDCD", alpha = 0.9) +
  scale_color_brewer(palette="Blues") +
  theme(legend.position = "none", axis.title.y=element_blank())
b3 <- ggplot(td[!is.na(td$DE_J),], aes(y=Subspecies,x=DE_J, color = Subspecies)) + 
  geom_boxplot(fill="#CDB5CD", alpha = 0.9) +
  scale_color_brewer(palette="Purples") +
  theme(legend.position = "none", axis.title.y=element_blank())
b4 <- ggplot(td[!is.na(td$DM_CRF),], aes(y=Subspecies,x=DM_CRF, color = Subspecies)) + 
  geom_boxplot(fill="#FFFACD", alpha = 0.9) +
  scale_color_brewer(palette="YlOrBr") +
  theme(legend.position = "none", axis.title.y=element_blank())
b5 <- ggplot(td[!is.na(td$DM_Ll),], aes(y=Subspecies,x=DM_Ll, color = Subspecies)) + 
  geom_boxplot(fill="#FFE4E1", alpha = 0.9) +
  scale_color_brewer(palette="RdPu") +
  theme(legend.position = "none", axis.title.y=element_blank())
ggarrange(plotlist = list(b1,b2,b3,b4,b5), nrow = 1, ncol = 5)

## boxplots por POP
b1 <- ggplot(td[!is.na(td$DE_CRF),], aes(y=Pop,x=DE_CRF, color = Pop)) + 
  geom_boxplot(fill="#E0EEE0", alpha = 0.9) +
  scale_color_brewer(palette="Greens") +
  theme(legend.position = "none")
b2 <- ggplot(td[!is.na(td$DE_Ll),], aes(y=Pop,x=DE_Ll, color = Pop)) + 
  geom_boxplot(fill="#79CDCD", alpha = 0.9) +
  scale_color_brewer(palette="Blues") +
  theme(legend.position = "none", axis.title.y=element_blank())
b3 <- ggplot(td[!is.na(td$DE_J),], aes(y=Pop,x=DE_J, color = Pop)) + 
  geom_boxplot(fill="#CDB5CD", alpha = 0.9) +
  scale_color_brewer(palette="Purples") +
  theme(legend.position = "none", axis.title.y=element_blank())
b4 <- ggplot(td[!is.na(td$DM_CRF),], aes(y=Pop,x=DM_CRF, color = Pop)) + 
  geom_boxplot(fill="#FFFACD", alpha = 0.9) +
  scale_color_brewer(palette="YlOrBr") +
  theme(legend.position = "none", axis.title.y=element_blank())
b5 <- ggplot(td[!is.na(td$DM_Ll),], aes(y=Pop,x=DM_Ll, color = Pop)) + 
  geom_boxplot(fill="#FFE4E1", alpha = 0.9) +
  scale_color_brewer(palette="RdPu") +
  theme(legend.position = "none", axis.title.y=element_blank())
ggarrange(plotlist = list(b1,b2,b3,b4,b5), nrow = 1, ncol = 5)

## boxplots por F
b1 <- ggplot(td[!is.na(td$DE_CRF),], aes(y=F,x=DE_CRF, color = F)) + 
  geom_boxplot(fill="#E0EEE0", alpha = 0.9) +
  scale_color_brewer(palette="Greens") +
  theme(legend.position = "none")
b2 <- ggplot(td[!is.na(td$DE_Ll),], aes(y=F,x=DE_Ll, color = F)) + 
  geom_boxplot(fill="#79CDCD", alpha = 0.9) +
  scale_color_brewer(palette="Blues") +
  theme(legend.position = "none", axis.title.y=element_blank())
b3 <- ggplot(td[!is.na(td$DE_J),], aes(y=F,x=DE_J, color = F)) + 
  geom_boxplot(fill="#CDB5CD", alpha = 0.9) +
  scale_color_brewer(palette="Purples") +
  theme(legend.position = "none", axis.title.y=element_blank())
b4 <- ggplot(td[!is.na(td$DM_CRF),], aes(y=F,x=DM_CRF, color = F)) + 
  geom_boxplot(fill="#FFFACD", alpha = 0.9) +
  scale_color_brewer(palette="YlOrBr") +
  theme(legend.position = "none", axis.title.y=element_blank())
b5 <- ggplot(td[!is.na(td$DM_Ll),], aes(y=F,x=DM_Ll, color = F)) + 
  geom_boxplot(fill="#FFE4E1", alpha = 0.9) +
  scale_color_brewer(palette="RdPu") +
  theme(legend.position = "none", axis.title.y=element_blank())
ggarrange(plotlist = list(b1,b2,b3,b4,b5), nrow = 1, ncol = 5)

## boxplots por M
b1 <- ggplot(td[!is.na(td$DE_CRF),], aes(y=M_VrnA1,x=DE_CRF, color = M_VrnA1)) + 
  geom_boxplot(fill="#E0EEE0", alpha = 0.9) +
  scale_color_brewer(palette="Greens") +
  theme(legend.position = "none")
b2 <- ggplot(td[!is.na(td$DE_Ll),], aes(y=M_VrnA1,x=DE_Ll, color = M_VrnA1)) + 
  geom_boxplot(fill="#79CDCD", alpha = 0.9) +
  scale_color_brewer(palette="Blues") +
  theme(legend.position = "none", axis.title.y=element_blank())
b3 <- ggplot(td[!is.na(td$DE_J),], aes(y=M_VrnA1,x=DE_J, color = M_VrnA1)) + 
  geom_boxplot(fill="#CDB5CD", alpha = 0.9) +
  scale_color_brewer(palette="Purples") +
  theme(legend.position = "none", axis.title.y=element_blank())
b4 <- ggplot(td[!is.na(td$DM_CRF),], aes(y=M_VrnA1,x=DM_CRF, color = M_VrnA1)) + 
  geom_boxplot(fill="#FFFACD", alpha = 0.9) +
  scale_color_brewer(palette="YlOrBr") +
  theme(legend.position = "none", axis.title.y=element_blank())
b5 <- ggplot(td[!is.na(td$DM_Ll),], aes(y=M_VrnA1,x=DM_Ll, color = M_VrnA1)) + 
  geom_boxplot(fill="#FFE4E1", alpha = 0.9) +
  scale_color_brewer(palette="RdPu") +
  theme(legend.position = "none", axis.title.y=element_blank())
ggarrange(plotlist = list(b1,b2,b3,b4,b5), nrow = 1, ncol = 5)

b1 <- ggplot(td[!is.na(td$DE_CRF),], aes(y=M_VrnB1,x=DE_CRF, color = M_VrnB1)) + 
  geom_boxplot(fill="#E0EEE0", alpha = 0.9) +
  scale_color_brewer(palette="Greens") +
  theme(legend.position = "none")
b2 <- ggplot(td[!is.na(td$DE_Ll),], aes(y=M_VrnB1,x=DE_Ll, color = M_VrnB1)) + 
  geom_boxplot(fill="#79CDCD", alpha = 0.9) +
  scale_color_brewer(palette="Blues") +
  theme(legend.position = "none", axis.title.y=element_blank())
b3 <- ggplot(td[!is.na(td$DE_J),], aes(y=M_VrnB1,x=DE_J, color = M_VrnB1)) + 
  geom_boxplot(fill="#CDB5CD", alpha = 0.9) +
  scale_color_brewer(palette="Purples") +
  theme(legend.position = "none", axis.title.y=element_blank())
b4 <- ggplot(td[!is.na(td$DM_CRF),], aes(y=M_VrnB1,x=DM_CRF, color = M_VrnB1)) + 
  geom_boxplot(fill="#FFFACD", alpha = 0.9) +
  scale_color_brewer(palette="YlOrBr") +
  theme(legend.position = "none", axis.title.y=element_blank())
b5 <- ggplot(td[!is.na(td$DM_Ll),], aes(y=M_VrnB1,x=DM_Ll, color = M_VrnB1)) + 
  geom_boxplot(fill="#FFE4E1", alpha = 0.9) +
  scale_color_brewer(palette="RdPu") +
  theme(legend.position = "none", axis.title.y=element_blank())
ggarrange(plotlist = list(b1,b2,b3,b4,b5), nrow = 1, ncol = 5)


## ESTUDIO DETALLADO DE LOS GRUPOS HOMOCEDASTICOS (de igual varianza segun levene)
# 1. TEST DE NORMALIDAD POR GRUPOS Kolmogorov-Smirnov con la corrección de Lilliefors + SHAPIRO-WILK
# 2. ANOVA + TUKEY
# 3. KRUSKAL - WALLIS + WILLCOX

## DE_J ~ SSP
# 1. normalidad
by(data = td,INDICES = td$Subspecies,FUN = function(x){ lillie.test(x$DE_J)})
by(data = td,INDICES = td$Subspecies,FUN = function(x){ shapiro.test(x$DE_J)})
# 2. anova
anova <- aov(td$DE_J ~ td$Subspecies)
summary(anova)
plot(anova)
pairwise.t.test(x = td$DE_J, g = td$Subspecies, p.adjust.method = "holm",
                pool.sd = TRUE, paired = FALSE, alternative = "two.sided")
## eliminando outliers
g_caja<-boxplot(td$DE_J, col="skyblue", frame.plot=F)
g_caja$out
td<-td[!(td$DE_J %in% g_caja$out),]
boxplot(td$DE_J, col="skyblue", frame.plot=F)
by(data = td,INDICES = td$Subspecies,FUN = function(x){ lillie.test(x$DE_J)})
by(data = td,INDICES = td$Subspecies,FUN = function(x){ shapiro.test(x$DE_J)})
anova <- aov(td$DE_J ~ td$Subspecies)
summary(anova)
plot(anova)
pairwise.t.test(x = td$DE_J, g = td$Subspecies, p.adjust.method = "holm",
                pool.sd = TRUE, paired = FALSE, alternative = "two.sided")
# 3. kw
kw <- kruskal.test(td$DE_J ~ td$Subspecies, data = td)
wilcox <- pairwise.wilcox.test(x = td$DE_J, g = td$Subspecies, p.adjust.method = "holm" )
wilcox


# ANALISIS MVRNA1 - LONGITUD, ALTITUD, LATITUD - TEMPERATURA
# cargar tabla de variables ecogeograficas y seleccionar las que me interesan
var_eco <- read.delim("C:/Users/Elia/Desktop/genetica/coordenadas y variables ecoclimaticas/CAPFITOGEN3/analisis/TD/results/EcogeographicCharacterization_Spain/TablaVarEcogeograficasspain.txt")
var_eco <- arrange(var_eco, ACCENUMB) # la ordeno segun el valor de AGL
names(var_eco)[1] <- "AGL"
# selecciono las variables de lat, long y alt, asi como las relacionadas con temperatura
var_eco <- select(var_eco, c(1:4,10,11,31:73))
var_eco$AGL <- as.factor(var_eco$AGL)

# Tabla de datos de TD con los datos de los marcadores - en este caso nos va a interesar MVRNA1
setwd("C:/Users/Elia/Desktop/genetica/analisis_patri/TRIGO DURO")
td <- read_excel("Datos TD.xlsx", na = c("NA","-","?")) # cargar datos
td <- td[!is.na(td$Longitude),]
td <- td[!is.na(td$Latitude),]
td <- select(td,c(1,12)) # seleccionar columnas que me interesan
names(td) <- gsub("-", "_", names(td)) # cambiar guiones por guion bajo para que no haya problema al programar
names(td)[1] <- "AGL"
td$AGL <- as.factor(as.numeric(substr(td$AGL,5,7)))
# cruzar tabla de variables ecogeograficas de interes con datos de marcadores de patri por la columna AGL
todo <- merge(var_eco, td, by = "AGL")
todo <- todo %>% mutate_at(50, as.factor) # convertir las columnas de variables categoricas en tipo factor
write.table(todo, file = "mvrna1_ecoclimaticas_TD.txt", row.names = FALSE, append = FALSE)

## ANOVA - LONG, LAT, ALT, TEMP ~ MVRNA1
# ANOVA + TUKEY CON TODOS LOS DATOS
test_anova <- data.frame() # parametrico
test_tukey <- data.frame() # post hoc
dir.create("pairwise_boxplots_ecoclimaticas_td") # directorio donde almacenar los boxplots por pares del test Tukey
for(numerica in 2:49){ # recorro las columnas de variables numericas
  for(categorica in 50:50){ # recorro las columnas de las variables categoricas
    # TEST ANOVA
    anova <- aov(todo[,numerica] ~ as.factor(todo[,categorica]), data = todo)
    test_anova <- rbind(test_anova, data.frame(names(todo[numerica]), names(todo[categorica]), data.frame(summary(anova)[[1]])[1,5]))
    # test post hoc para las significativas (p-valor < 0.05)
    if(data.frame(summary(anova)[[1]])[1,5] < 0.05){
      tukey <- data.frame(TukeyHSD(anova)[["as.factor(todo[, categorica])"]])
      tukey <- cbind(tukey, Cuantitativa = rep(names(todo[numerica]), nrow(tukey)), Cualitativa = rep(names(todo[categorica]), nrow(tukey)), Pair = row.names(tukey))
      test_tukey <- rbind(test_tukey, tukey)
      # # guardar box-plots en .png dentro de la carpeta que hemos creado
      # setwd("pairwise_boxplots_ecoclimaticas_td")
      # png(paste(names(todo[categorica]),"-",names(todo[numerica]),"_td.png")) # Dispositivo PNG
      # plot(TukeyHSD(anova)) # Código
      # dev.off() # Cerramos el dispositivo
      # setwd("C:/Users/Elia/Desktop/genetica/analisis_patri/TRIGO DURO")
    }
  }
}
names(test_anova) <- c("Cuantitativas", "Cualitativas", "p.valor")
write.table(test_anova, file = "anova_ecoclimaticas_td.txt", row.names = FALSE, append = FALSE)

test_anova_005 <- test_anova[test_anova$p.valor < 0.05,] # anovas con p-valor < 0.05
write.table(test_anova_005, file = "anova_ecoclimaticas_005_td.txt", row.names = FALSE, append = FALSE)

test_tukey = test_tukey[ , c(5,6,7,1,2,3,4)]
write.table(test_tukey, file = "Tukey_ecoclimaticas_td.txt", row.names = FALSE, append = FALSE)

test_tukey_005 <- test_tukey[test_tukey$p.adj < 0.05,] # tukeys con p-valor < 0.05
write.table(test_tukey_005, file = "tukey_ecoclimaticas_005_td.txt", row.names = FALSE, append = FALSE)

# KRUSKAL-WALLIS CON TODOS LOS DATOS
test_kw <- data.frame()
test_wilcox <- data.frame()
for(numerica in 2:49){ # recorro las columnas de variables numericas
  for(categorica in 50:50){ # recorro las columnas de las variables categoricas
    # TEST KRUSKAL-WALLIS
    kw <- kruskal.test(todo[,numerica] ~ as.factor(todo[,categorica]), data = todo)
    test_kw <- rbind(test_kw, data.frame(names(todo[numerica]), names(todo[categorica]), kw[["p.value"]]))
    if(kw[["p.value"]] < 0.05){  # test post hoc para las significativas (p-valor < 0.05)
      wilcox <- pairwise.wilcox.test(x = todo[,numerica], g = todo[,categorica], p.adjust.method = "holm" )      
      tmp <- data.frame(wilcox[["p.value"]]) # almacenar en una variable temporal la matriz de p-valores para poder recorrerla y convertirla en la tabla de datos
      for(i in 1:ncol(tmp)){
        for(j in 1:nrow(tmp)){
          test_wilcox <- rbind(test_wilcox, data.frame(names(todo[numerica]), names(todo[categorica]), str_c(c(names(tmp[i]), row.names(tmp[1])[j]), collapse = "-"), tmp[j,i]))
        }
      }
    }
  }
}
names(test_kw) <- c("Cuantitativas", "Cualitativas", "p.valor")
write.table(test_kw, file = "kruskal-wallis_ecoclimaticas_td.txt", row.names = FALSE, append = FALSE)

test_kw_005 <- test_kw[test_kw$p.valor < 0.05,] # anovas con p-valor < 0.05
write.table(test_kw_005, file = "kruskal-wallis_ecoclimaticas_005_td.txt", row.names = FALSE, append = FALSE)

names(test_wilcox) <- c("Cuantitativas", "Cualitativas","Pair", "p.valor")
test_wilcox <- na.omit(test_wilcox) # quito los null values que son los pares del mismo tipo
test_wilcox$Pair <- str_replace(test_wilcox$Pair,"X", "") # quito las X que hay en la columna de pares de population
write.table(test_wilcox, file = "wilcox_ecoclimaticas_td.txt", row.names = FALSE, append = FALSE)

test_wilcox_005 <- filter(test_wilcox, p.valor < 0.05) # filtrar los pares con p-valor < 0.05
write.table(test_wilcox_005, file = "wilcox_ecoclimaticas_005_td.txt", row.names = FALSE, append = FALSE) # guardar en un archivo .txt

igual <- merge(test_anova_005, test_kw_005, by="Cuantitativas")
igual <- select(igual, c(1,2,3,5))
names(igual) <- c("Cuantitativas","Cualitativas","p.valor_anova", "p.valor_kw")
write.table(igual, file = "coincidencias_anova_kw_td.txt", row.names = FALSE, append = FALSE) # guardar en un archivo .txt

dif <- anti_join(test_anova_005,test_kw_005, by="Cuantitativas")
