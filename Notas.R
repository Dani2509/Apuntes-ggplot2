# veamos si funciona github

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
glimpse() # alternativa a str()

