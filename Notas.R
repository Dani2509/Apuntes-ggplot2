
# opciones para abrir bases de datos 
read.csv2("nombre de la base de datos", header = TRUE)
read.csv2(file.choose(), header = TRUE) # esta te abrira una ventana para buscarla
# tambien usando la libreria tidyverse

# para cargar varias libreria se usa el comando p_load(ggplot2, carr)
library(pacman) # para cargar el p_load debes cargar este paquete, si el 
#paquete no esta disponible, el paquete lo descargara por ti

#------------------------------------------------------------------------

# Libreria esquisse 
install.packages("esquisse")
library(esquisse)
library(tidyverse)
install.packages("modeldata")
library(modeldata)
# una vez cargada la base de datos, se procede a ejecutar el comando
esquisser()

#-----------------------------------------------------------------------
# Limpieza de base de datos con dyplr 
# este paquete utiliza funciones como:
#select: devuelve solo las columnas indicadas de un dataframe.

#filter: permite filtrar filas de una data frame seg?n una expresi?n l?gica.

#arrange: ordena las filas de un data frame en funci?n de los valores de una o 
#m?s columnas.

#rename: permite cambiar el nombre de una columna.

#mutate: permite agregar una nueva columna o transformar una existente.

#summarise: permite realizar res?menes estad?sticos de variables en un data frame.

#Utiliza este simbolo %>% 

library(tidyverse)
install.packages("dyplr")
library(dyplr)

# funcion select
install.packages("diamonds")
diamonds
select(diamonds, carat,cut,price) # esta es una forma, la otra es usando %>% 
diamonds %>% select(carat,cut,price)
#podemos quitar columnas
diamonds %>% select(-cut,-price)
# Tambi?n por posiciones de columnas 
diamonds %>% select(2,7)
# seleccionar columnas que empiezen con una letra
diamonds %>% select(starts_with("c"))
#seleccionar solo columnas numericas
diamonds %>% select_if(is.numeric)

# Filter
diamonds %>% filter(price>500)
#para agregar varias condiciones 
diamonds %>% filter(price>500 & cut=="Ideal")
diamonds %>% filter(price>500, cut=="Ideal")# es igual a la primera

#rename
diamonds %>% rename(precio=price, corte=cut)

#transform modifica una columna existente y mutate agrega columnas nuevas
str(diamonds)
diamonds %>% transform(clarity=as.character(clarity))
maize<- datos%>%mutate_at(c("Nitrogen", "Phosphorus","Potassium","YIELD", "Year"), as.numeric)
