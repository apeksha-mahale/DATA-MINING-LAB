var1 <- sample(5)
var2 <- var1 / 10
var3 <- c("R", "and", "Data Mining", "Examples", "Case Studies")
df1 <- data.frame(var1, var2, var3)
names(df1) <- c("Var.Int", "Var.Num", "Var.Char")
write.csv(df1, "C:/Users/NEW/Documents/dm lab/1-1.csv", row.names = FALSE)
df2 <- read.csv("C:/Users/NEW/Documents/dm lab/1-1.csv")
print(df2)


