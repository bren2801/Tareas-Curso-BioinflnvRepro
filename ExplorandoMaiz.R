fullmat <- read.delim ("../meta/maizteocintle_SNP50k_meta_extended.txt") # se carga la base de datos y se forma un nuevo objeto llamado fullmat


#¿Qué tipo de objeto creamos al cargar la base?
class(fullmat)

#¿Cómo se ven las primeras 6 líneas del archivo?
fullmat[1:6,] #muestra las primeras 6 líneas del archivo

#¿Cuántas muestras hay?
dim (fullmat) #muestra el número de filas (número de muestras) y el número de columnas (número de variables)

#¿De cuántos estados se tienen muestras?
length(unique(fullmat$Estado)) #muestra el número de valores únicos de la columna Estado

#¿Cuántas muestras fueron colectadas antes de 1980?
sum(fullmat$`A_o._de_colecta`<1980,na.rm =TRUE) #cuenta el número de datos menores a 1980 en de la variable año de colecta

#¿Cuántas muestras hay de cada raza?
table(fullmat$Raza) #muestra la frecuencia de cada raza

#En promedio ¿a qué altitud fueron colectadas las muestras?

mean(fullmat$Altitud) #muestra el promedio de los valores en la columna Altitud

#¿Y a qué altitud máxima y mínima fueron colectadas?
range(fullmat$Altitud) #muestra el valor mínimo y máximo de la columna Altitud

#Crea una nueva df de datos sólo con las muestras de la raza Olotillo
Olotillo <- subset(fullmat, Raza == "Olotillo")

#Crea una nueva df de datos sólo con las muestras de la raza Reventador, Jala y Ancho
reventador <- subset(fullmat, Raza == "Reventador") #Crea una nueva df de datos sólo con las muestras de la raza reventador
jala <- subset(fullmat, Raza == "Jala") #Crea una nueva df de datos sólo con las muestras de la raza Jala
Ancho <- subset(fullmat, Raza == "Ancho") #Crea una nueva df de datos sólo con las muestras de la raza Ancho
submat<- rbind(reventador,jala,Ancho) #Une los tres dataframes en uno solo

#Escribe la matriz anterior a un archivo llamado "submat.cvs" en /meta.
write.csv(submat, '../meta/submat.cvs')
