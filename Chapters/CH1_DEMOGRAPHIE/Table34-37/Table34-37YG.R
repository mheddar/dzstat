library(ggplot2)
library(readxl)
library(reshape2)


# Reading & melting data --------------------------------------------------

ygtabel <- read.csv("table34FM.csv")
RColorBrewer::brewer.pal(8, "BuPu")
my_colors <- RColorBrewer::brewer.pal(8, "BuPu")[4:8]
my_colors

# Plotting the data -------------------------------------------------------


# X Axis Breaks and Labels 
brks <- seq(-2000000, 2000000, 500000)
lbls = paste0(as.character(c(seq(2, 0, -0.5), seq(0.5, 2, 0.5))), "m")


# Theme Variables ---------------------------------------------------------
lsize = 0.8;


# Plot
ggplot(ygtabel, aes(x = YearG, group = 1)) +
  # Gender Year Group distributtion -------------------------1999
  geom_area(aes(y= Male98, fill = "1999"), alpha=0.7) +
  geom_area(aes(y= Female98, fill= "1999"), alpha=0.7) +
  # Gender Year Group distributtion -------------------------1987
  geom_area(aes(y= Male87, fill = "1987"), alpha=0.7) +
  geom_area(aes(y= Female87, fill = "1987"), alpha=0.7) +
  # Gender Year Group distributtion -------------------------1977
  geom_area(aes(y= Male77, fill = "1977"), alpha=0.7) +
  geom_area(aes(y= Female77, fill = "1977"), alpha=0.7) +
  # Gender Year Group distributtion -------------------------1966
  geom_area(aes(y= Male66, fill = "1966"), alpha=0.7) +
  geom_area(aes(y= Female66, fill = "1966"), alpha=0.7) +
  scale_y_continuous(breaks = brks, labels = lbls) +
  # Plot labels -------------------------------------------------
  geom_label(aes(x = "25-29", y = 1.8e6, label = "Male"), size = 3, label.size = 0) +
  geom_label(aes(x = "25-29", y = -1.8e6, label = "Female"), size = 3, label.size = 0) +
  coord_flip() +
  labs(title="Algerian Resident Population by Sex and Age Groups",
       subtitle = "(1966-1999)",
       y = "Population",
       x = "Age Groups",
       fill = "Year",
       color = "Year",
       caption = "Data from ONS, Web: bit.ly/DzStat") +
  theme_light() + 
  scale_fill_brewer(palette = "BuPu") + 
  theme(axis.ticks = element_blank(), legend.justification = c(1,1), legend.position = c(0.99,0.99))  


ggsave("Table34-37FMYG.png", width = 6.5, height = 4, dpi = 300)
