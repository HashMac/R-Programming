install.packages(forecast)

#line chart for the Amtrack data
Amtrak.df <- read.csv("Amtrak.csv")

#use time series analysis
library(forecast)
ridership.ts <- ts(Amtrack.df$Ridership, start = c(1991,1), end = c(2004,3), frequency = 12)
plot(ridership.ts, xlab = "Year", ylab = "Ridership (in 000's)", ylim = c(1300, 2300))

##Boston Housing Data
housing.df <- read.csv("BostonHousing.csv")

##Scatter Plot with Axes Names
plot(housing.df$MEDV ~ housing.df$LSTAT, xlab = "MEDV", ylab = "LSTAT")
#alternative plot with ggplot
library(ggplot2)
ggplot(housing.df) + geom_point(aes(x = LSTAT, y = MEDV), colour = "navy", alpha = 0.7)

##barchart of CHAS vs mean MEDV
#compute mean MDV per CHAS = (0,1)
data.for.plot <- aggregate(housing.df$MEDV, by = list(housing.df$CHAS), FUN = mean)
names(data.for.plot) <- c("CHAS", "MeanMEDV")
barplot(data.for.plot$MeanMEDV, names.arg = data.for.plot$CHAS,
        xlab = "CHAS", ylab = "Avg.MEDV")
#alternative plot with ggplot
ggplot(data.for.plot) + geom_bar(aes(x = CHAS, y = MeanMEDV), stat = "identity")

##barchart of CHAS vs. %CAT.MEDV
data.for.plot <- aggregate(housing.df$CAT..MEDV, by = list(housing.df$CHAS), FUN = mean)
names(data.for.plot) <- c("CHAS", "MEanCATMEDV")
barplot(data.for.plot$MeanCATMEDV * 100, names.arg = data.for.plot$CHAS,
        xlab = "CHAS", ylab = "% of CAT.MEDV")