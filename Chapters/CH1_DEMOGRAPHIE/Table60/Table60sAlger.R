library(ggplot2)
library(readxl)
library(tidyr)
library(hrbrthemes)
library(latex2exp)
library(virdis)

table60salger <- read.csv("Table60sAlger.csv")


meltable <- gather(table60salger,"year","density" ,-Wilaya)

write.csv(meltable, "Table60MeltedsAlger.csv")

htdata <- read.csv("Table60Melted.csv")

htdata[,3] <- as.character(htdata[,3])

ggplot(htdata, aes(year, Wilaya, fill= density)) + 
  geom_tile()  +
  scale_fill_distiller(palette = "Spectral", trans = "log", direction = -1, breaks = c(1,20,400,6000)) +
  labs(title = "Evolution of the Total Resident Population Density in Five Censuses.", subtitle = "(1966-2008)", caption = "Data from ONS, Web: bit.ly/DzStat", fill= TeX("$p/km^2$"))+
  theme_light()
       