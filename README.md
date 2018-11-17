# Introduction 
This repository contains information and code that support our Letter in response to Cruz-Cano and Mead published in the Journal of the American Medical Association.

# Content
This reposity contains:

* [R code for calculating the correlation between total population, and total and period-specific deaths between 2000 and 2016, and 2010-2016](Code_Correlations_JAMA_Reply.R)

* [A comma separated value file (csv) that includes the following variables](Puerto_Rico_Deaths_00_17.csv):
    + **Year** - Year of the Observation 
    + **Pop_Est** - 2000-2016 Population Estimates for Puerto Rico produced by the U.S. Census Bureau 
    + **Total_Deaths** - 2000-2016 Total Deaths for Puerto Rico 
    + **Period_Deaths** - 2000-2016 Period Specific Deaths (September-December)  

# Data 

## Population Estimates
We accessed population estimates for Puerto Rico through [American Factfinder](https://factfinder.census.gov/faces/nav/jsf/pages/index.xhtml). 

## Death Counts
We contacted Jonathan Morales Gonzalez, M.S. (jonmorales@salud.pr.gov) on November 1, 2017 and requested the counts from the Puerto Rico Vital Statistics System for the 2010-2016 period. Mr. Morales Gonzáles is the Vital Statistics and Demographic Affairs Advisor for the Division of Statistical Analysis in the [Puerto Rico Department of Health](http://www.salud.gov.pr/). He provided historical counts for the 2010-2016 period, with the caveat that at that point the 2016 counts were preliminary, and the 2017 counts were being inputed into the system. Some deaths may have been also missing from 2015. Death counts for the 2000-2009 period were drawn from the Center for Diseases Control and Prevention records and validated with publicly shared data produced by the Puerto Rico Department of Health.  

With that preliminary dataset we produced early estimates, which were shared as part of our pre-print titled [Estimates of excess deaths in Puerto Rico following Hurricane Maria (November, 2017)](https://osf.io/preprints/socarxiv/s7dmu/). The pre-print also contains information regarding the state of data in Puerto Rico back in November 2017 and **our data management** and **procedures** used to reach the early estimates of approximately **1,085 deaths** by the end of October 2017. 

This is how we built the dataset used for our analysis.

# Visualization of Total Population and Death Counts
## Population Estimates and Total Deaths
In this first figure, we present the pattern of population estimates and total deaths for Puerto Rico 2000-2016.

![Figure 1](Total_Deaths_Pop_A.jpg)

## Population Estimates and Period Specific Deaths (September-December)
In this second figure, we present the pattern of population estimates and period specific deaths for Puerto Rico 2000-2016

![Figure 2](Total_Deaths_Pop_B.jpg)


# Problems?
If you find any problems with our data or code, please create an [issue](https://github.com/alexisrsantos/JAMA_Reply/issues) and we will answer as soon as possible. 

# Metadata
This repository is maintained by [Dr. Alexis R. Santos](https://scholar.google.com/citations?user=oPZ-RDgAAAAJ&hl=en) and reviewed by [Dr. Jeffrey T. Howard](https://scholar.google.com/citations?user=l0A2z2YAAAAJ&hl=en).
