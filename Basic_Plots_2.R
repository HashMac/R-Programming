
#histogram of MEDV
hist(housing.df$MEDV, xlab = "MEDV")
#alternative plot with ggplot
library(ggplot2)
ggplot(housing.df) + geom_histogram(aes(x = MEDV), binwidth = 6)


#boxplot of MEDV for different values of CHAS
boxplot(housing.df$MEDV ~ housing.df$CHAS, xlab = "CHAS", ylab = "MEDV")
#alternative plot with ggplot
ggplot(housing.df) + geom_boxplot(aes(x = as.factor(CHAS), y = MEDV)) +  xlab ("CHAS")



#side-by-side boxplots
#use par() to split plots into panels
par(mfcol = c(2, 2))
boxplot(housing.df$NOX ~ housing.df$CAT..MEDV, xlab = "CAT.MEDV", ylab = "NOX")
boxplot(housing.df$LSTAT ~ housing.df$CAT..MEDV, xlab = "CAT.MEDV", ylab = "LSTAT")
boxplot(housing.df$PTRATIO ~ housing.df$CAT..MEDV, xlab = "CAT.MEDV", ylab = "PTRATIO")
boxplot(housing.df$INDUS ~ housing.df$CAT..MEDV, xlab = "CAT.MEDV", ylab = "INDUS")



#Simple heatmap of correlations (without values)
heatmap(cor(housing.df), Rowv = NA, Colv = NA)

#Heatmap with Values
library(ggplot)
heatmap.2(cor(housing.df),Rowv = FALSE, Colv = FALSE, dendogram = "none",
          cellnote = round(cor(housing.df),2),
          notecol = "black", key = FALSE, trace = 'none', margins = c(10, 10))

#Alternative plot with ggplot

library(ggplot2)
library(reshape2) #to generate input for the plot
cor.mat <- round(cor(housing.df), 2) #rounded off correlation matrix
melted.cor.mat <- melt(cor.mat)
ggplot(melted.cor.mat, aes(x = X1, y = Y1, fill = value)) + 
  geom_tile() + 
  geom_text(aes(x = X1, y = X2, label = value))

