# 
library(stats)
library(ggplot2)
library(tidyverse)
library(latex2exp)
library(ggtext)
library(extrafont)
font_import()
loadfonts(device = "win")

co2 <- read.csv2("co2.csv", header = T)
View(co2)
str(co2)
quebec<- co2 %>% mutate(conc= as.factor(conc)) %>% 
  mutate(prom.uptake= as.numeric(prom.uptake)) %>% mutate(sd.uptake= as.numeric(sd.uptake))

str(quebec)

theme_set(theme_test())

ggplot(data = quebec, aes(x= conc, y=prom.uptake ,group = Tratamiento ,colour=Tratamiento ))+ geom_line()+
  geom_point(size = 3.2)+ geom_errorbar(aes(ymin=prom.uptake-sd.uptake, ymax=prom.uptake+sd.uptake , group =Tratamiento ), width=.1)+
  scale_color_manual(values = c("deepskyblue1","firebrick2"))+ facet_grid(Type ~ .)+
  labs(title= "CO2 en plantas herbáceas", 
subtitle=paste0("Absorción de CO2 de *Echinochloa crus-galli* en dos sitios 
(Quebec y Mississippi) 
sometida a dos tratamamientos:",
"<span style = 'color:deepskyblue1'>**Control**</span>", " y " , "<span style = 'color:firebrick2'>**Enfriado**</span>" ) , x= TeX(r"(Concentración CO2 $(ml/L)$)"), y= TeX(r"(Absorción CO2 $(\mu mol/m^{2}s)$)"), caption = "Base de datos tomada de la libreria stats (CO2)")+
theme(strip.background = element_rect(fill = "white", colour = "black"), strip.text = element_text(face = "bold", size = 12),
        legend.position = c(0.1, 0.9), plot.subtitle =  ggtext::element_markdown())

  
ggplot(data = quebec, aes(x= conc, y=prom.uptake ,group = Tratamiento ,colour=Tratamiento ))+ geom_line()+
  geom_point(size = 3.2)+ geom_errorbar(aes(ymin=prom.uptake-sd.uptake, ymax=prom.uptake+sd.uptake , group =Tratamiento ), width=.1)+
  scale_color_manual(values = c("deepskyblue1","firebrick2"))+ facet_grid(Type ~ .)+
  labs(x= TeX(r"(Concentración CO2 $(ml/L)$)"), y= TeX(r"(Absorción CO2 $(\mu mol/m^{2}s)$)"), caption = "Base de datos tomada de la libreria stats (CO2)")+
  theme(strip.background = element_rect(fill = "white", colour = "black"), strip.text = element_text(face = "bold", size = 12),
        legend.position = c(0.1, 0.9), text = element_text(size = 14, family="Microsoft Sans Serif"), axis.text = element_text(size = 14), legend.text = element_text(size = 12) )
