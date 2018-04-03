install.packages("party")
install.packages("e1071")
install.packages("klaR")
library("party")
library("e1071")
library("klaR")
str(iris)
set.seed(1234)
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
trainData <- iris[ind==1,]
testData <- iris[ind==2,]

iris_dt <- ctree(Species ~ ., data=trainData)
iris_nb <- naiveBayes(Species ~., data=trainData)

table(predict(iris_dt,trainData), trainData$Species)
table(predict(iris_nb, trainData), trainData$Species)

print(iris_dt)
print(iris_nb)

plot(iris_dt)
plot(iris_dt, type="simple")
plot(iris_nb)

# predict on test data
ans_dt = predict(iris_dt, testData)
ans_nb = predict(iris_nb, testData)
table_dt = table(ans_dt, testData$Species)
table_nb = table(ans_nb, testData$Species)
sum(diag(table_dt))/sum(table_dt)
summary(ans_dt)
summary(ans_nb)

