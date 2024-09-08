library(ggplot2)
library(readxl)

table33 <- read_xlsx("Table33.xlsx")


ggplot(data = table33, aes(x= Year))+
  geom_line(aes(y = Male, color = "Male"), size = 1.2) +
  geom_line(aes(y = Female, color = "Female"), size = 1.2) +
  labs(title = "Algerian Resident Population Distribution by Sex and Year. Estimates at Mid-Year.",subtitle = "(1966-2011)", caption = "Data from ONS, Web: bit.ly/DzStat", y = "Population", color = "Gender") +
  theme_light() + 
  theme(legend.justification = c(1,0), legend.position = c(0.99,0.01))+
  scale_y_continuous(breaks = c(6e3,8e3,10e3,12e3,14e3,16e3,18e3), labels = c("6 Mil","8 Mil","10 Mil","12 Mil","14 Mil","16 Mil","18 Mil"))
  

ggsave("Table33.png", width = 6.5, height = 4, dpi = 300)

malfem <- table33[,1]
malfem[,2] <- table33[,2] - table33[,3]


ggplot(data = malfem, aes(x= Year, y= Male)) +
  geom_bar(aes(fill = Male > 0), stat = "identity") + 
  #scale_fill_manual(guide = FALSE, breaks = c(TRUE, FALSE), values=c("gray", "red")) +
  theme_light() +
  labs(title = "Male minus female population", subtitle = "(1966-2011)", y = "Difference", caption = "Data from ONS, Web: bit.ly/DzStat") +
  theme(legend.position = "none")

ggsave("Table33-1.png", width = 6.5, height = 4, dpi = 300)

           