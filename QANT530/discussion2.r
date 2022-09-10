library(xlsx)
library(olsrr)
data <- read.xlsx("QANT530/datasets/Practice Dataset (2).xlsx", 1)
head(data)

model <- lm(AverageMonthlyOrders ~ factor(Region) + factor(WarehouseType) + NumberOfEmployees + AverageSalary + InventoryValue, data=data )
fwsel <- ols_step_forward_aic(model,penter=.05)
fwsel

model <- lm(AverageMonthlyOrders~NumberOfEmployees + factor(Region),data=data)
summary(model)
 