#tells no of rows and column
dim(iris)

#tells row headings
names(iris)

#gives details row wise  
str(iris)

#tells attribute names ,number of attributes, and class name
attributes(iris)

#details of 1st 5 things
iris[1:5, ]

#1st six data set
head(iris, 7)

#last 6 dataset 
tail(iris, 6)

#min max med all dat info of all coloums
summary(iris)
#mean
mean(iris$Sepal.Length)

#gives histogram
hist(iris$Sepal.Length)

#gives density graph
plot(density(iris$Sepal.Length))

#tells about setosa versicolor  virginica 
#             50         50         50 
table(iris$Species) 

#gives pie chart
pie(table(iris$Species))

#gives bargraph
barplot(table(iris$Species))

#coverience
cov(iris$Sepal.Length, iris$Petal.Length)

#correlation
cor(iris$Sepal.Length, iris$Petal.Length)

#some min max value in form of coloumn
aggregate(Sepal.Length ~ Species, summary, data=iris)

#boxplot
boxplot(Sepal.Length ~ Species, data = iris, xlab = "Species", ylab = "Sepal Length")

#plot graph
plot(iris$Sepal.Length, iris$Sepal.Width, col=iris$Species, pch=as.numeric(iris$Species))

#smooth scatter
smoothScatter(iris$Sepal.Length, iris$Sepal.Width)
