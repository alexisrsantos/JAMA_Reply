#Set decimals options [digits] and no scientific notation
options(digits=2,scipen=999)

#Correlation Analysis for JAMA Reply to Cruz-Cano and Mead

#Import Deaths
deaths <- read.csv("PATH GOES HERE/Puerto_Rico_Deaths_00_16.csv")

#Just in case the file has 2017 observations
deaths<-subset(deaths,Year<2017)

###This is the analysis using the data for the 2000-2016 period
cor.test(x=deaths$Pop_Est,y=deaths$Total_Deaths,alternative = "two.sided",method ="pearson",conf.level = 0.95)

###This is the analysis using the data but with Period Deaths
cor.test(x=deaths$Pop_Est,y=deaths$Period_Deaths,alternative = "two.sided",method ="pearson",conf.level = 0.95)

#This section of the analysis excludes the observations before 2010
#Here, deaths is a subset for deaths after 2009 only
deaths<-subset(deaths, Year>2009)

#Correlations using Period Deaths 2010-2016
cor.test(x=deaths$Pop_Est,y=deaths$Period_Deaths,alternative = "two.sided",method ="pearson",conf.level = 0.95)

#Correlations using Total Deaths 2010-2016
cor.test(x=deaths$Pop_Est,y=deaths$Total_Deaths,alternative = "two.sided",method ="pearson",conf.level = 0.95)
