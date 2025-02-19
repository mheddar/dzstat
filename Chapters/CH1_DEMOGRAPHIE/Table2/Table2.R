library(ggplot2)
library(readxl)


table2 <- read_excel("Table2.xlsx")


taper <- ggplot(data = table2, aes(x=Ann�es))+
  geom_line(aes(y = Tauxbrutdenatalit�PER, color = "Birthrate"), size = 1.2) +
  geom_line(aes(y = Tauxbrutmortalit�PER, color = "Mortality"), size = 1.2) +
  geom_line(aes(y = TauxaccroissnatPER, color = "T Increase"), size = 1.2) +
  labs( title = "Demographic Indicators: Crude Birth Rate, Mortality and Natural Increase",subtitle = "(1967-2011)",caption = "Data from ONS, Web: bit.ly/DzStat", x = "Years",y = "Percent %") +
  theme_light()

taper + theme(legend.justification=c(1,1), legend.position=c(0.99,0.99))
ggsave(file = "Table2.png", width = 6.5, height = 4, dpi = 300)

head(table2)

taMil <- ggplot(data = table2, aes(x = Ann�es)) +
  geom_line(aes(y = NaisVivcormil, color = "Corrected live births"), size = 1.2) +
  geom_line(aes(y = D�c�sCorrig�smil, color = "Corrected Deaths"), size = 1.2) +
  labs(title = "Demographic Indicators: Crude Birth Rate, Mortality and Natural Increase", subtitle = "(1967-2011)",caption = "Data from ONS, Web: bit.ly/DzStat",x = "Years",y = "Total Number in Thousands") + 
  theme_light() +
  theme(legend.justification = c(1,0.5), legend.position = c(0.99,0.3))
taMil

ggsave(file = "Table2-2.png", width = 6.5, height = 4, dpi = 300)

