# Supplement to In Reply: Excess deaths after Hurricane Maria in Puerto Rico

## Introduction 
This repository contains information and code that support our Letter in response to Cruz-Cano and Mead published in the Journal of the American Medical Association. 

## Content
This reposity contains:

* [R code for calculating the Pearson Correlation Coefficient between total population, and total and period-specific deaths between 2000 and 2016, and 2010-2016](Code_Correlations_JAMA_Reply.R)

* [A comma separated value file (csv), for the correlation analysis, that includes the following variables](Puerto_Rico_Deaths_00_16.csv):
    + **Year** - Year of the Observation 
    + **Pop_Est** - 2000-2016 Population Estimates for Puerto Rico produced by the U.S. Census Bureau 
    + **Total_Deaths** - 2000-2016 Total Deaths for Puerto Rico 
    + **Period_Deaths** - 2000-2016 Period Specific Deaths (September-December)  

* [A second csv file, for the Regression Analysis detailed below](Puerto_Rico_Deaths_00_17.csv). This file includes the following  variables:
    + **Year** - Year of the Observation - **Independent Variable**
    + **Pop_Est** - 2000-2017 Population Estimates for Puerto Rico produced by the U.S. Census Bureau - **Not used**
    + **Total_Deaths** - 2000-2017 Total Deaths for Puerto Rico - **Not used**
    + **Period_Deaths** - 2000-2017 Period Specific Deaths (September-December)  - **Dependent Variable**
    + **Hurricane Maria** - a dummy variable that models 2017 as receiving a "shock" - **Independent Variable**
    + **Period_Deaths_Imputed**- 2000-2017 Period Specific Deaths with 2014 imputed as discussed in our pre-print. 
    
The variable **Period_Deaths_Imputed** is used in a Supplementary Analysis contained in our [code](OLS_Figure_Repository.R) which will be discussed later in this repository. 

## Data 

### Population Estimates
We accessed population estimates for Puerto Rico through [American Factfinder](https://factfinder.census.gov/faces/nav/jsf/pages/index.xhtml). 

### Death Counts
We contacted Jonathan Morales Gonzalez, M.S. (jonmorales@salud.pr.gov) on November 1, 2017 and requested the counts from the Puerto Rico Vital Statistics System for the 2010-2016 period. Mr. Morales Gonzáles is the Vital Statistics and Demographic Affairs Advisor for the Division of Statistical Analysis in the [Puerto Rico Department of Health](http://www.salud.gov.pr/). He provided historical counts for the 2010-2016 period, with the caveat that at that point the 2016 counts were preliminary, and the 2017 counts were being inputed into the system. Some deaths may have been also missing from 2015. Death counts for the 2000-2009 period were drawn from the Center for Diseases Control and Prevention records and validated with publicly shared data produced by the Puerto Rico Department of Health.  The latest public released of the data with official validation by the Government of Puerto Rico was shared in May 31, 2018 which included the deaths registered in the administrative database up until May 31, 2018. Our data includes the updated counts for the 2013-2017 period included in this release of the data. 

With that preliminary dataset we produced early estimates, which were shared as part of our pre-print titled [Estimates of excess deaths in Puerto Rico following Hurricane Maria (November, 2017)](https://osf.io/preprints/socarxiv/s7dmu/). The pre-print also contains information regarding the state of data in Puerto Rico back in November 2017 and **our data management** and **procedures** used to reach the early estimates of approximately **1,085 deaths** by the end of October 2017. 

This is how we built the dataset used for our analysis.

Our team, and other teams have encountered that the Government of Puerto Rico keeps sending different totals with each data pull. Some **small** differences could emerge from a more recent data pull from the Puerto Rico Vital Statistics System. 

## Regression Approach to Predicting Deaths using 2000-2017 data
Figure 1, below, was produced using data from 2000-2017. I specified an OLS model controlling for year and Hurricane Maria (dummy for 2017). 

* The results shown below include: 
    + Observations - black dots
    + Predicted value - blue line
    + Confidence Intervals of the OLS Predicted Value - Grey 
    + Prediction Intervals for the Observations - dashed red lines

When we calculate the difference between the number of deaths for our period of interest and the upper level of the 95% C.I. of the predicted interval for the observations (11,459 deaths-10,448 deaths). The result is **1,011 excess deaths**. 

The arithmetic difference of this estimate and our previous one come from use of updated counts for the 2013-2017 years as released in May 31, 2018 by the Government of Puerto Rico. 

Nevertheless, this estimate falls within the interval presented in our previous Research Letter (1,139 excess deaths, 95% CI=1,006;1,272) and within the interval of the census-based model discussed in our Reply (1,191 excess deaths, 95% CI 836; 1544). 

#### Figure 1 
![Figure 1](Rplot10.jpeg)

We are sharing our [code file](OLS_Figure_Repository.R) used to produce the figure above.

* This will guide you through the process of: 
    1. Importing the data
    2. Fitting an basic OLS model using the lm function. We ran many models, and our results are robust to other specifications 
    3. Producing the "synthetic" data to solve the equation produced with lm (new_year object)
    4. Solving the OLS formula **without** Hurricane Maria effects
    5. Producing "prediction intervals" for the observations 
    6. Merging everything in one dataset with *cbind* 
    7. Produce [Figure 1](RPlot10.jpeg) 
    8. Produce the Confidence Intervals which reflect the uncertainty around the mean prediction values
    9. Creating the final data file
    10. Subsetting the data to only keep 2017
    11. Calculate excess deaths as the difference between the deaths for the period of interest and the upper limit of the 95% CI 
    
A detailed explanation of the *predict* function can be found [here](https://www.sthda.com/english/articles/40-regression-analysis/166-predict-in-r-model-predictions-and-confidence-intervals). 

##  What about our central estimate?
In our data for the production of the initial and published estimates we noticed that October 2014 was an **outlier**. This was due to the Chinkungunya outbreak in Puerto Rico. 

We performed a **mean** imputation as described in our pre-print titled [Estimates of excess deaths in Puerto Rico following Hurricane Maria (November, 2017)](https://osf.io/preprints/socarxiv/s7dmu/). Using the method discussed previously, and controlling for 2014 as an outlier as done before we produced the Figure 2, below. 

#### Figure 2
![Figure 2](Figure2.png)

The excess deaths estimate when the data are adjusted and fit into an OLS model is **1,157**. The code used to produce this estimate is also included in the [code file](OLS_Figure_Repository.R) under *Supplemental analysis: Using the mean imputation for October 2014 deaths*.

## Visualization of Total Population and Death Counts
### Population Estimates and Total Deaths
In Figure 3, we present the pattern of population estimates and total deaths for Puerto Rico 2000-2016.

#### Figure 3
![Figure 3](Total_Deaths_Pop_A.jpg)

### Population Estimates and Period Specific Deaths (September-December)
In Figure 4, we present the pattern of population estimates and period specific deaths for Puerto Rico 2000-2016.

#### Figure 4
![Figure 4](Total_Deaths_Pop_B.jpg)

These figures were produced using Excel (Sorry no code!). 

## Problems?
If you find any problems with our data or code, please create an [issue](https://github.com/alexisrsantos/JAMA_Reply/issues) and we will answer it as soon as possible. 

## Metadata
This repository is maintained by [Dr. Alexis R. Santos](https://scholar.google.com/citations?user=oPZ-RDgAAAAJ&hl=en) and reviewed by [Dr. Jeffrey T. Howard](https://scholar.google.com/citations?user=l0A2z2YAAAAJ&hl=en). 
