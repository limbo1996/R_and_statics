# R for data science 
# pattern and model
# 数据中关于多种数据之间的关系，可以使用模型

# 钱面提到的喷泉问题
library(ggplot2)
library(tidyverse)
library(dplyr)
library(modelr)
ggplot(data = faithful) + 
  geom_point(mapping = aes(x = eruptions, y = waiting))
#可以看见等待时间和喷发时间大致分成两组
# 喷发时间长的等待时间也就越长


mod <- lm(log(price) ~ log(carat), data = diamonds)

diamonds2 <- diamonds %>% 
  add_residuals(mod) %>% 
  mutate(resid = exp(resid))

ggplot(data = diamonds2) +
  geom_point(mapping = aes(x = carat, y = resid))

ggplot(data = diamonds2) + 
  geom_boxplot(mapping = aes(x = cut, y = resid))

