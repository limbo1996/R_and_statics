library(tidyverse)
library(dplyr)
library(nycflights13)
filgth <- nycflights13::flights

# arrange 是将行排序
arrange(filgth, year, dep_time)
# 使用desc()可以倒序
arrange(filgth, desc(dep_time))
# 值得注意的是，缺失值都是无论倒序还是正序都是排在最后的

df <- tibble(x = c(5, 2, NA))
df
arrange(df, x)
arrange(df, desc(x))
