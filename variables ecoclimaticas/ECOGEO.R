######################################################################
# Script  de la herramienta ECOGEO - ECOGEO Tool script 
# Autor de la herramienta - Author of the tool: Mauricio Parra Quijano 
# email: mauricio.parra@fao.org, website: http://capfitogen.net
# Universidad Nacional de Colombia (http://cienciasagrarias.bogota.unal.edu.co/)
# International Treaty on Plant Genetic Resources for Food and Agriculture (http://www.fao.org/plant-treaty/en/)  
# Farmer's pride project (http://www.farmerspride.eu/)
# 2020
######################################################################

#You can freely use and modify this script only for non-commercial purposes.Otherwise please contact to script author. Puede de manera libre usar y modificar este script sólo con proósitos no comerciales. De otra forma, contacte con el autor de las herramientas.
#In any case, we encourage you include in your study publication the correspondent credits (about R software, packages and script author). En cualquier caso, le animamos a que incluya en la publicación de su estudio los créditos correspondientes (acerca del software R, los paquetes y el autor del script)
#To cite CAPFITOGEN in publications use: Parra-Quijano, M. (2020). CAPFITOGEN 3: A toolbox for the conservation and promotion of the use of agricultural biodiversity. Bogotá, Colombia. URL http://www.capfitogen.net/

#HOW TO USE THIS SCRIPT
#PLEASE SELECT ALL THE LINES IN THIS SCRIPT AND LATER CLICK ON THE "RUN" BUTTON. YOU WILL FIND THE RESULTS WHERE YOU INDICATED IT IN THE PARAMETER SCRIPT.

#CÓMO USAR ESTE SCRIPT
#POR FAVOR SELECCIONE TODAS LAS LÍNEAS DE ESTE SCRIPT Y DESPUÉS HAGA CLICK EN EL BOTÓN "RUN". LOS RESULTADOS LOS ENCONTRARÁ DONDE LO INDICÓ EN EL SCRIPT DE PARÁMETROS

##########################################################################################################
##########################################################################################################
#Parametros
setwd(paste(resultados))
write(paste(), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write("______Herramienta/Tool ECOGEO________", file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write("_________________________________________", file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("Lista de parametros usados en: ", date(),sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("List of parameters used on: ", date(),sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste(), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)

write(paste("ruta:", ruta,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("pais:", pais,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("pasaporte:", pasaporte,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("geoqual:", geoqual,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("totalqual:", totalqual,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("buffy:", buffy,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("tamp:", tamp,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("ecogeo:", ecogeo,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("resol1:", resol1,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("bioclimsn:", bioclimsn,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("bioclimv:", bioclimv,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("edaphsn:", edaphsn,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("edaphv:", edaphv,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("geophyssn:", geophyssn,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("geophysv:", geophysv,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("latitud:", latitud,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("longitud:", longitud,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("phenotip:", phenotip,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("phenot:", phenot,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("phenotv:", phenotv,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("genotip:", genotip,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("genot:", genot,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("neigd:", neigd,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("csimilar:", csimilar,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("ecogeoclus:", ecogeoclus,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("ecogeoclustype:", ecogeoclustype,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("ecogeopca:", ecogeopca,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("ecogeopcaxe:", ecogeopcaxe,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("phenoclus:", phenoclus,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("phenoclustype:", phenoclustype,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("phenopca:", phenopca,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("phenopcaxe:", phenopcaxe,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("phenovarq:", phenovarq,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("genoclus:", genoclus,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("genoclustype:", genoclustype,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("genopco:", genopco,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("genopcoaxe:", genopcoaxe,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("mantelt:", mantelt,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("mantelmeth:", mantelmeth,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("mentelper:", mantelper,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)
write(paste("resultados:", resultados,sep=""), file="Parametros.Parameters.ECOGEO.txt", append=TRUE)

#Rversion
vvv<-R.Version()
vvv<-as.numeric(vvv$year)

#Creacion de directorios de resultados
setwd(paste(resultados))
if(ecogeo){
  dir.create(as.vector(paste("EcogeographicCharacterization_",pais,sep="")))
  resultadosEcogeo<-paste(resultados,"/EcogeographicCharacterization_",pais,sep="")
}
if(ecogeoclus|ecogeopca|phenoclus|phenopca|genoclus|genopco){
  dir.create(as.vector(paste("ClassicMultivariateResults_",pais,sep="")))
  resultadosClassic<-paste(resultados,"/ClassicMultivariateResults_",pais,sep="")
}
if(mantelt){
  dir.create(as.vector(paste("MantelCorrelationResults_",pais,sep="")))
  resultadosMantel<-paste(resultados,"/MantelCorrelationResults_",pais,sep="")
}
#Desactivaciones
if(!ecogeo){
  ecogeoclus<-FALSE
  ecogeopca<-FALSE
}
if(!phenotip){
  phenoclus<-FALSE
  phenopca<-FALSE
}
if(!genotip){
  neigd<-FALSE
  genoclus<-FALSE
  genopco<-FALSE
}


#Determinar esa ruta como directorio de trabajo
setwd(paste(ruta))
write("______NUEVO PROCESO ECOGEO________", file="Error/process_info.txt", append=TRUE)
write(date(), file="Error/process_info.txt", append=TRUE)

#Rversion
vvv<-R.Version()
vvv<-as.numeric(vvv$year)

#Ampliación máxima de la capacidad de uso de memoria ram
memory.size(max =TRUE)
write("1.Terminado proceso de determinación de directorio de trabajo", file="Error/process_info.txt", append=TRUE)
#introducción tabla de lista de países y resoluciones de extracción a elegir y traducción
if(vvv<=2019){
  Paises<-read.delim("lista.paises.txt")
}
if(vvv>2019){
  load("lista.paises.RData")
}
pais<-subset(Paises,Denomina==paste(pais))
pais<-paste(pais[1,1])
if(vvv<=2019){
  resol<-read.delim("resol.txt")
}
if(vvv>2019){
  load("resol.RData")
}

resol<-subset(resol,resolucion==paste(resol1))
resol<-as.character(resol[1,2])
write("2.Terminado proceso carga de tablas de lista de países y resolución", file="Error/process_info.txt", append=TRUE)
#activar paquetes ya instalados y necesarios
library(sp)
library(raster)
library(maptools)
library(rgdal)
library(dismo)
library(cluster)
library(ade4)
library(labdsv)
library(vegan)
#library(ncdf)
library(rgeos)

write("4.Terminado proceso de carga de paquetes", file="Error/process_info.txt", append=TRUE)
#########################

#introducción de pasaporte
pasaporte<-read.delim(paste("Pasaporte/",pasaporte,sep=""))
#introducción de datos fenotípicos/genotípicos (primera columna ACCENUMB, luego los descriptores)
if(phenotip){
  phenot12<-phenot
  phenot<-read.delim(paste("Pasaporte/",phenot,sep=""))
}
if(genotip){
  genot<-read.delim(paste("Pasaporte/",genot,sep=""))
}
write("5.Terminado proceso de carga de tablas originales de pasaporte, fenotipo y/o genotipo", file="Error/process_info.txt", append=TRUE)
#Selección de pasaportes sobre el umbral de geoqual
pasaporte<-subset(pasaporte,!is.na(DECLATITUDE)&!is.na(DECLONGITUDE))
if(geoqual){
  pasaporte<-subset(pasaporte,TOTALQUAL100>=totalqual)
}
write("6.Terminado proceso de fijación de umbral de TOTALQUAL", file="Error/process_info.txt", append=TRUE)
#Tabla coordenadas desde pasaporte y cruce con tablas con datos fenotípicos o genotípicos (eliminando datos sin coordenadas)
tabla<-pasaporte[,c(2,23,25)]
tablaccenum<-as.data.frame(tabla[,1])
colnames(tablaccenum)[1]<-"ACCENUMB"
if(phenotip){
  phenot<-merge(tablaccenum,phenot,by="ACCENUMB",all.x=TRUE)
}
if(genotip){
  genot<-merge(tablaccenum,genot,by="ACCENUMB",all.x=TRUE)
}
#Borrado NAs para datos genotipicos
if(genotip){
  for (i in 2:length(genot[1,])){
    genot<-subset(genot,!is.na(genot[,i]))
  }
}
write("7.Terminado proceso de creación tablas accenumb+xy+datos (tablas genot y phenot)", file="Error/process_info.txt", append=TRUE)
#####################################################
#Extracción ecogeográfica
if (ecogeo){
  tabla1<-data.frame(tabla$ACCENUMB)
  colnames(tabla1)[1]<-"ACCENUMB"
  if(buffy){
    tamp<-tamp*0.008333
  }
  if(bioclimsn){
    ###BIOCLIM
    #carga de lista de variables
    if(vvv<=2019){
      bioclim<-read.delim("bioclim.txt")
    }
    if(vvv>2019){
      load("bioclim.RData")
    }
    #Elemento introducido por el usuario: bioclimv
    #Traducción de variables desde java a lista de variables
    bioclim2<-1:length(bioclimv)
    bioclimv<-as.data.frame(cbind(bioclim2,bioclimv))
    colnames(bioclimv)[2]<-"VARDESCR"
    bioclimv<-merge(bioclim,bioclimv, by="VARDESCR", all=F)
    bioclimv<-as.character(bioclimv[,3])
    #armado de stacks
    biocliml<-list()
    for(i in 1:length(bioclimv)){
      biocliml[[i]]<-raster(paste("rdatamaps/",pais,"/",resol,"/",bioclimv[i],".tif",sep=""))
    }
    bioclimstack<-do.call("stack",biocliml)
    #Extracción de información
    #bioclimática
    if(!buffy){
      bioclim<-extract(bioclimstack,tabla[,c("DECLONGITUDE","DECLATITUDE")])
    }
    if(buffy){
      bioclim<-extract(bioclimstack,tabla[,c("DECLONGITUDE","DECLATITUDE")],buffer=tamp,small=TRUE,fun=mean)
    }
    bioclim<-data.frame(tabla[,1],bioclim)
    colnames(bioclim)[1]<-"ACCENUMB"
    #consolidación tabla bioclimática
    ecogeot1<-merge(tabla1,bioclim,by="ACCENUMB",all.x=TRUE)
  }
  if(geophyssn){
    ###GEOPHYS
    if(vvv<=2019){
      geophys<-read.delim("geophys.txt")
    }
    if(vvv>2019){
      load("geophys.RData")
    }
    #Elemento introducido por el usuario: geophysv
    #Traducción de variables desde java a lista de variables
    geophys2<-1:length(geophysv)
    geophysv<-as.data.frame(cbind(geophys2,geophysv))
    colnames(geophysv)[2]<-"VARDESCR"
    geophysv<-merge(geophys,geophysv, by="VARDESCR", all=F)
    geophysv<-as.character(geophysv[,3])
    #armado de stacks
    geophysl<-list()
    for(i in 1:length(geophysv)){
      geophysl[[i]]<-raster(paste("rdatamaps/",pais,"/",resol,"/",geophysv[i],".tif",sep=""))
    }
    geophysstack<-do.call("stack",geophysl)
    #Extracción de información
    #geofísica
    if(!buffy){
      geophys<-extract(geophysstack,tabla[,c("DECLONGITUDE","DECLATITUDE")])
    }
    if(buffy){
      geophys<-extract(geophysstack,tabla[,c("DECLONGITUDE","DECLATITUDE")],buffer=tamp,small=TRUE,fun=mean)
    }
    geophys<-data.frame(tabla[,1],geophys)
    colnames(geophys)[1]<-"ACCENUMB"
    #consolidación tabla geofísica
    ecogeot2<-merge(tabla1,geophys,by="ACCENUMB",all.x=TRUE,sort=FALSE)
  }
  if(edaphsn){
    ###EDAPHIC
    if(vvv<=2019){
      edaph<-read.delim("edaph.txt")
    }
    if(vvv>2019){
      load("edaph.RData")
    }
    #Elemento introducido por el usuario: edaphv
    edaph2<-1:length(edaphv)
    edaphv<-as.data.frame(cbind(edaph2,edaphv))
    colnames(edaphv)[2]<-"VARDESCR"
    edaphv<-merge(edaph,edaphv, by="VARDESCR", all=F)
    edaphv<-as.character(edaphv[,3])
    #armado de stacks
    edaphl<-list()
    for(i in 1:length(edaphv)){
      edaphl[[i]]<-raster(paste("rdatamaps/",pais,"/",resol,"/",edaphv[i],".tif",sep=""))
    }
    edaphstack<-do.call("stack",edaphl)
    #Extracción de información
    #edáfica
    if(!buffy){
      edaph<-extract(edaphstack,tabla[,c("DECLONGITUDE","DECLATITUDE")])
    }
    if(buffy){
      edaph<-extract(edaphstack,tabla[,c("DECLONGITUDE","DECLATITUDE")],buffer=tamp,small=TRUE,fun=mean)
    }
    edaph<-data.frame(tabla[,1],edaph)
    colnames(edaph)[1]<-"ACCENUMB"
    #consolidación tabla edáfica
    ecogeot3<-merge(tabla1,edaph,by="ACCENUMB",all.x=TRUE)
  }
  #Tabla final ecogeot (bioclimsn edaphsn geophyssn)
  #usando los tres
  if(bioclimsn&edaphsn&geophyssn){
    ecogeot<-merge(tabla,ecogeot2,by="ACCENUMB")
    ecogeot<-merge(ecogeot,ecogeot1,by="ACCENUMB")
    ecogeot<-merge(ecogeot,ecogeot3,by="ACCENUMB")
  }
  #usando sólo bioclim y edaph
  if(bioclimsn&edaphsn&!geophyssn){
    ecogeot<-merge(ecogeot,ecogeot1,by="ACCENUMB")
    ecogeot<-merge(ecogeot,ecogeot3,by="ACCENUMB")
  }
  #usando sólo bioclim y geophys
  if(bioclimsn&!edaphsn&geophyssn){
    ecogeot<-merge(tabla,ecogeot2,by="ACCENUMB")
    ecogeot<-merge(ecogeot,ecogeot1,by="ACCENUMB")
  }
  #Usando sólo geophys y edaph
  if(!bioclimsn&edaphsn&geophyssn){
    ecogeot<-merge(tabla,ecogeot2,by="ACCENUMB")
    ecogeot<-merge(ecogeot,ecogeot3,by="ACCENUMB")
  }
  #usando sólo bioclim
  if(bioclimsn&!edaphsn&!geophyssn){
    ecogeot<-merge(ecogeot,ecogeot1,by="ACCENUMB")
  }
  #usando sólo edaph
  if(!bioclimsn&edaphsn&!geophyssn){
    ecogeot<-merge(ecogeot,ecogeot3,by="ACCENUMB")
  }
  #usando sólo geophys
  if(!bioclimsn&!edaphsn&geophyssn){
    ecogeot<-merge(tabla,ecogeot2,by="ACCENUMB")
  }
  #Exportando tabla ecogeot
  write.table(ecogeot, file = paste(resultadosEcogeo,"/TablaVarEcogeograficas",pais,".txt",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(ecogeot, file = paste(resultadosEcogeo,"/TablaVarEcogeograficas",pais,".xls",sep=""), sep = "\t", row.names = FALSE, qmethod = "double")
}

###############################
#Ajustes para variables fenotìpicas
###############################
if(phenotip){
  write("10.1 Iniciando analisis fenotípico", file="Error/process_info.txt", append=TRUE)
  #carga tabla conversion tipo de variable
  load("tablavar.RData")
  #carga tabla tipo de variable por usuario
  varphenot<-read.delim(paste("Pasaporte/",phenotv,sep=""))
  write("10.2 Terminado carga de tablas de conversión y tipo de variables", file="Error/process_info.txt", append=TRUE)
  #conversión
  varphenot<-merge(varphenot,tablavar,by.x="NATVAR",by.y="TIPVAR",all.x=TRUE)
  i <- order(varphenot$ID)
  varphenot<- varphenot[i,]
  #conversión de tipos de variables a la naturaleza de las variables para daisy
  phenotx<-list()
  phenotx[[1]]<-phenot[,1]
  for (i in 1:length(varphenot[,1])){
    if(varphenot[i,5]=="as.numeric"){
      aaa<-as.numeric(phenot[,i+1])
    }
    if(varphenot[i,5]=="as.factor"){
      aaa<-as.factor(phenot[,i+1])
    }
    if(varphenot[i,5]=="as.ordered"){
      aaa<-as.ordered(phenot[,i+1])
    }
    phenotx[[i+1]]<-aaa
  }
  phenotx<-do.call("data.frame",phenotx)
  colnames(phenotx)<-colnames(phenot)
  phenot<-phenotx
  rm(phenotx)
  #tipos únicos de variables
  typesv<-paste(unique(varphenot$NATVAR),sep="")
  #arreglo binsimetric
  #1
  #Si hay variables binarias simétricas y asimétricas
  if(any(typesv=="Binario simetrico")&any(typesv=="Binario asimetrico")){
    binsimetric<-subset(varphenot,NATVAR=="Binario simetrico",select=NOMVAR)
    binsimetric<-binsimetric$NOMVAR
    binasimetric<-subset(varphenot,NATVAR=="Binario asimetrico",select=NOMVAR)
    binasimetric<-binasimetric$NOMVAR
  }
  #2
  #si hay sólo variables binarias simétricas (sin asimétricas)
  if(any(typesv=="Binario simetrico")&all(typesv!="Binario asimetrico")){
    binsimetric<-subset(varphenot,NATVAR=="Binario simetrico",select=NOMVAR)
    binsimetric<-binsimetric$NOMVAR
  }
  #3
  #si hay sólo variables binarias asimétricas (sin simétricas)
  if(all(typesv!="Binario simetrico")&any(typesv=="Binario asimetrico")){
    binasimetric<-subset(varphenot,NATVAR=="Binario asimetrico",select=NOMVAR)
    binasimetric<-binasimetric$NOMVAR
  }
}

############################################################################################################
#Análisis agrupamientos clásico
############################################################################################################
#Ecogeográfico
if(ecogeo&ecogeoclus){
  ecogeodist<-daisy(ecogeot[,-1],metric="euclidean",stand=TRUE)
  ecogeodist<-hclust(ecogeodist,paste(ecogeoclustype))
  setwd(paste(resultadosClassic))
  win.metafile(file="dendrograma_ecogeo.wmf")
  if(length(ecogeot[,1])>=200){
    plot(ecogeodist, labels=ecogeot[,1],main="Cluster analysis - Ecogeographic characterization",cex = 0.3)
  }
  if(length(ecogeot[,1])>=50&length(ecogeot[,1])<200){
    plot(ecogeodist, labels=ecogeot[,1],main="Cluster analysis - Ecogeographic characterization",cex = 0.5)
  }
  if(length(ecogeot[,1])<50){
    plot(ecogeodist, labels=ecogeot[,1],main="Cluster analysis - Ecogeographic characterization",cex = 1)
  }
  dev.off()
  setwd(paste(ruta))
  write("14.1 Terminado analisis agrupamientos ecogeo", file="Error/process_info.txt", append=TRUE)
}
if (ecogeo&ecogeopca){
  #Borrado de NA's
  ecogeot<-ecogeot[complete.cases(ecogeot),]
  #PCA
  if(ecogeopcaxe>length(ecogeot[,-1])){
    ecogeopcaxe<-length(ecogeot[,-1])
  }
  ecogeopca<-dudi.pca(ecogeot[,-1],center=TRUE,scale=TRUE,scannf=FALSE,nf=ecogeopcaxe)
  variables<-colnames(ecogeot)[-1]
  accenumb<-ecogeot[,1]
  eigenvalues<-ecogeopca$eig
  eigenvectors<-ecogeopca$c1
  eigenvalues<-data.frame(1:length(eigenvalues),eigenvalues)
  colnames(eigenvalues)[1]<-"Component"
  variancet<-sum(eigenvalues[,2])
  variance<-vector(length=length(eigenvalues[,1]))
  var.accumul<-vector(length=length(eigenvalues[,1]))
  for (i in 1:length(eigenvalues[,1])){
    variance[i]<-(eigenvalues[i,2]*100)/variancet
    if(i==1){
      var.accumul[i]<-variance[i]
    }
    if(i>1){
      var.accumul[i]<-var.accumul[i-1]+variance[i]
    }
  }
  eigenvalues<-data.frame(eigenvalues,variance,var.accumul)
  eigenvectors<-data.frame(variables,eigenvectors)
  pcascores<-data.frame(accenumb,ecogeopca$li)
  setwd(paste(resultadosClassic))
  write.table(eigenvalues,file="ecogeographic_eigenvalues.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(eigenvalues,file="ecogeographic_eigenvalues.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(eigenvectors,file="ecogeographic_eigenvectors.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(eigenvectors,file="ecogeographic_eigenvectors.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(pcascores,file="ecogeographic_pcascores.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(pcascores,file="ecogeographic_pcascores.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  #parte gráfica
  win.metafile(file="pca_ecogeo.wmf")
  biplot(ecogeopca)
  dev.off()
  setwd(paste(ruta))
  write("14.2 Terminado analisis PCA ecogeo", file="Error/process_info.txt", append=TRUE)
}
#####################################
#Fenotípico
if(phenotip&phenoclus){
  phenot12<-read.delim(paste("Pasaporte/",phenot12,sep=""))
  #1
  #Si hay variables binarias simétricas y asimétricas
  if(any(typesv=="Binario simetrico")&any(typesv=="Binario asimetrico")){
    phenodist<-daisy(phenot12[,-1],metric="gower",stand=TRUE,type=list(symm=paste(binsimetric),asymm=paste(binasimetric)))
  }
  #2
  #si hay sólo variables binarias simétricas (sin asimétricas)
  if(any(typesv=="Binario simetrico")&all(typesv!="Binario asimetrico")){
    phenodist<-daisy(phenot12[,-1],metric="gower",stand=TRUE,type=list(symm=paste(binsimetric)))
  }
  #3
  #si hay sólo variables binarias asimétricas (sin simétricas)
  if(all(typesv!="Binario simetrico")&any(typesv=="Binario asimetrico")){
    phenodist<-daisy(phenot12[,-1],metric="gower",stand=TRUE,type=list(asymm=paste(binasimetric)))
  }
  #4
  #si NO hay variables binarias
  if(all(typesv!="Binario simetrico")&all(typesv!="Binario asimetrico")){
    phenodist<-daisy(phenot12[,-1],metric="gower",stand=TRUE)
  }
  #hierarchical clustering
  phenodist<-hclust(phenodist,paste(phenoclustype))
  setwd(paste(resultadosClassic))
  win.metafile(file="dendrograma_fenotipico.wmf")
  if(length(phenot12[,1])>=200){
    plot(phenodist, labels=phenot12[,1],main="Cluster analysis - Phenotypic characterization",cex = 0.3)
  }
  if(length(phenot12[,1])>=50&length(phenot12[,1])<200){
    plot(phenodist, labels=phenot12[,1],main="Cluster analysis - Phenotypic characterization",cex = 0.5)
  }
  if(length(phenot12[,1])<50){
    plot(phenodist, labels=phenot12[,1],main="Cluster analysis - Phenotypic characterization",cex = 1)
  }
  dev.off()
  setwd(paste(ruta))
  write("14.3 Terminado analisis agrupamientos fenotípicos", file="Error/process_info.txt", append=TRUE)
}
if (phenotip&phenopca){
  if(all(typesv=="Cuantitativo")){
    #Borrado de NA's
    phenot<-phenot[complete.cases(phenot),]
    #PCA
    if(phenopcaxe>length(phenot[,-1])){
      phenopcaxe<-length(phenot[,-1])
    }
    phenopca<-dudi.pca(phenot[,-1],center=TRUE,scale=TRUE,scannf=FALSE,nf=phenopcaxe)
    variables<-colnames(phenot)[-1]
    accenumb<-phenot[,1]
    eigenvalues<-phenopca$eig
    eigenvectors<-phenopca$c1
    eigenvalues<-data.frame(1:length(eigenvalues),eigenvalues)
    colnames(eigenvalues)[1]<-"Component"
    variancet<-sum(eigenvalues[,2])
    variance<-vector(length=length(eigenvalues[,1]))
    var.accumul<-vector(length=length(eigenvalues[,1]))
    for (i in 1:length(eigenvalues[,1])){
      variance[i]<-(eigenvalues[i,2]*100)/variancet
      if(i==1){
        var.accumul[i]<-variance[i]
      }
      if(i>1){
        var.accumul[i]<-var.accumul[i-1]+variance[i]
      }
    }
    eigenvalues<-data.frame(eigenvalues,variance,var.accumul)
    eigenvectors<-data.frame(variables,eigenvectors)
    pcascores<-data.frame(accenumb,phenopca$li)
    setwd(paste(resultadosClassic))
    write.table(eigenvalues,file="phenotypic_eigenvalues.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(eigenvalues,file="phenotypic_eigenvalues.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(eigenvectors,file="phenotypic_eigenvectors.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(eigenvectors,file="phenotypic_eigenvectors.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(pcascores,file="phenotypic_pcascores.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(pcascores,file="phenotypic_pcascores.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    #parte gráfica
    win.metafile(file="pca_pheno.wmf")
    biplot(phenopca)
    dev.off()
    setwd(paste(ruta))
    write("14.4 Terminado analisis PCA/PCoA fenotípico", file="Error/process_info.txt", append=TRUE)
  }
  if(any(typesv!="Cuantitativo")){
    #Borrado de NA's
    phenot<-phenot[complete.cases(phenot),]
    #Distancias
    #1
    #Si hay variables binarias simétricas y asimétricas
    if(any(typesv=="Binario simetrico")&any(typesv=="Binario asimetrico")){
      phenodist<-daisy(phenot[,-1],metric="gower",stand=TRUE,type=list(symm=paste(binsimetric),asymm=paste(binasimetric)))
    }
    #2
    #si hay sólo variables binarias simétricas (sin asimétricas)
    if(any(typesv=="Binario simetrico")&all(typesv!="Binario asimetrico")){
      phenodist<-daisy(phenot[,-1],metric="gower",stand=TRUE,type=list(symm=paste(binsimetric)))
    }
    #3
    #si hay sólo variables binarias asimétricas (sin simétricas)
    if(all(typesv!="Binario simetrico")&any(typesv=="Binario asimetrico")){
      phenodist<-daisy(phenot[,-1],metric="gower",stand=TRUE,type=list(asymm=paste(binasimetric)))
    }
    #4
    #si NO hay variables binarias
    if(all(typesv!="Binario simetrico")&all(typesv!="Binario asimetrico")){
      phenodist<-daisy(phenot[,-1],metric="gower",stand=TRUE)
    }
    #PCO
    if(phenopcaxe>length(phenot[,-1])){
      phenopcaxe<-length(phenot[,-1])
    }
    phenotpco<-pco(phenodist,k=phenopcaxe)
    eigenvalues<-phenotpco$eig
    eigenvalues<-data.frame(c(1:length(phenot[,1])),eigenvalues)
    colnames(eigenvalues)[1]<-"Coordinate"
    variancet<-sum(eigenvalues[,2])
    variance<-vector(length=length(eigenvalues[,1]))
    var.accumul<-vector(length=length(eigenvalues[,1]))
    for (i in 1:length(eigenvalues[,1])){
      variance[i]<-(eigenvalues[i,2]*100)/variancet
      if(i==1){
        var.accumul[i]<-variance[i]
      }
      if(i>1){
        var.accumul[i]<-var.accumul[i-1]+variance[i]
      }
    }
    eigenvalues<-data.frame(eigenvalues,variance,var.accumul)
    accenumb<-phenot[,1]
    pcoscores<-data.frame(accenumb,phenotpco$points)
    setwd(paste(resultadosClassic))
    write.table(eigenvalues,file="phenotypic_eigenvalues.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(eigenvalues,file="phenotypic_eigenvalues.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(pcoscores,file="phenotypic_pcoscores.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(pcoscores,file="phenotypic_pcoscores.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    #parte gráfica
    win.metafile(file="pco_phenot.wmf")
    #Mete ahora lo que quieres que aparezcan en las gráficas, uno tras de otro
    plot(phenotpco,title="PCO for phenotypic characterization",pch=20)
    #Cierra el "device", después de esto, lo que añadas como plots o points no quedarán reflejados en el png
    dev.off()
    setwd(paste(ruta))
    write("14.4 Terminado analisis PCA/PCoA fenotípico", file="Error/process_info.txt", append=TRUE)
  }  
}
#####################################
#Genotípico
if(genotip&genoclus){
  #Borrado de NA's
  genot<-genot[complete.cases(genot),]
  #Distancia
  genodist<-dist.binary(genot[,-1],method=csimilar)
  #hierarchical clustering
  genodist<-hclust(genodist,paste(genoclustype))
  setwd(paste(resultadosClassic))
  win.metafile(file="dendrograma_genotipico.wmf")
  if(length(genot[,1])>=200){
    plot(genodist, labels=genot[,1],main="Cluster analysis - Genotypic characterization",cex = 0.3)
  }
  if(length(genot[,1])>=50&length(genot[,1])<200){
    plot(genodist, labels=genot[,1],main="Cluster analysis - Genotypic characterization",cex = 0.5)
  }
  if(length(phenot[,1])<50){
    plot(genodist, labels=genot[,1],main="Cluster analysis - Genotypic characterization",cex = 1)
  }
  dev.off()
  setwd(paste(ruta))
  write("14.5 Terminado analisis agrupamientos genotípico", file="Error/process_info.txt", append=TRUE)
}
if (genotip&genopco){
  #Borrado de NA's
  genot<-genot[complete.cases(genot),]
  #PCA
  if(genopcoaxe>length(genot[,-1])){
    genopcoaxe<-length(genot[,-1])
  }
  #Distancia
  genodist<-dist.binary(genot[,-1],method=csimilar)
  #PCO
  genotpco<-pco(genodist,k=genopcoaxe)
  eigenvalues<-genotpco$eig
  eigenvalues<-data.frame(c(1:length(genot[,1])),eigenvalues)
  colnames(eigenvalues)[1]<-"Coordinate"
  variancet<-sum(eigenvalues[,2])
  variance<-vector(length=length(eigenvalues[,1]))
  var.accumul<-vector(length=length(eigenvalues[,1]))
  for (i in 1:length(eigenvalues[,1])){
    variance[i]<-(eigenvalues[i,2]*100)/variancet
    if(i==1){
      var.accumul[i]<-variance[i]
    }
    if(i>1){
      var.accumul[i]<-var.accumul[i-1]+variance[i]
    }
  }
  eigenvalues<-data.frame(eigenvalues,variance,var.accumul)
  accenumb<-genot[,1]
  pcoscores<-data.frame(accenumb,genotpco$points)
  setwd(paste(resultadosClassic))
  write.table(eigenvalues,file="genotypic_eigenvalues.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(eigenvalues,file="genotypic_eigenvalues.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(pcoscores,file="genotypic_pcoscores.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(pcoscores,file="genotypic_pcoscores.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  #parte gráfica
  win.metafile(file="pco_genot.wmf")
  #Mete ahora lo que quieres que aparezcan en las gráficas, uno tras de otro
  plot(genotpco,title="PCO for genotypic characterization",pch=20)
  #Cierra el "device", después de esto, lo que añadas como plots o points no quedarán reflejados en el png
  dev.off()
  setwd(paste(ruta))
  write("14.6 Terminado analisis PCoA genotípico", file="Error/process_info.txt", append=TRUE)
}

############################################################################################################
#Correlacione matriciales
############################################################################################################
#Ecogeográfico vs fenotípico
if(ecogeo&phenotip){
  #Borrado de NA's
  ecogeot<-ecogeot[complete.cases(ecogeot),]
  phenot<-phenot[complete.cases(phenot),]
  ecogeolist<-as.data.frame(ecogeot[,1])
  colnames(ecogeolist)[1]<-"ACCENUMB"
  phenolist<-as.data.frame(phenot[,1])
  colnames(phenolist)[1]<-"ACCENUMB"
  ecogeom<-merge(ecogeot,phenolist,by="ACCENUMB")
  phenom<-merge(phenot,ecogeolist,by="ACCENUMB")
  if(dim(ecogeom)[1]==dim(phenom)[1]){
    ecogeodist<-daisy(ecogeom[,-1],metric="euclidean",stand=TRUE)
    matriz.ecogeodist<-as.matrix(ecogeodist)
    colnames(matriz.ecogeodist)<-ecogeom$ACCENUMB
    rownames(matriz.ecogeodist)<-ecogeom$ACCENUMB
    setwd(paste(resultadosMantel))
    write.table(matriz.ecogeodist,file="Matriz_distancias_ecogeograficas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(matriz.ecogeodist,file="Matriz_distancias_ecogeograficas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
    #1
    #Si hay variables binarias simétricas y asimétricas
    if(any(typesv=="Binario simetrico")&any(typesv=="Binario asimetrico")){
      phenodist<-daisy(phenom[,-1],metric="gower",stand=TRUE,type=list(symm=paste(binsimetric),asymm=paste(binasimetric)))
      matriz.phenodist<-as.matrix(phenodist)
      colnames(matriz.phenodist)<-phenom$ACCENUMB
      rownames(matriz.phenodist)<-phenom$ACCENUMB
      setwd(paste(resultadosMantel))
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      setwd(paste(ruta))
    }
    #2
    #si hay sólo variables binarias simétricas (sin asimétricas)
    if(any(typesv=="Binario simetrico")&all(typesv!="Binario asimetrico")){
      phenodist<-daisy(phenom[,-1],metric="gower",stand=TRUE,type=list(symm=paste(binsimetric)))
      matriz.phenodist<-as.matrix(phenodist)
      colnames(matriz.phenodist)<-phenom$ACCENUMB
      rownames(matriz.phenodist)<-phenom$ACCENUMB
      setwd(paste(resultadosMantel))
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      setwd(paste(ruta))
    }
    #3
    #si hay sólo variables binarias asimétricas (sin simétricas)
    if(all(typesv!="Binario simetrico")&any(typesv=="Binario asimetrico")){
      phenodist<-daisy(phenom[,-1],metric="gower",stand=TRUE,type=list(asymm=paste(binasimetric)))
      matriz.phenodist<-as.matrix(phenodist)
      colnames(matriz.phenodist)<-phenom$ACCENUMB
      rownames(matriz.phenodist)<-phenom$ACCENUMB
      setwd(paste(resultadosMantel))
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      setwd(paste(ruta))
    }
    #4
    #si NO hay variables binarias
    if(all(typesv!="Binario simetrico")&all(typesv!="Binario asimetrico")){
      phenodist<-daisy(phenom[,-1],metric="gower",stand=TRUE)
      matriz.phenodist<-as.matrix(phenodist)
      colnames(matriz.phenodist)<-phenom$ACCENUMB
      rownames(matriz.phenodist)<-phenom$ACCENUMB
      setwd(paste(resultadosMantel))
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      setwd(paste(ruta))
    }
    mantel.ecogeo.pheno<-mantel(ecogeodist,phenodist,method=paste(mantelmeth),permutations=mantelper)
    t1<-"Mantel matrix correlation - ecogeographic vs. phenotypic"
    tablamantel<-as.data.frame(cbind(t1,mantel.ecogeo.pheno$method,mantel.ecogeo.pheno$statistic,mantel.ecogeo.pheno$signif,mantel.ecogeo.pheno$permutations))
    colnames(tablamantel)[1]<-"Componentes comparados"
    colnames(tablamantel)[2]<-"Método"
    colnames(tablamantel)[3]<-"Estadístico de Mantel"
    colnames(tablamantel)[4]<-"significancia"
    colnames(tablamantel)[5]<-"Número permutaciones"
    setwd(paste(resultadosMantel))
    write.table(tablamantel,file="Mantel_ecogeographic_Vs_phenotypic.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(tablamantel,file="Mantel_ecogeographic_Vs_phenotypic.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
    write("15.1 Terminado analisis Mantel ecogeo vs phenotypic", file="Error/process_info.txt", append=TRUE)
  }
  if(!dim(ecogeom)[1]==dim(phenom)[1]){
    write("Error en Mantel: Diferente número de entradas analizadas entre ecogeografía y fenotipo", file="Error/process_info.txt", append=TRUE)
  }
}
#Ecogeográfico vs genotípico
if(ecogeo&genotip){
  #Borrado de NA's
  ecogeot<-ecogeot[complete.cases(ecogeot),]
  genot<-genot[complete.cases(genot),]
  ecogeolist<-as.data.frame(ecogeot[,1])
  colnames(ecogeolist)[1]<-"ACCENUMB"
  genolist<-as.data.frame(genot[,1])
  colnames(genolist)[1]<-"ACCENUMB"
  ecogeom<-merge(ecogeot,genolist,by="ACCENUMB")
  genom<-merge(genot,ecogeolist,by="ACCENUMB")
  if(dim(ecogeom)[1]==dim(genom)[1]){
    ecogeodist<-daisy(ecogeom[,-1],metric="euclidean",stand=TRUE)
    #Exportar
    matriz.ecogeodist<-as.matrix(ecogeodist)
    colnames(matriz.ecogeodist)<-ecogeom$ACCENUMB
    rownames(matriz.ecogeodist)<-ecogeom$ACCENUMB
    setwd(paste(resultadosMantel))
    write.table(matriz.ecogeodist,file="Matriz_distancias_ecogeograficas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(matriz.ecogeodist,file="Matriz_distancias_ecogeograficas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
    #Genotip
    genodist<-dist.binary(genom[,-1],method=csimilar)
    #Exportar
    matriz.genodist<-as.matrix(genodist)
    colnames(matriz.genodist)<-genom$ACCENUMB
    rownames(matriz.genodist)<-genom$ACCENUMB
    setwd(paste(resultadosMantel))
    write.table(matriz.genodist,file="Matriz_distancias_genotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(matriz.genodist,file="Matriz_distancias_genotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
    #Mantel
    mantel.ecogeo.geno<-mantel(ecogeodist,genodist,method=paste(mantelmeth),permutations=mantelper)
    t1<-"Mantel matrix correlation - ecogeographic vs. genotypic"
    tablamantel<-as.data.frame(cbind(t1,mantel.ecogeo.geno$method,mantel.ecogeo.geno$statistic,mantel.ecogeo.geno$signif,mantel.ecogeo.geno$permutations))
    colnames(tablamantel)[1]<-"Componentes comparados"
    colnames(tablamantel)[2]<-"Método"
    colnames(tablamantel)[3]<-"Estadístico de Mantel"
    colnames(tablamantel)[4]<-"significancia"
    colnames(tablamantel)[5]<-"Número permutaciones"
    setwd(paste(resultadosMantel))
    write.table(tablamantel,file="Mantel_ecogeographic_Vs_genotypic.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(tablamantel,file="Mantel_ecogeographic_Vs_genotypic.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
    write("15.2 Terminado analisis Mantel ecogeo vs genotypic", file="Error/process_info.txt", append=TRUE)
  }
  if(!dim(ecogeom)[1]==dim(genom)[1]){
    write("Error en Mantel: Diferente número de entradas analizadas entre ecogeografía y genotipo", file="Error/process_info.txt", append=TRUE)
  }
}
#Genotípico vs fenotípico
if(genotip&phenotip){
  #Borrado de NA's
  phenot<-phenot[complete.cases(phenot),]
  genot<-genot[complete.cases(genot),]
  genolist<-as.data.frame(genot[,1])
  colnames(genolist)[1]<-"ACCENUMB"
  phenolist<-as.data.frame(phenot[,1])
  colnames(phenolist)[1]<-"ACCENUMB"
  genom<-merge(genot,phenolist,by="ACCENUMB")
  phenom<-merge(phenot,genolist,by="ACCENUMB")
  if(dim(genom)[1]==dim(phenom)[1]){
    genodist<-dist.binary(genom[,-1],method=csimilar)
    #Exportar
    matriz.genodist<-as.matrix(genodist)
    colnames(matriz.genodist)<-genom$ACCENUMB
    rownames(matriz.genodist)<-genom$ACCENUMB
    setwd(paste(resultadosMantel))
    write.table(matriz.genodist,file="Matriz_distancias_genotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(matriz.genodist,file="Matriz_distancias_genotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
    #1
    #Si hay variables binarias simétricas y asimétricas
    if(any(typesv=="Binario simetrico")&any(typesv=="Binario asimetrico")){
      phenodist<-daisy(phenom[,-1],metric="gower",stand=TRUE,type=list(symm=paste(binsimetric),asymm=paste(binasimetric)))
      matriz.phenodist<-as.matrix(phenodist)
      colnames(matriz.phenodist)<-phenom$ACCENUMB
      rownames(matriz.phenodist)<-phenom$ACCENUMB
      setwd(paste(resultadosMantel))
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      setwd(paste(ruta))
    }
    #2
    #si hay sólo variables binarias simétricas (sin asimétricas)
    if(any(typesv=="Binario simetrico")&all(typesv!="Binario asimetrico")){
      phenodist<-daisy(phenom[,-1],metric="gower",stand=TRUE,type=list(symm=paste(binsimetric)))
      matriz.phenodist<-as.matrix(phenodist)
      colnames(matriz.phenodist)<-phenom$ACCENUMB
      rownames(matriz.phenodist)<-phenom$ACCENUMB
      setwd(paste(resultadosMantel))
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      setwd(paste(ruta))
    }
    #3
    #si hay sólo variables binarias asimétricas (sin simétricas)
    if(all(typesv!="Binario simetrico")&any(typesv=="Binario asimetrico")){
      phenodist<-daisy(phenom[,-1],metric="gower",stand=TRUE,type=list(asymm=paste(binasimetric)))
      matriz.phenodist<-as.matrix(phenodist)
      colnames(matriz.phenodist)<-phenom$ACCENUMB
      rownames(matriz.phenodist)<-phenom$ACCENUMB
      setwd(paste(resultadosMantel))
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      setwd(paste(ruta))
    }
    #4
    #si NO hay variables binarias
    if(all(typesv!="Binario simetrico")&all(typesv!="Binario asimetrico")){
      phenodist<-daisy(phenom[,-1],metric="gower",stand=TRUE)
      matriz.phenodist<-as.matrix(phenodist)
      colnames(matriz.phenodist)<-phenom$ACCENUMB
      rownames(matriz.phenodist)<-phenom$ACCENUMB
      setwd(paste(resultadosMantel))
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
      write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
      setwd(paste(ruta))
    }
    mantel.geno.pheno<-mantel(genodist,phenodist,method=paste(mantelmeth),permutations=mantelper)
    t1<-"Mantel matrix correlation - genotypic vs. phenotypic"
    tablamantel<-as.data.frame(cbind(t1,mantel.geno.pheno$method,mantel.geno.pheno$statistic,mantel.geno.pheno$signif,mantel.geno.pheno$permutations))
    colnames(tablamantel)[1]<-"Componentes comparados"
    colnames(tablamantel)[2]<-"Método"
    colnames(tablamantel)[3]<-"Estadístico de Mantel"
    colnames(tablamantel)[4]<-"significancia"
    colnames(tablamantel)[5]<-"Número permutaciones"
    setwd(paste(resultadosMantel))
    write.table(tablamantel,file="Mantel_genotypic_Vs_phenotypic.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(tablamantel,file="Mantel_genotypic_Vs_phenotypic.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
    write("15.3 Terminado analisis Mantel genotypic vs phenotypic", file="Error/process_info.txt", append=TRUE)
  }
  if(!dim(genom)[1]==dim(phenom)[1]){
    write("Error en Mantel: Diferente número de entradas analizadas entre genotipo y fenotipo", file="Error/process_info.txt", append=TRUE)
  }
}
#fenotípico vs geográfico
if(phenotip){
  phenot<-phenot[complete.cases(phenot),]
  phenolist<-as.data.frame(phenot[,1])
  colnames(phenolist)[1]<-"ACCENUMB"
  geogra1<-pasaporte[,c(2,25,23)]
  geogra1<-merge(geogra1,phenolist,by="ACCENUMB",all.y=TRUE)
  geogra2<-daisy(geogra1[,-1],metric="euclidean",stand=FALSE)
  #Exporta
  matriz.geogra<-as.matrix(geogra2)
  colnames(matriz.geogra)<-geogra1$ACCENUMB
  rownames(matriz.geogra)<-geogra1$ACCENUMB
  setwd(paste(resultadosMantel))
  write.table(matriz.geogra,file="Matriz_distancias_geograficas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(matriz.geogra,file="Matriz_distancias_geograficas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  setwd(paste(ruta))
  #Distancia pheno
  #1
  #Si hay variables binarias simétricas y asimétricas
  if(any(typesv=="Binario simetrico")&any(typesv=="Binario asimetrico")){
    phenodist<-daisy(phenot[,-1],metric="gower",stand=TRUE,type=list(symm=paste(binsimetric),asymm=paste(binasimetric)))
    matriz.phenodist<-as.matrix(phenodist)
    colnames(matriz.phenodist)<-phenot$ACCENUMB
    rownames(matriz.phenodist)<-phenot$ACCENUMB
    setwd(paste(resultadosMantel))
    write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
  }
  #2
  #si hay sólo variables binarias simétricas (sin asimétricas)
  if(any(typesv=="Binario simetrico")&all(typesv!="Binario asimetrico")){
    phenodist<-daisy(phenot[,-1],metric="gower",stand=TRUE,type=list(symm=paste(binsimetric)))
    matriz.phenodist<-as.matrix(phenodist)
    colnames(matriz.phenodist)<-phenot$ACCENUMB
    rownames(matriz.phenodist)<-phenot$ACCENUMB
    setwd(paste(resultadosMantel))
    write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
  }
  #3
  #si hay sólo variables binarias asimétricas (sin simétricas)
  if(all(typesv!="Binario simetrico")&any(typesv=="Binario asimetrico")){
    phenodist<-daisy(phenot[,-1],metric="gower",stand=TRUE,type=list(asymm=paste(binasimetric)))
    matriz.phenodist<-as.matrix(phenodist)
    colnames(matriz.phenodist)<-phenot$ACCENUMB
    rownames(matriz.phenodist)<-phenot$ACCENUMB
    setwd(paste(resultadosMantel))
    write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
  }
  #4
  #si NO hay variables binarias
  if(all(typesv!="Binario simetrico")&all(typesv!="Binario asimetrico")){
    phenodist<-daisy(phenot[,-1],metric="gower",stand=TRUE)
    matriz.phenodist<-as.matrix(phenodist)
    colnames(matriz.phenodist)<-phenot$ACCENUMB
    rownames(matriz.phenodist)<-phenot$ACCENUMB
    setwd(paste(resultadosMantel))
    write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
    write.table(matriz.phenodist,file="Matriz_distancias_fenotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
    setwd(paste(ruta))
  }
  mantel.pheno.geo<-mantel(phenodist,geogra2,method=paste(mantelmeth),permutations=mantelper)
  t1<-"Mantel matrix correlation - phenotypic vs. geographic"
  tablamantel<-as.data.frame(cbind(t1,mantel.pheno.geo$method,mantel.pheno.geo$statistic,mantel.pheno.geo$signif,mantel.pheno.geo$permutations))
  colnames(tablamantel)[1]<-"Componentes comparados"
  colnames(tablamantel)[2]<-"Método"
  colnames(tablamantel)[3]<-"Estadístico de Mantel"
  colnames(tablamantel)[4]<-"significancia"
  colnames(tablamantel)[5]<-"Número permutaciones"
  setwd(paste(resultadosMantel))
  write.table(tablamantel,file="Mantel_phenotypic_Vs_geographic.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(tablamantel,file="Mantel_phenotypic_Vs_geographic.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  setwd(paste(ruta))
  write("15.4 Terminado analisis Mantel phenotypic vs geographic", file="Error/process_info.txt", append=TRUE)
}

#Genotípico vs geográfico
if(genotip){
  genot<-genot[complete.cases(genot),]
  genolist<-as.data.frame(genot[,1])
  colnames(genolist)[1]<-"ACCENUMB"
  geogra1<-pasaporte[,c(2,25,23)]
  geogra1<-merge(geogra1,genolist,by="ACCENUMB",all.y=TRUE)
  geogra2<-daisy(geogra1[,-1],metric="euclidean",stand=FALSE)
  #Exporta
  matriz.geogra<-as.matrix(geogra2)
  colnames(matriz.geogra)<-geogra1$ACCENUMB
  rownames(matriz.geogra)<-geogra1$ACCENUMB
  setwd(paste(resultadosMantel))
  write.table(matriz.geogra,file="Matriz_distancias_geograficas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(matriz.geogra,file="Matriz_distancias_geograficas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  setwd(paste(ruta))
  #Genodist
  genodist<-dist.binary(genot[,-1],method=csimilar)
  #Exportar
  matriz.genodist<-as.matrix(genodist)
  colnames(matriz.genodist)<-genot$ACCENUMB
  rownames(matriz.genodist)<-genot$ACCENUMB
  setwd(paste(resultadosMantel))
  write.table(matriz.genodist,file="Matriz_distancias_genotipicas.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(matriz.genodist,file="Matriz_distancias_genotipicas.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  setwd(paste(ruta))
  #Mantel
  mantel.geno.geo<-mantel(genodist,geogra2,method=paste(mantelmeth),permutations=mantelper)
  t1<-"Mantel matrix correlation - genotypic vs. geographic"
  tablamantel<-as.data.frame(cbind(t1,mantel.geno.geo$method,mantel.geno.geo$statistic,mantel.geno.geo$signif,mantel.geno.geo$permutations))
  colnames(tablamantel)[1]<-"Componentes comparados"
  colnames(tablamantel)[2]<-"Método"
  colnames(tablamantel)[3]<-"Estadístico de Mantel"
  colnames(tablamantel)[4]<-"significancia"
  colnames(tablamantel)[5]<-"Número permutaciones"
  setwd(paste(resultadosMantel))
  write.table(tablamantel,file="Mantel_genotypic_Vs_geographic.txt", sep = "\t", row.names = FALSE, qmethod = "double")
  write.table(tablamantel,file="Mantel_genotypic_Vs_geographic.xls", sep = "\t", row.names = FALSE, qmethod = "double")
  setwd(paste(ruta))
  write("15.5 Terminado analisis Mantel genotypic vs geographic", file="Error/process_info.txt", append=TRUE)
}


