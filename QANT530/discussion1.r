library(xlsx)
data <- read.xlsx("c:/Users/nguyen_phan/Downloads/QANT 530/R Lab/Practice Dataset.xlsx", 1)
data

plot(data[,1],data[,2],xlab="Utility Cost", ylab= "Maintenance Cost")
