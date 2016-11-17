library(ggplot2)
library(dplyr)
library(data.table)

load("ggplot/suicides.rdata")
all_suicides <- copy(suicides)

suicides <- suicides %>% 
  group_by(year, state, means) %>% 
  mutate(deaths = sum(deaths)) 

#bare
bare <- ggplot(suicides)
#adding plot aesthetics
aesthetic <- ggplot(suicides, aes(x = year, y = deaths))
#adding points
scatter <- ggplot(suicides, aes(x = year, y = deaths)) +
  geom_point()
#split 'means' by color
colors <- ggplot(suicides, aes(x = year, y = deaths, color = means)) +
  geom_point()
#facet by state
faceted <- ggplot(suicides, aes(x = year, y = deaths, color = means)) +
  geom_point() +
  facet_wrap(~state, scales = "free")
#line plot
line <- ggplot(suicides, aes(x = year, y = deaths, color = means)) +
  geom_line(size = 2) +
  facet_wrap(~state, scales = "free")
#bar plot
bar <- ggplot(suicides, aes(x = year, y = deaths)) +
  geom_bar(aes(fill = means), stat = 'identity') +
  facet_wrap(~state, scales = "free")
