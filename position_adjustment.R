# 上色
#边缘上色
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, colour = cut))
#填充上色
ggplot(data = diamonds) +  
  geom_bar(mapping = aes(x = cut, fill = cut))

#按照第三个变量上色
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))

# 上图堆叠是因为将参数调整为了position, 除此之外
# 还可以用"identity", "dodoe", "fill"
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(position = "identity")
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity")

# identity在这里并不常用，因为identity显示的是确定的大小
# 会产生重叠

# position = 'fill', 会将所有的bar同样长度，方便看比例
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity), position = 'fill')


# 而position = "dodge"表示说将不同类型的bar分开
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

# overplotting
#can avoid this gridding by setting the position adjustment to “jitter”
#原理很简单就是为每个值添加一个随机噪声，因为是随机的，所以每个点被添加的
#随机噪声不一定一样，点得以分开，这样虽然不精确但是在大图上会让你的图更清晰
#避免相同值重叠
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")

