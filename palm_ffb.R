#import data
palm_ffb<-read.csv(file.choose()) #memanggil data
View(palm_ffb) #melihat data
head(palm_ffb)

# analisis Korelasi
library(corrplot)
cor.table <- cor(subset(palm_ffb, select = -c(Date)))
cor.table
corrplot(cor.table, method = "circle")

#Model Linear
lm<- lm(FFB_Yield ~.,subset(palm_ffb, select = -c(Date)))
summary(lm)

#Subset terbaik dari Model Linear
library(leaps)
best.subsets.fit <- regsubsets(FFB_Yield ~., subset(palm_ffb, select = -c(Date))) 
summary(best.subsets.fit)
#Tiga hal yang paling penting adalah HA_Harvested, Precipitation, dan SoilMoisture