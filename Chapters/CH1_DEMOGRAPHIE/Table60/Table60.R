library(ggplot2)
library(readxl)
library(reshape2)
library(hrbrthemes)

table60 <- read_excel("Table60.xlsx")

row.names(table60) <- table60$Wilaya


table60W <- table60[,2:5]

meltable <- gather(table60,"year","density" ,-Wilaya)

write.csv(meltable, "Table60Melted.csv")

htdata <- read.csv("Table60Melted.csv")

ggplot(htdata, aes(year, Wilaya, fill= density)) + 
  geom_tile()  +
  scale_fill_distiller(palette = "RdPu")
