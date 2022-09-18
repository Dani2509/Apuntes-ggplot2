# graficos interactivos con plotly
install.packages("plotly")
library(plotly)
library(ggplot2)
library(tidyverse)

#usaremos la base de datos de gapminder 
install.packages("gapminder")
library(gapminder)
data("gapminder")
str(gapminder)

p<- ggplot(gapminder, aes(gdpPercap, lifeExp, color=continent))+ geom_point(aes(size=pop, frame= year,
                                                                                ids= country))+
  scale_x_log10()+
  scale_color_brewer(palette = "Spectral")+
  theme_bw()

ggplotly(p)


