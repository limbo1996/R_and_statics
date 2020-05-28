# R for data science 
# covariation

# 协变指的是几个变量以相关的方式变化

# 钻石质量和价格的关系
ggplot(data = diamonds, mapping = aes(x  = price)) +
  geom_freqpoly(mapping = aes(color = cut), binwidth = 500)
# 因为总体数量差很多，所以很难看出差异和联系
# 所以需要标准化y轴，也就是密度
ggplot(data = diamonds, mapping = aes(x = price, y = ..density..))+
  geom_freqpoly(mapping = aes(color = cut), binwidth = 500)
# 箱线图
ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
  geom_boxplot()
# 不同变量还可以重新排列
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot()
# 按照中位数排序
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy))


# 旋转
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy)) +
  coord_flip()
