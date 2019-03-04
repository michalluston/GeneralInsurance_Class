# Find out, which __year__ was the __most terrific__ for portfolio you have identified as __most profitable__ during the lesson and 
# show it on the chart using `ggplot2` package. Write an explanation about your findings into the code as comment.
# __Commit__ it to your repository into `Lessons/Lesson2/Homework`.

## Code
install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
library(ggplot2)

dt_KPI <- read.csv("./Data/lesson2_KPI.csv")

dt_KPI %>% 
  mutate(Premium = ifelse(Premium < 0, 0, Premium))

dt_KPI %>%  mutate(UWR = Premium - Expenses - Losses) %>% 
  group_by(Year) %>% 
  summarize(UWR = sum(UWR, na.rm = TRUE)) %>% 
  arrange(UWR)

dt_KPI %>% 
  mutate(UWR = Premium - Expenses - Losses) %>% 
  group_by(Year) %>% 
  summarize(UWR = sum(UWR, na.rm = TRUE)) %>% 
  ggplot(aes(x = reorder(Year, UWR), y = UWR)) + 
  geom_col()


# Your Explanation about analysis:
# očistenie dát -> zoskupenie podľa rokov -> porovnanie podľa Underwriting Result
# Výsledok: Najhorší rok vyšiel 2015, lebo rok 2015 má najnižšiu hodnotu UWR
