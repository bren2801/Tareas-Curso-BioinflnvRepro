fullmat <- read.delim ("../meta/maizteocintle_SNP50k_meta_extended.txt") # se carga la base de datos y se forma un nuevo objeto llamado fullmat


#�Qu� tipo de objeto creamos al cargar la base?
class(fullmat)

#�C�mo se ven las primeras 6 l�neas del archivo?
fullmat[1:6,] #muestra las primeras 6 l�neas del archivo

#�Cu�ntas muestras hay?
dim (fullmat) #muestra el n�mero de filas (n�mero de muestras) y el n�mero de columnas (n�mero de variables)

#�De cu�ntos estados se tienen muestras?
length(unique(fullmat$Estado)) #muestra el n�mero de valores �nicos de la columna Estado

#�Cu�ntas muestras fueron colectadas antes de 1980?
sum(fullmat$`A_o._de_colecta`<1980,na.rm =TRUE) #cuenta el n�mero de datos menores a 1980 en de la variable a�o de colecta

#�Cu�ntas muestras hay de cada raza?
table(fullmat$Raza) #muestra la frecuencia de cada raza

#En promedio �a qu� altitud fueron colectadas las muestras?

mean(fullmat$Altitud) #muestra el promedio de los valores en la columna Altitud

#�Y a qu� altitud m�xima y m�nima fueron colectadas?
range(fullmat$Altitud) #muestra el valor m�nimo y m�ximo de la columna Altitud

#Crea una nueva df de datos s�lo con las muestras de la raza Olotillo
Olotillo <- subset(fullmat, Raza == "Olotillo")

#Crea una nueva df de datos s�lo con las muestras de la raza Reventador, Jala y Ancho
reventador <- subset(fullmat, Raza == "Reventador") #Crea una nueva df de datos s�lo con las muestras de la raza reventador
jala <- subset(fullmat, Raza == "Jala") #Crea una nueva df de datos s�lo con las muestras de la raza Jala
Ancho <- subset(fullmat, Raza == "Ancho") #Crea una nueva df de datos s�lo con las muestras de la raza Ancho
submat<- rbind(reventador,jala,Ancho) #Une los tres dataframes en uno solo

#Escribe la matriz anterior a un archivo llamado "submat.cvs" en /meta.
write.csv(submat, '../meta/submat.cvs')
