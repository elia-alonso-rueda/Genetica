library(tidyverse)
library(hrbrthemes)
library(viridis)
library(readxl)
library(RColorBrewer)
library(ggpubr)
library(gridExtra)
library(car)
setwd("C:/Users/Elia/Desktop/genetica/analisis_patri")
 ## PLOTS PARA EXPLORATORY DATA ANALYSIS ##
## TD ## 
td <- read_excel("Datos TD.xlsx", na = "NA") # cargar datos
td <- select(td,-(1:2),-(4:9)) # seleccionar columnas que me interesan
names(td) <- gsub("-", "_", names(td))
summary(td)
# VARIABLES CATEGORICAS
## M_VrnA1
### POBLACION GENERAL
p1 <- ggplot(td[!is.na(td$M_VrnA1),], aes(x = M_VrnA1, fill = M_VrnA1)) + 
  geom_bar(position="stack", stat="count") +
  scale_fill_brewer(palette='Dark2', na.value = '#F0FFFF') +
  theme(legend.position = "bottom", legend.title = element_blank())
### POR POP
p2 <- ggplot(td[!is.na(td$M_VrnA1),], aes(fill= M_VrnA1, x = Pop)) + 
  geom_bar(position="fill", stat="count") +
  scale_fill_brewer(palette='Dark2', na.value = '#F0FFFF') +
  theme(legend.position = "bottom", legend.title = element_blank(), axis.title.y=element_blank())
### POR SSP
p3 <- ggplot(td[!is.na(td$M_VrnA1),], aes(fill= M_VrnA1, x = Subspecies)) + 
  geom_bar(position="fill", stat="count") +
  scale_fill_brewer(palette='Dark2', na.value = '#F0FFFF') +
  theme(legend.position = "bottom", legend.title = element_blank(), axis.title.y=element_blank())
ggarrange(plotlist = list(p1, p2, p3), ncol=3, common.legend = TRUE, legend = "bottom")
## M_VrnB1
### POBLACION GENERAL
p1 <- ggplot(td[!is.na(td$M_VrnB1),], aes(x = M_VrnB1, fill = M_VrnB1)) + 
  geom_bar(position="stack", stat="count") +
    scale_fill_brewer(palette='Set1', na.value = '#F0FFFF') +
  theme(legend.position = "bottom", legend.title = element_blank())
### POR POP
p2 <- ggplot(td[!is.na(td$M_VrnB1),], aes(fill= M_VrnB1, x = Pop)) + 
  geom_bar(position="fill", stat="count") +
  scale_fill_brewer(palette='Set1', na.value = '#F0FFFF') +
  theme(legend.position = "bottom", legend.title = element_blank(), axis.title.y=element_blank())
### POR SSP
p3 <- ggplot(td[!is.na(td$M_VrnB1),], aes(fill= M_VrnB1, x = Subspecies)) + 
  geom_bar(position="fill", stat="count") +
  scale_fill_brewer(palette='Set1', na.value = '#F0FFFF') +
  theme(legend.position = "bottom", legend.title = element_blank(), axis.title.y=element_blank())
ggarrange(plotlist = list(p1, p2, p3), ncol=3, common.legend = TRUE, legend = "bottom")
## F
### POBLACION GENERAL
p1 <- ggplot(td[!is.na(td$`F`),], aes(x = `F`, fill = `F`)) + 
  geom_bar(position="stack", stat="count") +
  #scale_fill_brewer(palette='Set2', na.value = '#F0FFFF') +
  theme(legend.position = "bottom", legend.title = element_blank())
### POR POP
p2 <- ggplot(td[!is.na(td$`F`),], aes(fill= `F`, x = Pop)) + 
  geom_bar(position="fill", stat="count") +
  #scale_fill_brewer(palette='Set2', na.value = '#F0FFFF') +
  theme(legend.position = "bottom", legend.title = element_blank(), axis.title.y=element_blank())
### POR SSP
p3 <- ggplot(td[!is.na(td$`F`),], aes(fill= `F`, x = Subspecies)) + 
  geom_bar(position="fill", stat="count") +
  #scale_fill_brewer(palette='Set2', na.value = '#F0FFFF') +
  theme(legend.position = "bottom", legend.title = element_blank(), axis.title.y=element_blank())
ggarrange(plotlist = list(p1, p2, p3), ncol=3, common.legend = TRUE, legend = "bottom")
# VARIABLES NUMERICAS
## summary
summary_td <- apply(td[,6:10], 2, summary)
summary_td <- rbind(summary_td, var = apply(td[,6:10], 2, var))
summary_td <- rbind(summary_td, sd = apply(td[,6:10], 2, sd))
summary_td <- data.frame(summary_td)
write.table(summary_td, file = "summary_numericas_TD.txt", row.names = TRUE, append = FALSE)
## plots
# DE
### POB GENERAL
g1 <- ggplot(td[!is.na(td$DE_CRF),], aes(x=DE_CRF)) + geom_density(fill="#E0EEE0") + theme(axis.title.y=element_blank()) 
g2 <- ggplot(td[!is.na(td$DE_Ll),], aes(x=DE_Ll)) + geom_density(fill="#79CDCD") + theme(axis.title.y=element_blank())
g3 <- ggplot(td[!is.na(td$DE_J),], aes(x=DE_J)) + geom_density(fill="#CDB5CD") + theme(axis.title.y=element_blank())
g4 <- ggplot(td[!is.na(td$DE_CRF),], aes(x=DE_CRF)) + geom_boxplot(fill="#E0EEE0") + theme(axis.title.y=element_blank(), axis.title.x=element_blank()) 
g5 <- ggplot(td[!is.na(td$DE_Ll),], aes(x=DE_Ll)) + geom_boxplot(fill="#79CDCD") + theme(axis.title.y=element_blank(), axis.title.x=element_blank())
g6 <- ggplot(td[!is.na(td$DE_J),], aes(x=DE_J)) + geom_boxplot(fill="#CDB5CD") + theme(axis.title.y=element_blank(), axis.title.x=element_blank())
ggarrange(plotlist = list(g4, g5, g6, g1, g2, g3), ncol = 3, nrow = 2, common.legend = TRUE, legend = "bottom")
### POR POP
g1 <- ggplot(td[!is.na(td$DE_CRF),], aes(y=as.factor(Pop),x=DE_CRF, color = as.factor(Pop))) + 
  geom_boxplot(fill="#E0EEE0", alpha = 0.9) +
  scale_color_brewer(palette="Greens") +
  theme(legend.position = "none", axis.title.y=element_blank(), axis.title.x=element_blank())
g2 <- ggplot(td[!is.na(td$DE_Ll),], aes(y=as.factor(Pop),x=DE_Ll, color = as.factor(Pop))) + 
  geom_boxplot(fill="#79CDCD", alpha = 0.9) +
  scale_color_brewer(palette="Blues") +
  theme(legend.position = "none", axis.title.y=element_blank(), axis.title.x=element_blank())
g3 <- ggplot(td[!is.na(td$DE_J),], aes(y=as.factor(Pop),x=DE_J, color = as.factor(Pop))) + 
  geom_boxplot(fill="#CDB5CD", alpha = 0.9) +
  scale_color_brewer(palette="Purples") +
  theme(legend.position = "none", axis.title.y=element_blank(), axis.title.x=element_blank())
### POR SSP
g4 <- ggplot(td[!is.na(td$DE_CRF),], aes(y=Subspecies,x=DE_CRF, color = Subspecies)) + 
  geom_boxplot(fill="#E0EEE0", alpha = 0.9) +
  scale_color_brewer(palette="Greens") +
  theme(legend.position = "none", axis.title.y=element_blank())
g5 <- ggplot(td[!is.na(td$DE_Ll),], aes(y=Subspecies,x=DE_Ll, color = Subspecies)) + 
  geom_boxplot(fill="#79CDCD", alpha = 0.9) +
  scale_color_brewer(palette="Blues") +
  theme(legend.position = "none", axis.title.y=element_blank())
g6 <- ggplot(td[!is.na(td$DE_J),], aes(y=Subspecies,x=DE_J, color = Subspecies)) + 
  geom_boxplot(fill="#CDB5CD", alpha = 0.9) +
  scale_color_brewer(palette="Purples") +
  theme(legend.position = "none", axis.title.y=element_blank())
ggarrange(plotlist = list(g1, g2, g3, g4, g5, g6), nrow = 2, ncol = 3)

# DM
### POB GENERAL - CRF
g1 <- ggplot(td[!is.na(td$DM_CRF),], aes(x=DM_CRF)) + geom_density(fill="#FFFACD") + theme(axis.title.y=element_blank())
g2 <- ggplot(td[!is.na(td$DM_CRF),], aes(x=DM_CRF)) + geom_boxplot(fill="#FFFACD") + theme(axis.title.y=element_blank(), axis.title.x=element_blank())
### POP - CRF
g3 <- ggplot(td[!is.na(td$DM_CRF),], aes(y=as.factor(Pop),x=DM_CRF, color = as.factor(Pop))) + 
  geom_boxplot(fill="#FFFACD", alpha = 0.9) +
  scale_color_brewer(palette="YlOrBr") +
  theme(legend.position = "none", axis.title.y=element_blank(), axis.title.x=element_blank())
### SSP - CRF
g4 <- ggplot(td[!is.na(td$DM_CRF),], aes(y=Subspecies,x=DM_CRF, color = Subspecies)) + 
  geom_boxplot(fill="#FFFACD", alpha = 0.9) +
  scale_color_brewer(palette="YlOrBr") +
  theme(legend.position = "none", axis.title.y=element_blank(), axis.title.x=element_blank())
### POB GENERAL
### POB GENERAL - Ll
g5 <- ggplot(td[!is.na(td$DM_Ll),], aes(x=DM_Ll)) + geom_density(fill="#FFE4E1") + theme(axis.title.y=element_blank())
g6 <- ggplot(td[!is.na(td$DM_Ll),], aes(x=DM_Ll)) + geom_boxplot(fill="#FFE4E1") + theme(axis.title.y=element_blank(), axis.title.x=element_blank())
### POP - Ll
g7 <- ggplot(td[!is.na(td$DM_Ll),], aes(y=as.factor(Pop),x=DM_Ll, color = as.factor(Pop))) + 
  geom_boxplot(fill="#FFE4E1", alpha = 0.9) +
  scale_color_brewer(palette="RdPu") +
  theme(legend.position = "none", axis.title.y=element_blank(), axis.title.x=element_blank())
### SSP - Ll
g8 <- ggplot(td[!is.na(td$DM_Ll),], aes(y=Subspecies,x=DM_Ll, color = Subspecies)) + 
  geom_boxplot(fill="#FFE4E1", alpha = 0.9) +
  scale_color_brewer(palette="RdPu") +
  theme(legend.position = "none", axis.title.y=element_blank(), axis.title.x=element_blank())
ggarrange(plotlist = list(g1, g2, g3, g4, g5, g6, g7, g8), nrow = 2, ncol = 4)

## TEST DE NORMALIDAD SHAPIRO-WILK, ANOVA, KRUSKAL-WALLIS, y TUKEY CON TODAS LAS VARIABLES ## 
test_sw <- data.frame()
test_anova <- data.frame() # parametrico
test_kw <- data.frame() # no parametrico
test_tukey <- data.frame() # post hoc
for(numerica in 6:10){ # recorro las columnas de variables numericas
  # TEST SHAPIRO - WILK
  test_sw <- rbind(test_sw, data.frame(names(td[numerica]), shapiro.test(td[,numerica][[1]])[["statistic"]], shapiro.test(td[,numerica][[1]])[["p.value"]]))
  for(categorica in 1:5){ # recorro las columnas de las variables categoricas
    # TEST ANOVA
    anova <- aov(td[,numerica][[1]] ~ as.factor(td[,categorica][[1]]), data = td)
    test_anova <- rbind(test_anova, data.frame(names(td[numerica]), names(td[categorica]), data.frame(summary(anova)[[1]])[1,5]))
    kw <- kruskal.test(td[,numerica][[1]] ~ as.factor(td[,categorica][[1]]), data = td)
    test_kw <- rbind(test_kw, data.frame(names(td[numerica]),names(td[categorica]), kw[["p.value"]]))
    # test post hoc para las significativas (p-valor < 0.05)
    if(data.frame(summary(anova)[[1]])[1,5] < 0.05){
      print(data.frame(summary(anova)[[1]])[1,5])
      tukey <- data.frame(TukeyHSD(anova)[["as.factor(td[, categorica][[1]])"]])
      tukey <- cbind(tukey, rep(names(td[numerica]), nrow(tukey)), rep(names(td[categorica]), nrow(tukey)))
      test_tukey <- rbind(test_tukey, tukey)
      # guardar box-plots en .png
      png(paste(names(td[categorica]),"-",names(td[numerica]),"-TD.png")) # Dispositivo PNG
      plot(TukeyHSD(anova)) # Código
      dev.off() # Cerramos el dispositivo
    }
  }
}
names(test_sw) <- c("Variable", "Statistic", "p.value")
names(test_anova) <- c("Cualitativas", "Cuantitativas", "p.valor")
test_anova_005 <- test_anova[test_anova$p.valor < 0.05,] # anovas con p-valor < 0.05
names(test_kw) <- c("Cualitativas", "Cuantitativas", "p.valor")
test_kw_005 <- test_kw[test_kw$p.valor < 0.05,] # anovas con p-valor < 0.05
names(test_tukey)[5] <- "Cuantitativa"
names(test_tukey)[6] <- "Cualitativa"
write.table(test_sw, file = "shapiro_wilk_TD.txt", row.names = FALSE, append = FALSE)
write.table(test_anova, file = "anova_TD.txt", row.names = FALSE, append = FALSE)
write.table(test_anova_005, file = "anova_005_TD.txt", row.names = FALSE, append = FALSE)
write.table(test_tukey, file = "Tukey_TD.txt", row.names = TRUE, append = FALSE)

## TEST LEVENE DE HOMOGENEIDAD DE VARIANZA ##
test_levene <- data.frame()
for(numerica in 6:10){ # recorro las columnas de variables numericas
  for(categorica in 1:5){ # recorro las columnas de las variables categoricas
    levene <- leveneTest(td[,numerica][[1]] ~ as.factor(td[,categorica][[1]]), data = td)
    test_levene <- rbind(test_levene, data.frame(names(td[numerica]), names(td[categorica]), levene[1,3]))
  }
}
names(test_levene) <- c("Numericas", "Categoricas", "p.value")
test_levene <- test_levene %>% filter(p.value > 0.05)
boxplot(DE_CRF ~ Subspecies,
        data = td,
        main = "DE_CRF Distribution by MVrnB1",
        xlab = "MVrnB1",
        ylab = "DE_CRF",
        col = "steelblue",
        border = "black")

tmp <- pairwise.wilcox.test(x = td$DE_CRF, g = td$Subspecies, p.adjust.method = "holm" )

kw <- kruskal.test(td[,6][[1]] ~ as.factor(td[,1][[1]]), data = td)
