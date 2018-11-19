#Activate the library
library("ggplot2")
library("tidyverse")

#First, we read the data in 
deaths_raw<-read.csv(file="PATH HERE/Puerto_Rico_Deaths_00_17.csv")

#These figures include 2017 in the prediction algorithm
##Not our prefered model
## As an outlier, 2017 will drive the errors up, but we control with a Dummy Variable

##Here we create the model including the shock of Hurricane Maria
model<-lm(Period_Deaths~(Year)+Hurricane_Maria,data=deaths_raw)

#Here we create our new dataset with years, and building a no-Hurricane Maria scenario
new_year<-data.frame(Year=c(2000:2017),Hurricane_Maria=rep(0,18))

#In this line we predict the values taking away the shock of Hurricane Maria
pred.int<-predict(model,newdata=new_year,interval="prediction")

#Here, we turn the predicted values in a dataset
pred.int<-as.data.frame(pred.int)

#Here, we create "mydata" which merges the original data and the predicted values
mydata<-cbind(deaths_raw,pred.int)

#Here we visualize the data, 2017 is a clear outlier from the 95% C.I. of the mean
# Deaths for 2017 are also an outlier for the prediction interval generated from the time series
p <- ggplot(mydata, aes(Year, Period_Deaths)) +
  geom_point() +
  stat_smooth(method = lm) +geom_line(aes(y = lwr), color = "red", linetype = "dashed")+
  geom_line(aes(y = upr), color = "red", linetype = "dashed") +
  labs(title = "Period Deaths, Confidence and Prediction Intervals for Puerto Rico, 2000-2017", subtitle = "Deaths for September - December", y = "Period Deaths", x ="Year",
  caption = "Supplemental Figure for Response to Cruz-Cano and Mead in JAMA by Santos and Howard")+
  scale_x_continuous(breaks = seq(2000, 2017, by = 2))

# Show the figure
p