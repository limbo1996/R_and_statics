library(downloader) 
setwd('~/Documents/R_and_statics/')
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv" 
download(url, destfile=filename)

weight <- read.csv(file = '~/Documents/R_and_statics/femaleMiceWeights.csv',
                   header = T, stringsAsFactors = F)














