#############################################
#Script de par?metros ECOGEO 2020
#############################################
#Para citar CAPFITOGEN3 en publicaciones use: Parra-Quijano, M. (2020). CAPFITOGEN 3: Una caja de herramientas para la conservaci?n y utilizaci?n de la biodiversidad agr?cola. Bogot?, Colombia. URL http://www.capfitogen.net/es

####C?mo usar este script: Por favor configure cada par?metro, seleccione todas las l?neas de este script y haga click en el bot?n "Run". Luego, abra por favor el script de herramienta correspondiente y ejec?telo.

#### para cada par?metro (palabra en color negro) por favor asigne un valor o seleccione una opci?n

ruta<-"C:/Users/Elia/CAPFITOGEN3"
#Par?metro de tipo texto (un texto que va entre comillas "")
#### Nota: Es la ruta donde se encuentra la estructura de carpetas y archivos que son necesarios para ejecutar las herramientas. Usualmente es una carpeta llamada CAPFITOGEN2 o CAPFITOGEN3 que esta localizada en la ra?z del disco duro principal (usualmente c:/)

#pais<-"Ecuador"
#pais<-"Colombia"
pais<-"Spain"
#pais<-"United States"
#pais<-"Argentina"
#pais<-"Bolivia"
#pais<-"Brasil"
#pais<-"Chile"
#pais<-"Chile continental"
#pais<-"Canada"
#pais<-"Meso America"
#pais<-"Russia"
#pais<-"South America"
#pais<-"Costa Rica"
#pais<-"World"
#pais<-"user1"
#etc
#Par?metro de tipo texto (un texto que va entre comillas "")
##### Nota: El pa?s/regi?n seleccionado (usualmente la primera letra en may?scula como "Ecuador") debe contar con la correspondiente carpeta (con el nombre del pa?s pero ah? en min?scula "ecuador") en rdatamaps.
##### Nota2: el nombre del pa?s se debe escribir como aparece en la tabla lista_paises.xlsx, tal y como aparece en la columna "Way to write country name (pais parameter)" 

#############################################
#Pasaporte y GEOQUAL
#############################################

pasaporte<-"data.txt"
#Par?metro de tipo texto (un texto que va entre comillas "")
# Nota1: este archivo de texto debe estar en la carpeta Pasaporte, que a su vez es una carpeta que est? dentro de "ruta"
# Nota2: esta tabla es de igual que estructura a otras tablas de pasaporte. Puede haber pasado ya por la herramienta GEOQUAL

geoqual<-FALSE
#Par?metro tipo TRUE o FALSE
# Nota: Tiene el pasaporte evaluaci?n GEOQUAL (4 variables adicionales en la parte derecha de la tabla?)

totalqual<-50 #Solo aplica si geoqual=TRUE
#Par?metro tipo n?mero (el cual en Rstudio aparecer? con color azul)
##### Nota1: Umbral permitido para GEOQUAL (valores iguales o superiores al indicado del par?metro TOTALQUAL)
##### Nota2: Debe ser un valor entre 0 y 100. Si el valor estipulado para totalqual es muy alto y ning?n registro en la tabla pasaporte tiene valores superiores en la columna TOTALQUAL100 a dicho valor, seguramente se generar? un error.

#############################################
#Ecogeogr?fico
#############################################
 
ecogeo<-TRUE
#Par?metro tipo TRUE o FALSE
##### Nota: Extracci?n/an?lisis de la diversidad ecogeogr?fica?
##### Nota: Este par?metro =TRUE implica que se va a caracterizar ecogeogr?ficamente, lo que generar? una carpeta con los resultados particulares de dicha caracterizaci?n 

buffy<-FALSE #S?lo aplica cuando ecogeo=TRUE
#Par?metro tipo TRUE o FALSE
##### Nota1: Forma de extracci?n, desea incluir celdas contiguas (zona buffer) para calcular el valor adjudicado a cada sitio de recolecci?n?
##### Nota2: elegir buffy=TRUE puede ralentizar el proceso de extracci?n, pues obliga a R a extraer valores para cada punto (que viene de las coordenadas de los registros en la tabla de pasaporte) no s?lo de la celda donde caen (extracci?n simple, cuando buffy=FALSE) sino de las celdas adhyacentes, cuyos valores se promedian... eso hace m?s lenta la operaci?n

tamp<-2000 #S?lo aplica cuando buffy=TRUE
#Par?metro tipo n?mero (el cual en Rstudio aparecer? con color azul)
##### Nota1: Radio de la zona buffer que desea aplicar para calcular el valor que se le asignar? a cada sitio de recolecci?n (en metros)
##### Nota2: un tamp muy grande (>10000) combinado con una resoluci?n (resol1) muy alta (1x1), generar? procesos muy lentos de extracci?n

#resol1<-"Celdas 1x1 km aprox (30 arc-seg)" #S?lo aplica cuando ecogeo=TRUE
resol1<-"Celdas 5x5 km aprox (2.5 arc-min)"
#resol1<-"celdas 20x20 km aprox (10 arc-min)"
#resol1<-"celdas 10x10 km aprox (5 arc-min)"
#Par?metro de tipo texto (un texto que va entre comillas "")
###### Nota1: Este par?metro indica la resoluci?n a la que se quiere extraer info ecogeogr?fica
###### Nota2: resol1 significa la resoluci?n de las capas ecogeogr?ficas que se van a usar para extraer informaci?n para cada punto. resol1 debe existir como carpeta "1x1", "5x5", "10x10" o "20x20" dentro de rdatamaps/nombre_pais

bioclimsn<-TRUE #S?lo aplica si ecogeo=TRUE
#Par?metro tipo TRUE o FALSE
##### Nota1: en este par?metro se debe indicar... se desea extraer informaci?n de variables bioclim?ticas?
##### Nota2: variables ecogeogr?ficas (bioclim?ticas) para las que se quiere extraer informaci?n para los puntos que vienen de la tabla pasaporte:

bioclimv<-c("Temp prom anual" , "Temp prom cuarto mas calido" , "Temp prom cuarto mas frio" , "Prec anual" , "Prec mes mas humedo" , "Prec mes mas seco" , "Estacionalidad prec" , "Prec cuarto  mas humedo" , "Prec cuarto mas seco" , "Prec cuarto mas calido" , "Prec cuarto mas frio" , "Rango prom temp diurnas" , "Isotermalidad" , "Estacionalidad temp" , "Max temp mes mas calido" , "Min temp mes mas frio" , "Rango temp anual" , "Temp prom cuarto humedo" , "Temp prom cuarto seco" , "Prec prom 1" , "Prec prom 10" , "Prec prom 11" , "Prec prom 12" , "Prec prom 2" , "Prec prom 3" , "Prec prom 4" , "Prec prom 5" , "Prec prom 6" , "Prec prom 7" , "Prec prom 8" , "Prec prom 9" , "Temp max 1" , "Temp max 10" , "Temp max 11" , "Temp max 12" , "Temp max 2" , "Temp max 3" , "Temp max 4" , "Temp max 5" , "Temp max 6" , "Temp max 7" , "Temp max 8" , "Temp max 9" , "Temp prom 1" , "Temp prom 10" , "Temp prom 11" , "Temp prom 12" , "Temp prom 2" , "Temp prom 3" , "Temp prom 4" , "Temp prom 5" , "Temp prom 6" , "Temp prom 7" , "Temp prom 8" , "Temp prom 9" , "Temp min 1" , "Temp min 10" , "Temp min 11" , "Temp min 12" , "Temp min 2" , "Temp min 3" , "Temp min 4" , "Temp min 5" , "Temp min 6" , "Temp min 7" , "Temp min 8" , "Temp min 9")
###Lista completa de variables bioclim?ticas, para m?s informaci?n ver tabla de variables y sus correspondientes descripciones en ingl?s y espa?ol:
#bioclimv<-c("Temp prom anual" , "Temp prom cuarto mas calido" , "Temp prom cuarto mas frio" , "Prec anual" , "Prec mes mas humedo" , "Prec mes mas seco" , "Estacionalidad prec" , "Prec cuarto  mas humedo" , "Prec cuarto mas seco" , "Prec cuarto mas calido" , "Prec cuarto mas frio" , "Rango prom temp diurnas" , "Isotermalidad" , "Estacionalidad temp" , "Max temp mes mas calido" , "Min temp mes mas frio" , "Rango temp anual" , "Temp prom cuarto humedo" , "Temp prom cuarto seco" , "Prec prom 1" , "Prec prom 10" , "Prec prom 11" , "Prec prom 12" , "Prec prom 2" , "Prec prom 3" , "Prec prom 4" , "Prec prom 5" , "Prec prom 6" , "Prec prom 7" , "Prec prom 8" , "Prec prom 9" , "Temp max 1" , "Temp max 10" , "Temp max 11" , "Temp max 12" , "Temp max 2" , "Temp max 3" , "Temp max 4" , "Temp max 5" , "Temp max 6" , "Temp max 7" , "Temp max 8" , "Temp max 9" , "Temp prom 1" , "Temp prom 10" , "Temp prom 11" , "Temp prom 12" , "Temp prom 2" , "Temp prom 3" , "Temp prom 4" , "Temp prom 5" , "Temp prom 6" , "Temp prom 7" , "Temp prom 8" , "Temp prom 9" , "Temp min 1" , "Temp min 10" , "Temp min 11" , "Temp min 12" , "Temp min 2" , "Temp min 3" , "Temp min 4" , "Temp min 5" , "Temp min 6" , "Temp min 7" , "Temp min 8" , "Temp min 9" , "Presion de vapor 1" , "Presion de vapor 2" , "Presion de vapor 3" , "Presion de vapor 4" , "Presion de vapor 5" , "Presion de vapor 6" , "Presion de vapor 7" , "Presion de vapor 8" , "Presion de vapor 9" , "Presion de vapor 10" , "Presion de vapor 11" , "Presion de vapor 12" , "Presion de vapor anual")
###Lista de las 19 variables BIOCLIM:
#bioclimv<-c("Temp prom anual" , "Temp prom cuarto mas calido" , "Temp prom cuarto mas frio" , "Prec anual" , "Prec mes mas humedo" , "Prec mes mas seco" , "Estacionalidad prec" , "Prec cuarto  mas humedo" , "Prec cuarto mas seco" , "Prec cuarto mas calido" , "Prec cuarto mas frio" , "Rango prom temp diurnas" , "Isotermalidad" , "Estacionalidad temp" , "Max temp mes mas calido" , "Min temp mes mas frio" , "Rango temp anual" , "Temp prom cuarto humedo" , "Temp prom cuarto seco")
###Par?metro de tipo texto (un texto que va entre comillas ""), de tipo m?ltiple (se puede elegir m?s de una opci?n, poniendo todas las opciones entre comillas, separados por comas y todo dentro de un par de par?ntesis antecedido por la letra c)
##### Nota:Los nombres de las variables vienen de una columna de la tabla figvartotal.xlsx, denominada VARDESCR que est?n indicadas en la columna VARMODULO como "Bioclimatica"

edaphsn<-TRUE #S?lo aplica si ecogeo=TRUE
#Par?metro tipo TRUE o FALSE
##### Nota1: en este par?metro se debe indicar... se desea extraer informaci?n de variables ed?ficas?
##### Nota2: variables ecogeogr?ficas (ed?ficas) para las que se quiere extraer informaci?n para los puntos que vienen de la tabla pasaporte

edaphv<-c("Bulk density top","Clay content top","Soil pH H2O top","Sand content top","Avail soil water cap top")
#Lista completa de variables ed?ficas SOILGRIDS (m?s modernas), para m?s informaci?n ver tabla de variables y sus correspondientes descripciones en ingl?s y espa?ol:
#edaphv<-c("Avail soil water cap h1 top","Avail soil water cap h2 top","Avail soil water cap h3 top","Sat water cont top","Depth to bedrock","R horizon","Bulk density top","Cation exchange cap top","Clay content top","Coarse fragments top","Organic carbon dens top","Organic carbon stock top","Organic carbon content top","Soil pH H2O top","Soil pH KCl top","Sodic soil grade","Silt content top","Sand content top","Avail soil water cap top")
#Par?metro de tipo texto (un texto que va entre comillas ""), de tipo m?ltiple (se puede elegir m?s de una opci?n, poniendo todas las opciones entre comillas, separados por comas y todo dentro de un par de par?ntesis antecedido por la letra c)
##### Nota:Los nombres de las variables vienen de una columna de la tabla figvartotal.xlsx, denominada VARDESCR que est?n indicadas en la columna VARMODULO como "Edafica"

geophyssn<-TRUE #S?lo aplica si ecogeo=TRUE
#Par?metro tipo TRUE o FALSE
##### Nota1: en este par?metro se debe indicar... se desea extraer informaci?n de variables geof?sicas?
##### Nota2: variables ecogeogr?ficas (geof?sicas) para las que se quiere extraer informaci?n para los puntos que vienen de la tabla pasaporte

geophysv<-c("Elevacion", "Norticidad", "Esticidad")
#Lista completa de variables geof?sicas, para m?s informaci?n ver tabla de variables y sus correspondientes descripciones en ingl?s y espa?ol:
#geophys<-c("Elevacion","Orientacion","Esticidad","Norticidad","Pendiente grados","Velocidad viento 1","Velocidad viento 2","Velocidad viento 3","Velocidad viento 4","Velocidad viento 5","Velocidad viento 6","Velocidad viento 7","Velocidad viento 8","Velocidad viento 9","Velocidad viento 10","Velocidad viento 11","Velocidad viento 12","Velocidad viento anual","Radiacion solar 1","Radiacion solar 2","Radiacion solar 3","Radiacion solar 4","Radiacion solar 5","Radiacion solar 6","Radiacion solar 7","Radiacion solar 8","Radiacion solar 9","Radiacion solar 10","Radiacion solar 11","Radiacion solar 12","Radiacion solar anual")
#Par?metro de tipo texto (un texto que va entre comillas ""), de tipo m?ltiple (se puede elegir m?s de una opci?n, poniendo todas las opciones entre comillas, separados por comas y todo dentro de un par de par?ntesis antecedido por la letra c)
##### Nota:Los nombres de las variables vienen de una columna de la tabla figvartotal.xlsx, denominada VARDESCR que est?n indicadas en la columna VARMODULO como "Geofisica"

latitud<-TRUE #S?lo aplica si ecogeo=TRUE
#Par?metro tipo TRUE o FALSE
##### Nota:Este par?metro indica si se la variable latitud (X) que viene de la columna DECLATITUDE de la tabla de pasaporte, se utilizar? para hacer la caracterizaci?n ecogeogrpafica (como variable geof?sica)
longitud<-TRUE #S?lo aplica si ecogeo=TRUE
#Par?metro tipo TRUE o FALSE
##### Nota1:Este par?metro indica si se la variable longitud (X) que viene de la columna DECLATITUDE de la tabla de pasaporte, se utilizar? para hacer la caracterizaci?n ecogeogrpafica (como variable geof?sica)
##### Nota2:Para DIVmapas latitud y longitud no se encuentran como capas en rdatamaps porque se obtienen directamente de las coordenadas en la tabla de pasaporte. Sin embargo, en los an?lisis de DIVmapas tanto latitud como longitud entrar?an como una variables geof?sicas

#############################################
#Fenotipo
#############################################

phenotip<-FALSE
#Par?metro tipo TRUE o FALSE
##### Nota1: Se generar? un mapa/an?lisis fenot?pico?
##### Nota2: Si phenotip=TRUE, el usuario deber? aportar una tabla espec?fica con los datos de caracerizaci?n fenot?pica. Esa tabla tiene una columna en com?n con la tabla pasaporte (ACCENUMB) y el resto son columnas de variables llamadas descriptores. Como hay descriptores (variables) de varios tipos y las funciones de R que hacen el an?lisis requieren reconocerlas, el usuario debe proveer otra tabla adicional que indica la naturaleza de cada variable.


phenot<-"Morfologia.txt" #S?lo aplica si phenotip=TRUE
#Par?metro de tipo texto (un texto que va entre comillas "")
##### Nota1: En este par?metro se debe indicar donde est? y c?mo se llama datos fenot?picos? (text box)
##### Nota2: en phenot se debe indicar el nombre de la tabla de caracterizaci?n (columna ACCENUMB m?s columnas para las dem?s variables), adicionando la extensi?n (.txt). Esta tabla el usuario la debe localizar en la carpeta CAPFITOGEN2/Pasaporte. Si, como en este caso, la tabla est? dentro de una subcarpeta dentro de pasaporte, se debe indicar la ruta a la tabla desde CAPFITOGEN2/Pasaporte... en este caso Pasaporte/Morfolog?a.txt 


phenotv<-"TablaNaturalezaVariables.txt" #S?lo aplica si phenotip=TRUE
#Par?metro de tipo texto (un texto que va entre comillas "")
##### Nota1: En este par?metro se debe indicar donde esta la tabla de la naturaleza de cada variable de la tabla de datos fenot?picos
##### Nota2: phenotv es el nombre de la tabla donde se indica la naturaleza de cada variable usada en la caracterizaci?n fenot?pica y que est? en la tabla phenot como una columnna

################################################
#Genotipo
################################################

genotip<-FALSE
#Par?metro tipo TRUE o FALSE
##### Nota1: Se generar? un mapa/an?lisis genot?pico?
##### Nota2: si genotip=TRUE, el usuario deber? aportar una tabla espec?fica con los datos de caracterizaci?n genot?pica. Esa tabla tiene una columna en com?n con la tabla pasaporte (ACCENUMB) y el resto son columnas de variables llamadas marcadores. Dicha tabla, como en el caso de la tabla de caracterizaci?n fenot?pica, debe estar en la ruta CAPFITOGEN2/Pasaporte

genot<-"AFLP.txt" #S?lo aplica para genotip=TRUE
#Par?metro de tipo texto (un texto que va entre comillas "")
##### Nota1: donde est? y c?mo se llama datos genot?picos? (text box)
##### Nota2: genot es el nombre de la tabla de datos genot?picos, que se debe encontrar en la ruta CAPFITOGEN2/Pasaporte. Si, como en este caso, la tabla est? dentro de una subcarpeta dentro de pasaporte, se debe indicar la ruta a la tabla desde CAPFITOGEN2/Pasaporte... en este caso Pasaporte/AFLP.txt  


neigd<-TRUE #S?lo aplica para genotip=TRUE
#Par?metro tipo TRUE o FALSE
##### Nota1: Desea obtener el Nei's gene diversity
##### Nota2: Si neigd=TRUE produce un tipo de an?lisis opcional y se generar?n ciertos productos dentro de la carpeta de resultados genot?picos

csimilar<-5 #S?lo aplica para genotip=TRUE
#csimilar<-1 #1=Jaccard 1901
#csimilar<-2 #2=SMC de Sokal&Michaner 1958
#csimilar<-3 #3=Sokal y Sneath
#csimilar<-4 #4=Rogers&Tanimoto 1960
#csimilar<-5 #5=Dice 1945
#csimilar<-6 #6=Hamman S9 de Gower y Legendre 1986
#csimilar<-7 #7=Ochiai 1957
#csimilar<-8 #8=Sokal y Sneath 1963
#csimilar<-9 #9=Phi de Pearson
#csimilar<-10 #10=S2 de Gower y Legendre
##### Nota1: el an?lisis de diversidad genot?pico requiere que se defina el algoritmo que se utilizar?. Ese algoritmo se define con un n?mero (de 1 a 10) en el parametro csimilar, de acuerdo a las opciones siguientes:
##### Nota2: Distancia a partir de un coeficiente deseado(d=sqrt(1-s) siendo s el coeficiente de similaridad)

#############################################
#Analisis multivariados cl?sicos: los par?metros de esta secci?n pueden generar an?lisis y resultados adicionales a los que generan ecogeo, phenotip y genotip
#############################################

ecogeoclus<-FALSE #S?lo aplica para ecogeo=TRUE
#Par?metro tipo TRUE o FALSE
##### Nota: Desea un an?lisis de agrupamientos ?nico para todas las entradas por los datos de caracterizaci?n ecogeogr?fica?


ecogeoclustype<-"average" #s?lo aplica si ecogeoclus=TRUE 
#ecogeoclustype<-"single" #nearest neighbor
#ecogeoclustype<-"complete" #furthest neighbor or compact
#ecogeoclustype<-"ward" #Ward's minimum variance method
#ecogeoclustype<-"mcquitty" #McQuitty's method (WPGMA)
#ecogeoclustype<-"average" #average similarity (UPGMA)
#ecogeoclustype<-"median" #median (as opposed to average) similarity (WPGMC)
#ecogeoclustype<-"centroid" #geometric centroid (UPGMC)
#ecogeoclustype<-"flexible" #flexible Beta
#Par?metro de tipo texto (un texto que va entre comillas "")
##### Nota1: Ecogeoclustype define el algoritmo de agrupaci?n multivariado que se usar? sobre los datos de caracterizaci?n ecogeogr?fica. Las posibilidades son:
##### Nota2: Que tipo de agrupamiento jer?rquico desea (UPGMA="average", single-linkage="single", complete-linkage="complete", Ward's method="ward" o weighted average="weighted")?

ecogeopca<-FALSE #S?lo aplica para ecogeo=TRUE
#Par?metro tipo TRUE o FALSE
##### Nota: Desea un an?lisis de componentes principales para todas las entradas por los datos de caracterizaci?n ecogeogr?fica?

ecogeopcaxe<-5 #S?lo aplica para ecogeopca=TRUE
#Par?metro tipo n?mero (el cual en Rstudio aparecer? con color azul)
##### Nota: ecogeopcaxe es un n?mero que define los componentes principales que ser?n analizados en detalle. Debe ser como m?ximo el n?mero de variables ecogeogr?ficas utilizadas (bioclimv+edaphv+geophysv) -1. Por ejemplo si sumadas todas las variables de bioclimv+edaphv+geophysv= 20, ecogeopcaxe no puede ser mayor a 19. 

phenoclus<-FALSE #S?lo aplica para phenotip=TRUE
#Par?metro tipo TRUE o FALSE
##### Nota: Desea un an?lisis de agrupamientos ?nico para todas las entradas por los datos de caracterizaci?n fenot?pica?

phenoclustype<-"average" #S?lo aplica para phenoclus=TRUE
#phenoclustype<-"single" #nearest neighbor
#phenoclustype<-"complete" #furthest neighbor or compact
#phenoclustype<-"ward" #Ward's minimum variance method
#phenoclustype<-"mcquitty" #McQuitty's method (WPGMA)
#phenoclustype<-"average" #average similarity (UPGMA)
#phenoclustype<-"median" #median (as opposed to average) similarity (WPGMC)
#phenoclustype<-"centroid" #geometric centroid (UPGMC)
#phenoclustype<-"flexible" #flexible Beta
#Par?metro de tipo texto (un texto que va entre comillas "")
##### Nota1: phenoclustype define el algoritmo de agrupaci?n multivariado que se usar? sobre los datos de caracterizaci?n fenot?pica. Las posibilidades son:
##### Nota2: Que tipo de agrupamiento jer?rquico desea (UPGMA="average", single-linkage="single", complete-linkage="complete", Ward's method="ward" o weighted average="weighted")?

phenopca<-FALSE #S?lo aplica para phenotip=TRUE
#Par?metro tipo TRUE o FALSE
##### Nota1: Desea un an?lisis de componentes/coordenadas principales para todas las entradas por los datos de caracterizaci?n ecogeogr?fica?

phenopcaxe<-3 #S?lo aplica para phenopca=TRUE
#Par?metro tipo n?mero (el cual en Rstudio aparecer? con color azul)
##### Nota1: N?mero de ejes a extraer (an?lisis fenot?pico)
##### Nota2: phenopcaxe es un n?mero que define los componentes principales que ser?n analizados en detalle. Debe ser como m?ximo el n?mero de variables/descriptores que aparecen en la tabla de caracterizaci?n fenot?pica -1. Si en esa tabla, aparte de la columna ACCENUMB aparecen 15 columnas con datos (variables/descriptores), entonces phenopcaxe no puede ser mayor que 14.

phenovarq<-FALSE #S?lo aplica para phenotip=TRUE
#Par?metro tipo TRUE o FALSE
##### Nota1: Los datos de caracterizaci?n fenot?pica contiene s?lo descriptores (variables) cuantitativos?
##### Nota2: esta es una pregunta necesaria para aplicar algunos m?todos en el script. Para saber si todas las variables/descriptores fenot?picos son cuantitativos o no, se debe ver en la tabla de la naturaleza de las variables, si todas las variables all? listadas aparecen como cuantitativas (phenovarq=TRUE) o no todas son cuantitativas (phenovarq=FALSE) 

genoclus<-TRUE #S?lo aplica para genotip=TRUE
#Par?metro tipo TRUE o FALSE
##### Nota: Desea un an?lisis de agrupamientos ?nico para todas las entradas por los datos de caracterizaci?n molecular (datos 0/1)?

genoclustype<-"average" #S?lo aplica si genoclus=TRUE
#genoclustype<-"single" #nearest neighbor
#genoclustype<-"complete" #furthest neighbor or compact
#genoclustype<-"ward" #Ward's minimum variance method
#genoclustype<-"mcquitty" #McQuitty's method (WPGMA)
#genoclustype<-"average" #average similarity (UPGMA)
#genoclustype<-"median" #median (as opposed to average) similarity (WPGMC)
#genoclustype<-"centroid" #geometric centroid (UPGMC)
#genoclustype<-"flexible" #flexible Beta
#Par?metro de tipo texto (un texto que va entre comillas "")
##### Nota1: genoclustype define el algoritmo de agrupaci?n multivariado que se usar? sobre los datos de caracterizaci?n genot?pica. Las posibilidades son:
##### Nota2: Que tipo de agrupamiento jer?rquico desea (UPGMA="average", single-linkage="single", complete-linkage="complete", Ward's method="ward" o weighted average="weighted")?

genopco<-FALSE #S?lo aplica para genotip=TRUE
#Par?metro tipo TRUE o FALSE
##### Nota: Desea un an?lisis de coordenadas principales para todas las entradas por los datos de caracterizaci?n molecular (datos 0/1)?

genopcoaxe<-5 #S?lo aplica para genopco=TRUE
#Par?metro tipo n?mero (el cual en Rstudio aparecer? con color azul)
##### Nota1: N?mero de ejes a extraer (an?lisis genot?pico)
##### Nota2: genopcoaxe es un n?mero que define las coodernadas principales que ser?n analizadas en detalle. Debe ser como m?ximo el n?mero de marcadores que aparecen en la tabla de caracterizaci?n genot?pica -1. Si en esa tabla, aparte de la columna ACCENUMB aparecen 15 columnas con datos (marcadores), entonces genopcoaxe no puede ser mayor que 14.

#############################################
#Comparaciones matriciales
#############################################

mantelt<-FALSE #S?lo aplica si al menos dos de los siguientes par?metros son = TRUE: ecogeo, phenotip, genotip
#Par?metro tipo TRUE o FALSE
##### Nota1: Desea hacer comparaciones matriciales entre los diferentes componentes analizados?
##### Nota2: mantelt=TRUE produce una nueva carpeta con resultados de las correlaciones matriciales de Mantel en la ruta de resultados

mantelmeth<-"pearson" #S?lo aplica si mantelt=TRUE
#mantelmeth<-"kendall"
#mantelmeth<-"sperman"
#Par?metro de tipo texto (un texto que va entre comillas "")
##### Nota: Tipo de correlaci?n a usar

mantelper<-999 #S?lo aplica si mantelt=TRUE
#Par?metro tipo n?mero (el cual en Rstudio aparecer? con color azul)
##### nota1: N?mero de permutaciones a usar en las correlaciones matriciales (numeric box)
##### nota2: Suelen ser n?meros entre 100 y 10000 o incluso m?s. Sin embargo, un gran n?mero de permutaciones puede generar errores de memoria o tiempos de ejecuci?n demasiado extensos.

#############################################
#Resultados
#############################################
resultados<-"C:/Users/Elia/Desktop/genetica/coordenadas y variables ecoclimaticas/CAPFITOGEN3/analisis/TD/results"
#Par?metro de tipo texto (un texto que va entre comillas "")
