#--------------------------------------------------------------
# Operadores logicos en la libreria de dyplr
# Igual (== )
# Mayor o menor que (< o >, mayor o igual que >=) 
#diferente de !=
# y (&)
# o (|)
#--------------------------------------------------------
#Filtrar y limpiar datasets 
# Limpieza de base de datos con dyplr 
# este paquete utiliza funciones como:
#select: devuelve solo las columnas indicadas de un dataframe.

#filter: permite filtrar filas de una data frame seg?n una expresi?n l?gica.

#arrange: ordena las filas de un data frame en funcion de los valores de una o 
#más columnas.

#rename: permite cambiar el nombre de una columna.

#mutate: permite agregar una nueva columna o transformar una existente.

#summarise: permite realizar resumenes estadísticos de variables en un data frame.

# group_by: para agrupar datos según una variable

#Utiliza este simbolo %>%  shift+control+m
#----------------------------------------------------------------
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
# Tambien por posiciones de columnas 
diamonds %>% select(2,7)
# seleccionar columnas que empiezen con una letra
diamonds %>% select(starts_with("c"))
#seleccionar solo columnas numericas
diamonds %>% select_if(is.numeric)
# poner una columna de primera
diamonds %>% select("cut", everything())

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

# group_by and summarise
diamonds %>% group_by(cut) %>% summarise(mean(price))

#-----------------------------------------------------
# library tidyr
# para limpieza de datos. Esos datos siguen dos principios que ya hemos visto reiteradamente: 
# Cada variable está en una sola columna y cada fila es una observación. funciona con:

# gather()
#La función toma las columnas múltiples, las colapsa en una sola 
#y crea una nueva columna con los valores respectivos

#data %>% gather(key, value, columnas). Donde:
#data: es la tabla o el data frame
#key: es el nombre que le voy a dar a la variable que voy a “fundir”.
#value: nombre de la variable que va a guardar los valores.
#columna: las columnas que quiero fundir. Podemos ponerlas separadas por coma, 
#o podemos usar el operador - para seleccionar todas las columnas menos una.

maize<-read.csv2(file.choose(), header = TRUE)
str(maize)

nyp<-maize %>% group_by(System) %>% summarise(mean(Nitrogen), mean(Phosphorus))
datos<-nyp %>% gather(variables, mean, -System )
library(ggplot2)
ggplot(datos, aes(x=System, y=mean, fill=variables))+
  geom_col()+ theme_classic() + scale_y_continuous(expand = c(0,0))
