install.packages("nycflights13")
library(dplyr)
library(nycflights13)
library(tidyverse)

filghts <- nycflights13::flights

#use filter() can subset observation based on their values 
filghts %>% dplyr::filter(month == 1, day == 1)
test1 <- dplyr::filter(filghts, month == 1, day == 1)

#also can make a function
fil <- function(df, month, day){
  df %>% dplyr::filter(month == month, 
                       day == day)
}
test <- fil(filghts, 1, 1)
# and, or, not
# find all filghts that departed in November or December
dplyr::filter(filghts, month == 11 | month ==12)
# 灵活使用& | 
filter(filghts, !(arr_delay > 120 | dep_delay > 120))
b <- filter(filghts, arr_delay <= 120, dep_delay <= 120)
c <- filter(filghts, arr_delay <= 120 & dep_delay <= 120)
# 以上三个等式效果一样

table(b == c)
system.time(filter(filghts, !(arr_delay > 120 | dep_delay > 120)))
system.time(filter(filghts, arr_delay <= 120, dep_delay <= 120))
system.time(filter(filghts, arr_delay <= 120 & dep_delay <= 120))

# R 语言中一个相对棘手的问题就是缺失值NA
NA > 5
10 == NA
# The most confusing result is this one
NA == NA



df <- tibble(x = c(1, NA, 3))
df
filter(df, x > 1)
filter(df, is.na(x) | x > 1)
