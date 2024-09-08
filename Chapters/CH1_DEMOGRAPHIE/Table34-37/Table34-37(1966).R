library(ggplot2)
library(readxl)
library(reshape2)

table34 <- read_xlsx("Table34-37.xlsx")

table34y66 <- table34[3:19,c("YearG","Tmale","Tfemale")]
table34y66[,"Tfemale"] <- -table34y66[,"Tfemale"]
colnames(table34y66) <- c("YearG", "Male", "Female")

grdata <- melt(table34y66, YearG = c("Male","Female"))
write.csv(grdata, "grdata.csv")


# X Axis Breaks and Labels 
brks <- seq(-1500000, 1500000, 500000)
lbls = paste0(as.character(c(seq(150, 0, -50), seq(50, 150, 50))), "k")

# Plot
ggplot(grdata, aes(x = YearG, y = value, fill = variable)) +   # Fill column
  geom_bar(stat = "identity", width = .6) +   # draw the bars
  scale_y_continuous(breaks = brks,   # Breaks
                     labels = lbls) + # Labels
  coord_flip() +  # Flip axes
  labs(title="Algerian Resident Population by Sex and Age Groups",
       subtitle = "(Census 1966)",
       y = "Population",
       x = "Year Groups",
       fill = "Gender",
       caption = "Data from ONS, Web: bit.ly/DzStat") +
  theme_light() + 
  theme(axis.ticks = element_blank(), legend.justification = c(1,1), legend.position = c(0.99,0.99)) +   # Centre plot title
  scale_fill_brewer(palette = "Dark2")  # Color palette
ggsave("Table34-37(1966).png", width = 6.5, height = 4, dpi = 300)
