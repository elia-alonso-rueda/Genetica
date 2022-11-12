setwd("C:/Users/Elia/Desktop/genetica/TASSEL/analisis_ecococlimaticas/TD/LD_regiones")

library(dplyr)
library(stringr)
library(tidyverse)
library(datos)
library(ggplot2)

df <- read.delim("intervalos_raw_Bonferroni.txt")
# vamos a ver los diferentes traits que tenemos para trigo duro despues de la correccion de Bonferroni
unique(df$Trait)

# nuevo df en el que almacenar los bloques despues de haber analizado los solapamientos
new.df <- data.frame()

#####################
## trait por trait ##
#####################

# crear un directorio en el que almacenar los resultados
dir.create("Bloques_Bonferroni_1")
setwd("Bloques_Bonferroni_1")

tmp <- df[df$Trait == "bio_15" ,] # solo hay 1 asi que lo almacenamos en el nuevo data frame tal cual
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_4" ,] # no hay solapamientos ni secuencias contiguas. Lo añadimos todos al nuevo data frame
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_3" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_5" ,]
tmp <- tmp[(-5),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_12" ,]
tmp <- tmp[(-2),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_18" ,]
tmp <- tmp[(-10),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_17" ,] 
tmp <- tmp[(-17),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_13" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_14" ,]
tmp <- tmp[(-2),]
tmp <- tmp[(-3),]
tmp <- tmp[(-19),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "prec_10" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "prec_11" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "prec_4" ,]
tmp$Inicio[3] <- tmp$Inicio[1]
tmp$Final[3] <- tmp$Final[4] 
tmp <- tmp[(-1),]
tmp <- tmp[(-1),]
tmp <- tmp[(-2),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "prec_5" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "prec_6" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "prec_7" ,]
tmp <- tmp[(-3),]
tmp <- tmp[(-15),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "prec_8" ,]
tmp <- tmp[(-1),]
tmp <- tmp[(-12),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "prec_9" ,]
tmp <- tmp[(-6),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_2" ,]
tmp <- tmp[(-5),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_7" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmax_1" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmax_11" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmax_2" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmax_6" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmax_7" ,]
tmp <- tmp[(-5),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmax_8" ,]
tmp <- tmp[(-5),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmax_9" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmin_7" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmean_7" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmean_8" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmean_9" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_1" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_10" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_9" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "t_bulk_dens" ,]
tmp <- tmp[(-4),]
tmp$Inicio[5] <- tmp$Inicio[4]
tmp <- tmp[(-4),]
tmp <- tmp[(-11),]
tmp <- tmp[(-12),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "t_ph_hox" ,]
tmp$Final[6] <- tmp$Final[5]
tmp <- tmp[(-5),]
tmp <- tmp[(-9),]

new.df <- rbind(new.df, tmp)

write.table(new.df, "bloques_Bonferroni_TD_traits.txt", row.names = FALSE)

#vamos a visualizar el numero de asociaciones por trait
num_asociaciones <- c()
for (trait in unique(new.df$Trait)){
  num_asociaciones <- c(num_asociaciones, nrow(new.df[new.df$Trait == trait ,]))
}

asociaciones_por_trait <- data.frame(unique(new.df$Trait), num_asociaciones)
ggplot(asociaciones_por_trait, aes(x=unique.new.df.Trait., y=num_asociaciones)) + 
  geom_bar(stat = "identity", width=0.2) +
  coord_flip() +
  labs(x = "traits",y ="num de marcadores asociados") 

# new.df <- read.table("bloques_Bonferroni_TD_traits.txt", header = TRUE)

##################
## por regiones ##
##################
length(unique(new.df$Inicio))
length(unique(new.df$Final))

# vamos a ordenar las regiones segun su Chr
new.df <- arrange(new.df, Chr)

#le ponemos nombre a las regiones y contamos cuantas asociaciones por cromosoma tenemos
num_asociaciones <- c()
num_traits <- c()
for (ch in 1:length(unique(new.df$Chr))){
  print(paste(unique(new.df$Chr)[ch]))
  chr <- new.df %>% filter(Chr == unique(new.df$Chr)[ch])
  chr <- arrange(chr, Inicio)
  seq_name <- c()
  for (inicio in chr$Inicio){
    for (j in 1:length(unique(chr$Inicio))){
      if (inicio == unique(chr$Inicio)[j]){
        name <- str_c("TD",unique(new.df$Chr)[ch],j,sep="_")
        seq_name <- c(seq_name, name)
      }
    }
  }
  num_asociaciones <- c(num_asociaciones, length(unique(chr$Marker)))
  num_traits <- c(num_traits, length(unique(chr$Trait)))
  chr <- cbind(chr, seq_name)
  chr <- chr[ , c(8,1,2,3,4,5,6,7)]
  write.table(chr , file= paste("Bloques_", unique(new.df$Chr)[ch], ".txt", sep = "") ,sep="\t", append = FALSE, row.names = FALSE)
}

# vamos a visualizar el numero de asociaciones por cromosoma
asociaciones_por_cromosoma <- data.frame(unique(new.df$Chr), num_asociaciones)
ggplot(asociaciones_por_cromosoma, aes(x=unique.new.df.Chr., y=num_asociaciones)) + 
  geom_bar(stat = "identity", width=0.2) +
  coord_flip() +
  labs(x = "cromosomas",y ="num de marcadores asociados")

traits_por_cromosoma <- data.frame(unique(new.df$Chr), num_traits)
ggplot(traits_por_cromosoma, aes(x=unique.new.df.Chr., y=num_traits)) + 
  geom_bar(stat = "identity", width=0.2) +
  coord_flip() +
  labs(x = "cromosomas",y ="num de traits asociados")


# vamos revisando los bloques por cromosoma 1 a 1 y juntamos las secuencias contiguas o solapantes cuando las haya
# almacenamos en nueva tabla de la muerte 1 region de cada con el trait de menor p-valor para buscar los genes de cada region
tdlm <- data.frame()

# cromosoma 1A
tmp <- read.table("Bloques_1A.txt", header = TRUE)
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i)
  traits <- str_c(unique(tdlm_new_row$Trait), collapse = ", ")
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm_new_row$Trait <- traits
  tdlm <- rbind(tdlm, tdlm_new_row)
}

# cromosoma 1B
tmp <- read.table("Bloques_1B.txt", header = TRUE) #no hay contiguas ni solapantes
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i)
  traits <- str_c(unique(tdlm_new_row$Trait), collapse = ", ")
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm_new_row$Trait <- traits
  tdlm <- rbind(tdlm, tdlm_new_row)
}

# cromosoma 2A
tmp <- read.table("Bloques_2A.txt", header = TRUE) #no hay contiguas ni solapantes
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i)
  traits <- str_c(unique(tdlm_new_row$Trait), collapse = ", ")
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm_new_row$Trait <- traits
  tdlm <- rbind(tdlm, tdlm_new_row)
}

# cromosoma 2B
tmp <- read.table("Bloques_2B.txt", header = TRUE) # la 3 y la 4 solapan
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i)
  traits <- str_c(unique(tdlm_new_row$Trait), collapse = ", ")
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm_new_row$Trait <- traits
  tdlm <- rbind(tdlm, tdlm_new_row)
}

# cromosoma 3A
tmp <- read.table("Bloques_3A.txt", header = TRUE) # solo hay una secuencia
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i)
  traits <- str_c(unique(tdlm_new_row$Trait), collapse = ", ")
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm_new_row$Trait <- traits
  tdlm <- rbind(tdlm, tdlm_new_row)
}

# cromosoma 3B
tmp <- read.table("Bloques_3B.txt", header = TRUE) # no hay solapantes ni contiguas
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i)
  traits <- str_c(unique(tdlm_new_row$Trait), collapse = ", ")
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm_new_row$Trait <- traits
  tdlm <- rbind(tdlm, tdlm_new_row)
}

# cromosoma 4A
tmp <- read.table("Bloques_4A.txt", header = TRUE) # no hay solapantes ni contiguas
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i)
  traits <- str_c(unique(tdlm_new_row$Trait), collapse = ", ")
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm_new_row$Trait <- traits
  tdlm <- rbind(tdlm, tdlm_new_row)
}

# cromosoma 4B
tmp <- read.table("Bloques_4B.txt", header = TRUE) # no hay solapantes ni contiguas
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i)
  traits <- str_c(unique(tdlm_new_row$Trait), collapse = ", ")
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm_new_row$Trait <- traits
  tdlm <- rbind(tdlm, tdlm_new_row)
}

# cromosoma 5A
tmp <- read.table("Bloques_5A.txt", header = TRUE) # no hay solapantes ni contiguas
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i)
  traits <- str_c(unique(tdlm_new_row$Trait), collapse = ", ")
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm_new_row$Trait <- traits
  tdlm <- rbind(tdlm, tdlm_new_row)
}

# cromosoma 5B
tmp <- read.table("Bloques_5B.txt", header = TRUE) # no hay solapantes ni contiguas
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i)
  traits <- str_c(unique(tdlm_new_row$Trait), collapse = ", ")
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm_new_row$Trait <- traits
  tdlm <- rbind(tdlm, tdlm_new_row)
}

# cromosoma 6A
tmp <- read.table("Bloques_6A.txt", header = TRUE) # no hay solapantes ni contiguas
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i)
  traits <- str_c(unique(tdlm_new_row$Trait), collapse = ", ")
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm_new_row$Trait <- traits
  tdlm <- rbind(tdlm, tdlm_new_row)
}

# cromosoma 6B
tmp <- read.table("Bloques_6B.txt", header = TRUE) # no hay solapantes ni contiguas
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i)
  traits <- str_c(unique(tdlm_new_row$Trait), collapse = ", ")
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm_new_row$Trait <- traits
  tdlm <- rbind(tdlm, tdlm_new_row)
}

# cromosoma 7A
tmp <- read.table("Bloques_7A.txt", header = TRUE) # no hay solapantes ni contiguas
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i)
  traits <- str_c(unique(tdlm_new_row$Trait), collapse = ", ")
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm_new_row$Trait <- traits
  tdlm <- rbind(tdlm, tdlm_new_row)
}

# cromosoma 7B
tmp <- read.table("Bloques_7B.txt", header = TRUE) # no hay solapantes ni contiguas
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i)
  traits <- str_c(unique(tdlm_new_row$Trait), collapse = ", ")
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm_new_row$Trait <- traits
  tdlm <- rbind(tdlm, tdlm_new_row)
}


# guardar los nuevos bloques en un archivo nuevo
write.table(tdlm, "bloques_Bonferroni_TD.txt", row.names = FALSE)

#################################
# una vez hemos sacado los genes de bloques_Bonferroni_TD con anotaciones_TD, le voy a poner otra columna a bloques_Bonferroni_TD con el numero de genes que tiene cada region
setwd("C:/Users/Elia/Desktop/genetica/TASSEL/analisis_ecococlimaticas/TD/LD_regiones/Bloques_Bonferroni_1")
tdlm <- read.table("bloques_Bonferroni_TD.txt", header = TRUE)
notes <- read.table("results_TD 2022-06-06/summary_TD.txt", header = TRUE)
num_of_genes <- c()
for (seq in unique(notes$Secuencia)){
  tmp <- notes %>% filter(Secuencia == seq)
  num_of_genes <- c(num_of_genes, unique(tmp$num.genes))
}


# 5B_1 no tiene genes con lon cual hay que añadir el 0 manualmente
n_genes_completo <- num_of_genes[1:72]
n_genes_completo <- c(n_genes_completo, 0)
n_genes_completo <- c(n_genes_completo, num_of_genes[73:length(num_of_genes)])
# le uno a la tabla de la muerte la columna con el numero de genes que tiene cada region
tdlm$num_de_genes <- n_genes_completo
write.table(tdlm, "bloques_Bonferroni_TD_genes.txt", sep="\t", append = FALSE, row.names = FALSE)

#para visualizacion
tdlm$Marker <- NULL
tdlm$Chr <- NULL
tdlm$Pos <- NULL
tdlm$p <- NULL
