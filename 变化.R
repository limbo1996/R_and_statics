library(tidyverse)
# 可视化分布
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))
# 查看每个的具体值
diamonds %>% 
  count(cut)
# 对于连续变量使用直方图
ggplot(data = diamonds)+
  geom_histogram(mapping = aes(x = carat), binwidth = 0.5)
# 也可以自定义组距
diamonds %>% 
  count(cut_width(carat, 1))
# cut_width可以调整，也就是组距

samller <- diamonds %>% 
  filter(carat < 3)# 筛选出克拉小于3的

ggplot(data = samller, mapping = aes(x = carat)) +
  geom_histogram(binwidth = 0.1)# 使用更小的组距

# 使用堆叠直方图
#可以将每个br转换为线
ggplot(data = samller, mapping = aes(x = carat, color = cut))+
  geom_freqpoly(binwidth = 0.1)
# 查看典型值

ggplot(data = diamonds, mapping = aes(x = carat)) +
  geom_histogram(binwidth = 0.01)
# 可以看出出现了聚类

# 发现聚类后怎么描述和继续探索

ggplot(data = faithful, mapping = aes(x = eruptions)) +
  geom_histogram(binwidth = 0.25)
# 可以发现喷泉的喷发时间大致分成了两组，分别是短时间的和长时间的

# 缩小坐标轴
ggplot(diamonds) +# 这是因为某一类型的值太多会拉大y轴
  geom_histogram(mapping = aes(x = y), binwidth = 0.5)


# 缩小y轴
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.5)+
  coord_cartesian(ylim = c(0, 50))# 使用这个函数可以截取0-50长的y轴

# 可以观察到三个异常值， 0， ~30 ~60

unusual <- diamonds %>% 
  filter(y < 3 | y > 20) %>% 
  select(price, x, y, z) %>% 
  arrange(y)
#########缺失值

#有时缺失值也代表一定含义，比如上面用到的航班是否取消

#如果相比较已经取消的和没有取消的的计划出发时间

nycflights13::flights %>% 
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_dep_time %% 100,
    sched_dep_time = sched_hour + sched_min / 60
  ) %>% 
  ggplot(mapping = aes(sched_dep_time)) + 
  geom_freqpoly(mapping = aes(colour = cancelled), binwidth = 1/4)




