setwd("C:/Users/Elia/Desktop/genetica/TASSEL/analisis_ecococlimaticas/TD/LD_regiones")

library(dplyr)
library(stringr)

df <- read.delim("intervalos_raw_Bonferroni.txt")
# vamos a ver los diferentes traits que tenemos para trigo duro despues de la correccion de Bonferroni
unique(df$Trait)
# nuevo df en el que almacenar los bloques despues de haber analizado los solapamientos
new.df <- data.frame()

#####################
## trait por trait ##
#####################

# crear un directorio en el que almacenar los resultados
dir.create("Bloques_Bonferroni")
setwd("Bloques_Bonferroni")

tmp <- df[df$Trait == "bio_15" ,] # solo hay 1 asi que lo almacenamos en el nuevo data frame tal cual
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_4" ,] # no hay solapamientos ni secuencias contiguas. Lo añadimos todos al nuevo data frame
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_5" ,]
tmp <- tmp[(-2),]
tmp <- tmp[(-6),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_6" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_12" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_18" ,]
tmp <- tmp[(-2),]
tmp <- tmp[(-7),]
tmp <- tmp[(-7),]
tmp <- tmp[(-9),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_17" ,] 
tmp <- tmp[(-2),]
tmp[6,7] <- tmp[8,7]
tmp <- tmp[(-7),]
tmp <- tmp[(-7),]
tmp <- tmp[(-8),]
tmp <- tmp[(-11),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_14" ,]
tmp <- tmp[(-2),]
tmp <- tmp[(-9),]
tmp <- tmp[(-11),]
tmp <- tmp[(-13),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "prec_10" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "prec_4" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "prec_5" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "prec_6" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "prec_7" ,]
tmp <- tmp[(-2),]
tmp <- tmp[(-6),]
tmp <- tmp[(-9),]
tmp <- tmp[(-10),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "prec_8" ,]
tmp <- tmp[(-1),]
tmp <- tmp[(-5),]
tmp <- tmp[(-8),]
tmp <- tmp[(-10),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "prec_9" ,]
tmp <- tmp[(-1),]
tmp <- tmp[(-7),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_2" ,]
tmp <- tmp[(-1),]
tmp <- tmp[(-4),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_7" ,]
tmp <- tmp[(-1),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmax_6" ,]
tmp <- tmp[(-2),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmax_7" ,]
tmp <- tmp[(-3),]
tmp[3,6] <- tmp[2,6]
tmp <- tmp[(-2),]
tmp <- tmp[(-5),]
new.df <- rbind(new.df, tmp)


tmp <- df[df$Trait == "tmax_8" ,]
tmp <- tmp[(-3),]
tmp <- tmp[(-5),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmax_9" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmin_1" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmin_10" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmin_11" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmin_12" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmin_2" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmin_3" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmin_4" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmin_5" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmean_1" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmean_11" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmean_12" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmean_2" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmean_3" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmean_7" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "tmean_8" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_10" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_11" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "bio_9" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "t_bulk_dens" ,]
tmp <- tmp[(-3),]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "t_clay_cont" ,]
new.df <- rbind(new.df, tmp)

tmp <- df[df$Trait == "t_ph_hox" ,]
new.df <- rbind(new.df, tmp)

write.table(new.df, "bloques_Bonferroni_TD_traits.txt", row.names = FALSE)

##################
## por regiones ##
##################
length(unique(new.df$Inicio))
length(unique(new.df$Final))

# vamos a ordenar las regiones segun su inicio
new.df$Inicio <- as.numeric(new.df$Inicio)
new.df <- arrange(new.df, Chr)

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
  print(length(seq_name))
  chr <- cbind(chr, seq_name)
  chr <- chr[ , c(8,1,2,3,4,5,6,7)]
  write.table(chr , file= paste("Bloques_", unique(new.df$Chr)[ch], ".txt", sep = "") ,sep="\t", append = FALSE)
}

# vamos revisando los bloques por cromosoma 1 a 1 y juntamos las secuencias contiguas o solapantes cuando las haya
# almacenamos en nueva tabla de la muerte 1 region de cada con el trait de menor p-valor para buscar los genes de cada region
tdlm <- data.frame()

# cromosoma 1A
tmp <- read.table("Bloques_1A.txt")
#hay 2 secuencias contiguas, las convertimos en un nuevo bloque 
tmp[tmp$Inicio == "580601831", 7] <- "578329907"
tmp[tmp$seq_name == "TD_1A_3", 1] <- "TD_1A_2"
write.table(tmp, file = "Bloques_1A.txt",sep="\t", append = FALSE)
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm <- rbind(tdlm, tdlm_new_row)
}
length(unique(tmp$Inicio)) == length(unique(tmp$Final))

# cromosoma 1B
tmp <- read.table("Bloques_1B.txt") #no hay contiguas ni solapantes
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm <- rbind(tdlm, tdlm_new_row)
}
length(unique(tmp$Inicio)) == length(unique(tmp$Final))

# cromosoma 2A
tmp <- read.table("Bloques_2A.txt") #no hay contiguas ni solapantes
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm <- rbind(tdlm, tdlm_new_row)
}
length(unique(tmp$Inicio)) == length(unique(tmp$Final))

# cromosoma 2B
tmp <- read.table("Bloques_2B.txt") # la 3 y la 4 solapan
tmp[tmp$Final == "530854492", 8] <- "532279929"
tmp[tmp$Inicio == "522942272", 7] <- "521714330"
tmp[tmp$seq_name == "TD_2B_4", 1] <- "TD_2B_3"
tmp[tmp$seq_name == "TD_2B_5", 1] <- "TD_2B_4"
tmp[tmp$seq_name == "TD_2B_6", 1] <- "TD_2B_5"
tmp[tmp$Final == "745936809", 8] <- "746085610" # en la 4 habia 2 finales diferentes, dejo el mas grande
write.table(tmp, file = "Bloques_2B.txt",sep="\t", append = FALSE)
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm <- rbind(tdlm, tdlm_new_row)
}
length(unique(tmp$Inicio)) == length(unique(tmp$Final))

# cromosoma 3A
tmp <- read.table("Bloques_3A.txt") # solo hay una secuencia
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm <- rbind(tdlm, tdlm_new_row)
}
length(unique(tmp$Inicio)) == length(unique(tmp$Final))

# cromosoma 3B
tmp <- read.table("Bloques_3B.txt") # no hay solapantes ni contiguas
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm <- rbind(tdlm, tdlm_new_row)
}
length(unique(tmp$Inicio)) == length(unique(tmp$Final))

# cromosoma 4A
tmp <- read.table("Bloques_4A.txt") # no hay solapantes ni contiguas
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm <- rbind(tdlm, tdlm_new_row)
}
length(unique(tmp$Inicio)) == length(unique(tmp$Final))

# cromosoma 4B
tmp <- read.table("Bloques_4B.txt") # no hay solapantes ni contiguas
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm <- rbind(tdlm, tdlm_new_row)
}
length(unique(tmp$Inicio)) == length(unique(tmp$Final))

# cromosoma 5B
tmp <- read.table("Bloques_5B.txt") # no hay solapantes ni contiguas
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm <- rbind(tdlm, tdlm_new_row)
}
length(unique(tmp$Inicio)) == length(unique(tmp$Final))

# cromosoma 6A
tmp <- read.table("Bloques_6A.txt") # no hay solapantes ni contiguas
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm <- rbind(tdlm, tdlm_new_row)
}
length(unique(tmp$Inicio)) == length(unique(tmp$Final))

# cromosoma 6B
tmp <- read.table("Bloques_6B.txt") # no hay solapantes ni contiguas
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm <- rbind(tdlm, tdlm_new_row)
}
length(unique(tmp$Inicio)) == length(unique(tmp$Final))

# cromosoma 7B
tmp <- read.table("Bloques_7B.txt") # no hay solapantes ni contiguas
for (i in unique(tmp$seq_name)){
  print(i)
  tdlm_new_row <- tmp %>% filter(seq_name == i) %>% filter(p == min(p))
  tdlm <- rbind(tdlm, tdlm_new_row)
}
length(unique(tmp$Inicio)) == length(unique(tmp$Final))

# guardar los nuevos bloques en un archivo nuevo
write.table(tdlm, "bloques_Bonferroni_TD.txt")

#################################
# una vez hemos sacado los genes de bloques_Bonferroni_TD con anotaciones_TD, le voy a poner otra columna a bloques_Bonferroni_TD con el numero de genes que tiene cada region
tdlm <- read.table("bloques_Bonferroni_TD.txt")
notes <- read.table("results_TD 2022-05-23/summary_TD.txt")
num_of_genes <- c()
for (seq in unique(notes$Secuencia)){
  tmp <- notes %>% filter(Secuencia == seq)
  num_of_genes <- c(num_of_genes, unique(tmp$num.genes))
}

print(unique(tdlm$seq_name))
print(unique(notes$Secuencia))
# la secuencia TD_5B_1 no tiene genes - la elimino de la tabla de la muerte
tdlm <- tdlm[!(tdlm$seq_name == "TD_5B_1"),]

# le uno a la tabla de la muerte la columna con el numero de genes que tiene cada region
tdlm$num_de_genes <- num_of_genes
write.table(tdlm, "bloques_Bonferroni_TD.txt")
