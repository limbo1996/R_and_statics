library(tidyverse)
library(dplyr)
library(nycflights13)
filgth <- nycflights13::flights

# select 可以快速的在庞大的数据框中筛选想要的列
# select columns by names
select(flights, year, month, day)
# select all columns between year and day
select(flights, year:day)
# select all columns except those from year to day
select(flights, -(year:day))
# There are a number of helper functions you can use within select():
#   
# starts_with("abc"): matches names that begin with “abc”.
# select(x, starts_with("abc"))
#
# ends_with("xyz"): matches names that end with “xyz”.
# 
# contains("ijk"): matches names that contain “ijk”.
# 
# matches("(.)\\1"): selects variables that match a regular expression. This one matches any variables that contain repeated characters. You’ll learn more about regular expressions in strings.
# 
# num_range("x", 1:3): matches x1, x2 and x3.
# 
# See ?select for more details.

#前面学的一些函数通过管道操作结合
df <- filgth %>% 
  select(year, month, day) %>% 
  arrange(day) %>% 
  filter(day < 15)
# 将tailnum 改名为tail_num
rename(flights, tail_num = tailnum)
# if you have a handful of variables you’d like to move to the start of the data frame.
select(filgth, time_hour, air_time, everything())
