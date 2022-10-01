# Introduccion a la gramatica del ggplot2
#Componente grafico 1: componente de los datos.

install.packages("ggplot2")
library(ggplot2)
str(iris)

#se sigue esta funci?n: 1.Data, 2.mapping, 3.geometria
ggplot(data = iris,mapping =aes(x = Sepal.Length, y = Sepal.Width))+
  geom_point()
# Tambien se puede hacer de la siguiente forma, a?adiendo el maping dentro de geom_point:
ggplot(data = iris)+
  geom_point(mapping =aes(x = Sepal.Length, y = Sepal.Width, colour= Species))
# con la funci?n colour=Species, se indica que te separen por color las 3 especies

# Con la gunci?n geom_smooth te a?ade una linea que se ajusta a los datos. Tambien te a?ade los
#maximos y minimos
ggplot(data = iris,mapping =aes(x = Sepal.Length, y = Sepal.Width, colour= Species))+
  geom_point()+geom_smooth()

# Con el colour en el geom_point se crea una linea general en todos los datos y no por separado
ggplot(data = iris,mapping =aes(x = Sepal.Length, y = Sepal.Width))+
  geom_point(aes(colour= Species))+geom_smooth()

# Se crea una funcion lineal en los datos y se elimina los maximos y minimos (observa lo nuevo en geom_smooth)
ggplot(data = iris,mapping =aes(x = Sepal.Length, y = Sepal.Width, colour= Species))+
  geom_point()+geom_smooth(method = "lm", se = FALSE)

#A?adiendo un nombre a la funci?n 
G1<-ggplot(data = iris,mapping =aes(x = Sepal.Length, y = Sepal.Width, colour= Species))+
  geom_point()+geom_smooth(method = "lm", se = FALSE)

#------------------------------------------------------------------------------------

#Componente grafico 2. Componente de apoyo a interpretation
# 1.codigo fig, 2.titulo, 3. titulo de ejes, 4.Nota al pie o fuente y 5.Leyenda
#A?adir a G1 los componentes de apoyo
G1+labs(tag ="Figura 1" , title = "Relaci?n largo vs ancho de s?palos" , x="Largo de s?palo (cm)", y="Ancho de s?palo(cm)", 
        caption = "Nota.creaci?n propia") + 
  scale_color_discrete("Especie")

#-----------------------------------------------------------------------------

#Componente grafico 3 . Est?tica
#1. plot(est?tica del grafico), 2.axis(ejes), 3.legend, 4.panel, 5.faceta 
G2<-G1+labs(tag ="Figura 1" , title = "Relaci?n largo vs ancho de s?palos" , x="Largo de s?palo (cm)", y="Ancho de s?palo(cm)", 
            caption = "Nota.creaci?n propia") + 
  scale_color_discrete("Especie")
#opcion 1------------------------------------------
G2+theme(panel.background = element_rect(fill = "white") , 
         axis.line = element_line(color = "black") , 
         text = element_text(family = "sans serif" , size = 14 ) , 
         legend.box.margin =margin(6,6,6,6),
         legend.box.background = element_rect())+ scale_colour_manual(values = c("blue", "gray", "black"))
#opcion 2------------------------------------------
# si quieres a?adir una escala de color diferente. mejor ponlo en esta secci?n 
G1+labs(tag ="Figura 1" , title = "Relaci?n largo vs ancho de s?palos" , x="Largo de s?palo (cm)", y="Ancho de s?palo(cm)", 
            caption = "Nota.creaci?n propia") + 
  scale_color_manual("Especie", values = c("blue", "black", "red")) 

#-----------------------------------------------------------------
#Ejercicio de base de datos ping?inos 

#Parte 1. Abriendo base de datos
install.packages("palmerpenguins")
library(palmerpenguins)
library(ggplot2)
datos<-na.omit(penguins)
datos
str(datos)
summary(datos)

#Parte 2 y 3. Cree un grafico base para relacionar las varibles 
#largo y profundidad del pico y se agrega color por especie
ggplot(data = datos,mapping =aes(x = bill_length_mm, y = bill_depth_mm, colour= species ))+geom_point()+
  theme_bw()

#Parte 4. Marque la tendencia 
ggplot(data = datos,mapping =aes(x = bill_length_mm, y =  bill_depth_mm, colour= species ))+
  geom_point(size = 2) + geom_smooth(method = "lm", se = FALSE)

p1<-ggplot(data = datos,mapping =aes(x = bill_length_mm, y =  bill_depth_mm, colour= species ))+
  geom_point(size = 2) + geom_smooth(method = "lm", se = FALSE)


#parte 5. Agregue el componente gráfico 2 
p1+labs(tag ="Figura 1" , title = "Relación de largo y profundidad del pico de 
        tres especies de ping?inos" , x="Largo de pico (mm)", y="Profundidad de pico (mm)", 
        caption = "Nota: creación propia") + 
  scale_color_manual("Especie", values = c("#A4D3EE", "#AEEEEE", "#607B8B"))

p2<-p1+labs(tag ="Figura 1" , title = "Relación de largo y profundidad del pico de 
            tres especies de ping?inos" , x="Largo de pico (mm)", y="Profundidad de pico (mm)", 
            caption = "Nota: creación propia") + 
  scale_color_manual("Especie", values = c("#A4D3EE", "#AEEEEE", "#607B8B"))

#parte 6. Mejore la estética con los componentes básicos 

p2+theme(panel.background = element_rect(fill = "white") , 
         axis.line = element_line(color = "black") , 
         text = element_text(family = "sans serif" , size = 12 ) , 
         legend.box.margin =margin(6,6,6,6),
         legend.key = element_rect(
           fill = "white", 
           colour = "white", 
           size = 1),
         legend.background = element_rect(
           fill = "white", 
           colour = "black", 
           size = 0.5))

p3<-p2+theme(panel.background = element_rect(fill = "white") , 
             axis.line = element_line(color = "black") , 
             text = element_text(family = "sans serif" , size = 12 ) , 
             legend.box.margin =margin(6,6,6,6),
             legend.key = element_rect(
               fill = "white", 
               colour = "white", 
               size = 1),
             legend.background = element_rect(
               fill = "white", 
               colour = "black", 
               size = 0.5))

install.packages("tidyverse")
library(tidyverse)
p3+stat_summary(data = datos %>%
                  group_by(species) %>%
                  summarise_all(mean), 
                geom = "point", size = 5, 
                color="black", shape=8)
#---------------------------------------------------------------------
# Diagramas
#diagrama de elipse
library(corrplot)
library(RColorBrewer)
corrplot.mixed(corr=cor(datos[, -c(1,2,4,5)]), upper.col = COL1('YlGn', 10),
               upper= "ellipse",
               lower= "number",
               lower.col ="black",
               tl.col= "black",
               tl.pos= "lt",
               tl.cex =0.7,
               number.cex=0.8)

