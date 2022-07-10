ingredient<-read.csv(file.choose()) #memanggil data
View(ingredient) #melihat data
head(ingredient)

library(dplyr)
cat("Summary\n")
summary(ingredient)
cat("Variance \n")
apply(ingredient, 2, sd) #a dan i memiliki nilai varian yang rendah

library(corrplot)
cor.table <- cor(ingredient)
cor.table
corrplot(cor.table, method = "circle")
# a dan g memiliki korelasi yang tinggi

par(mfrow = c(3, 3))
for (i in colnames(ingredient))
{ingredient[, i] %>% hist(, main = i)}

max.min.transform <- function(x) (max(x) - x)/(max(x) - min(x))
ing <- apply(ingredient, 2, max.min.transform)
summary(ing)
hclust.fit <- plot(hclust(dist(ing),"ward.D"))