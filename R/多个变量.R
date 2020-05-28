# 两个类别变量
# 两个类别变量之间的关系，需要计算每种组合的观察数
# 注意都是非连续变量

ggplot(data = diamonds) +
  geom_count(mapping = aes(x = cut, y = color))

# 另一种方式是使用dplyr,然后可视化(热图)
diamonds %>% 
  count(cut, color) %>% 
  ggplot(mapping = aes(x = color, y = cut)) +
    geom_tile(mapping = aes(fill = n))

diamonds %>% 
  count(cut, color) %>% 
  ggplot(mapping = aes(x = cut, y = color)) +
  geom_tile(mapping = aes(fill = n))


flights %>% 
  count(dest, month) %>% 
  ggplot(mapping = aes(x = month, y = dest)) +
    geom_tile(mapping = aes(fill = n))

# 两个连续变量
# 两个连续变量使用散点图
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price))
#克拉和价格的关系

#但是数据量太大后散点图不适用了
#可以调整点的透明度


ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price), alpha = 1 /100)
# 但是数据太大后，使用透明度也不好用
#可以使用bin
# geom_bin2d 是矩形
# geom_hex 六边形

ggplot(data = diamonds) +
  geom_bin2d(mapping = aes(x = carat, y = price))


# 还可以使用连续箱线图
ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_boxplot(mapping = aes(group = cut_width(carat, 1)))
#注意这是连续变量，所以group不能少
# 还可以是箱的宽度和点的数量成正比
ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_boxplot(mapping = aes(group = cut_width(carat,1)), 
               varwidth = T)

# 还可以使每个bin中显示大概相同数量的点
ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_boxplot(mapping = aes(group = cut_number(carat, 7)))# cut_number
# 也就是显示多少个box




