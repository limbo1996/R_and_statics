setwd('~/Documents/Github/learn-R')
library(ggplot2)
library(tidyverse)

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))

#you can recreate the previous plot using stat_count() instead of geom_bar()
ggplot(data = diamonds) +
  stat_count(mapping = aes(x = cut))
#因为第一个图也是频率直方图，所以使用
#geom_bar函数是参数stat = count所以与使用
#stat_count效果相同
# 每一个stat 都有自己的默认的geom,同样每一个geom都有自己
# 默认的stats，所以一般可以使用geom

#更改stat实例1
demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)


ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")

#可以比较一下demo与图一的diamonds的区别。其实
#demo就是diamond数据集在使用stat = count时第一步要计算
#形成的表，stat = count 会计算各个cut值对应的出现的count
#然后形成类似于demo的数据


#实例2
# 想让y轴显示比例而不是具体的count值

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))
#实例3
# 对每个cut 的depth进行summary
ggplot(data = diamonds) +
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

