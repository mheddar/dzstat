library(ggplot2)


table32 <- read.csv("Table32.csv")


ggplot(data = table32, aes(x = Year, y = Population)) +
  geom_point(aes(),size = 1.5, color = "purple") +
  stat_smooth(method=lm, level = 0.99) +
  labs(
    title = "Evolution of the Algerian Resident Population. Estimates at Mid-Year.",
    subtitle = "(1966-2011)",
    caption = "Data from ONS, Web: bit.ly/DzStat"
  ) + scale_y_continuous(breaks = c(10e6,15e6,20e6,25e6,30e6,35e6,40e6,45e6), labels = c("10 Mil","15 Mil","20 Mil","25 Mil","30 Mil","35 Mil","40 Mil","45 Mil")) +
theme_light()
ggsave(file = "Table32.png", width = 6.5, height = 4, dpi = 300)
