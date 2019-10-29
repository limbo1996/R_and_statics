calc <- function(x, y, type){
  if(type == 'add'){
        x + y
    }else if(type == 'minus'){
        x - y
    }else if(type == 'multiply'){
        x * y
    }else if(type == 'divide'){
        x / y
    }else{
        stop('Unknow type of operation')
    }
}

calc(2, 3, type = 'minus')


nested_list <- list(m = 1:15, n = list("a", c(1, 2, 3)))
print(nested_list)
str(nested_list)
getOption("digits")

pkgs <- installed.packages()
colnames(pkgs)
installed.packages()[, "Package"]

c('ggplot2', 'languageserver') %in% installed.packages()[, 'Package']
################################################################################
#R有名命名规则， 比如直接空格是不可以的
some data <- c(1, 2, 3)
#但是使用反引号就可以
`some data` <- c(1, 2, 3)
print(`some data`)



###############
m <- integer()

for (i  in 1000:1100) {
  if ((i ^ 2) %% 11 == (i ^ 3) %% 17) {
    m <- c(m, i)
  }
}
m
print(m)
m[1]

m <- integer()
j <- 1
for (i in 1000:1100) {
  if ((i ^ 2) %% 11 == (i ^ 3) %% 17) {
   m[j] <- i
   j <- j + 1
  } 
 
}









