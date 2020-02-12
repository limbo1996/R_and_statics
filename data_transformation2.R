library(nycflights13)
library(tidyverse)
library(dplyr)

filght <- flights
by_day <- group_by(flights, year, month, day)
a <- summarise(by_day, delay = mean(dep_delay, na.rm = T))

#非管道操作
by_dest <- group_by(flights, dest)

delay <- summarise(by_dest,
                   count = n(),
                   dist = mean(distance, na.rm = T),
                   delay = mean(arr_delay, na.rm = T)
)
delay <- filter(delay, count > 20, dest != "HNL")

ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3)+
  geom_smooth(se = F)
# 管道操作
delay <- flights %>% 
  group_by(dest) %>% 
  summarise(
    count = n(),
    dist = mean(distance, na.rm = T),
    delay = mean(arr_delay, na.rm = T)
    
  ) %>% 
  filter(count >20, dest != 'HNL')
#管道操作可以避免中间环节，比如上面不使用管道时需要对中间数据框命名，浪费时间且不易读
# 注意要去掉缺失值，否则，结果都是NA
 



# 计数
not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))


delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(
    delay = mean(arr_delay)
  )

ggplot(data = delays, mapping = aes(x = delay)) +
  geom_freqpoly(binwidth = 10)
# 有些航班延误达到5个小时，但是曲线看不出具体数目，可以使用计数

delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(
    delay = mean(arr_delay, na.rm = T),
    n = n()
  )
ggplot(data = delays, mapping = aes(x = n, y = delay)) +
  geom_point(alpha = 1/10)

#调整样本大小

delays %>% 
  filter(n > 25) %>% 
  ggplot(mapping = aes(x = n, y = delay)) +
    geom_point(alpha = 1/10)



# 查看棒球手击球的数量与表现之间的关系

# convert to a tibble so it print nicely

batting <- as_tibble(Lahman::Batting)


batters <- batting %>% 
  group_by(playerID) %>% 
  summarise(
    ba = sum(H, na.rm = T) / sum(AB, na.rm = T),
    ab = sum(AB, na.rm = T)
    
  )
batters %>% 
  filter(ab > 100) %>% 
  ggplot(mapping = aes(x = ab, y = ba))+
    geom_point() + 
    geom_smooth(se = FALSE)



# 如果只想计数 计算不同机场的航班数
not_cancelled %>% 
  count(dest)


# 或者添加一些条件 计算不同航班的飞行距离总和
not_cancelled %>% 
  count(tailnum, wt = distance)

# 逻辑值在sum 和mean中也可以使用
not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(n_early = sum(dep_time < 500))
# 原因是与数字函数使用时，TRUE转换为1， FALSE转换为0,也就是说只有
#小于500的是1被计数，这样可以免于一步filter
# 不使用上面的方法，而是先过滤
 not_cancelled %>% 
  filter(dep_time < 500) %>% 
  group_by(year, month, day) %>% 
  summarise(n_early = n())


# 同上计算延迟大于一小时的航班的比例
not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(hour_delay = mean(arr_time > 60))
# 数目
not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(hour_delay = sum(arr_time > 60))





# 按多变量分组
# 每次的summary都会去除一个group
daily <- group_by(filght, year, month, day)
(per_day <- summarise(daily, flights = n()))
(per_month <- summarise(per_day, flights = sum(flights)))
(per_year <- summarise(per_month, flights = sum(flights)))
#per_month 和per_year的flight如果也是用n()会出错
# 因为n()只计算行数，所以如果使用n() Per_month得到的flight
# 是每个月的天数(因为合并为月一组了所有天数加在一起而不是航班书)
# Per_year同理，所以需要使用sum(flight)将每个行的航班数加起来



# 删除分组 
daily %>% 
  ungroup() %>%           # no longer grouped by date
  summarise(flight = n()) # all flights



#练习题
# 不使用count得到相同结果
not_cancelled %>% 
  count(dest)

not_cancelled %>% 
  group_by(dest) %>% 
  summarise(n = n())

# 同上
not_cancelled %>% 
  count(tailnum, wt = distance)

not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(n = sum(distance))




# group和filter以及mutate同时使用也很方便
flights %>% 
  group_by(year, month, day) %>% 
  filter(rank(desc(arr_delay)) < 10)

# 筛选大于阈值的group
flights %>% 
  group_by(dest) %>% 
  filter(n() > 365)
