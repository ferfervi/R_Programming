# Introduction - Programming assignment 1
For this first programming assignment you will write three functions that are meant to interact with dataset that accompanies this assignment. The dataset is contained in a zip file specdata.zip that you can download from the Coursera web site. 

Details about grading and submission procedures can be found near the bottom of this page.
Data
The zip file containing the data can be downloaded here:
[specdata.zip 2.4MB](https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip)

The zip file contains 332 comma-separated-value (CSV) files containing pollution monitoring data for fine particulate matter (PM) air pollution at 332 locations in the United States. Each file contains data from a single monitor and the ID number for each monitor is contained in the file name. 

For example, data for monitor 200 is contained in the file "200.csv".
Each file contains three variables:
Date: the date of the observation in YYYY-MM-DD format (year-month-day)
sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)
nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)

For this programming assignment you will need to unzip this file and create the directory 'specdata'. Once you have unzipped the zip file, do not make any modifications to the files in the 'specdata' directory. In each file you'll notice that there are many days where either sulfate or nitrate (or both) are missing (coded as NA). This is common with air pollution monitoring data in the United States.

## Part 1
Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA. A prototype of the function is as follows

```
pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result!
}

```

You can see some example output from this function. The function that you write should be able to match this output. Please save your code to a file named pollutantmean.R.


## Part 2
Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases. A prototype of this function follows

```

complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
}
```

You can see some example output from this function. The function that you write should be able to match this output. Please save your code to a file named complete.R. To run the submit script for this part, make sure your working directory has the file complete.R in it.


## Part 3
Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. A prototype of this function follows

```
corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!
}

```

For this function you will need to use the 'cor' function in R which calculates the correlation between two vectors. Please read the help page for this function via '?cor' and make sure that you know how to use it.
You can see some example output from this function. The function that you write should be able to match this output. Please save your code to a file named corr.R. To run the submit script for this part, make sure your working directory has the file corr.R in it.


# SOLUTION


#### Script 1. "pollutantmean". Gets as a impout the files and the polutant(pollution element to consider). Return the mean of the files/ monitor-estations considered.
```
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  
  #PRIMERA SOLUCIO: LLEGIR SOLS ELS FIXERS Q VOLEM
  #SEGONA: TODO: llegir tots els fixers i extraure el subset on columna ID=id
  
  #A) obtain vector with file names to read
 
  #match the file format, obtain files in 3 difits characters.
  filenames <- sprintf("%03d.csv", id)

  #add the directory to the file name
  if(!is.null(directory))
  {
     filenames <- paste(directory, filenames, sep="/")
  }
  
  # B) READ  selected files

  # OPTION B1. -> with "lapply".
  # "lapply" applies the FUN function to the list "filenames". Each element of the list is
  # referenced by "files". So the function read every files. Later the result from all files is merged with "rbind". 
  # rbind binds the different files content adding them "at the bottom", by row. cbinds exists as well. Now we got all
  # the data from all files that have been selected together in the variable "dataset".
   dataset <- do.call("rbind",lapply(filenames,
                                     FUN=function(files){read.csv(files,
                                                             header=TRUE, sep=",")}))
  
  # OPTION B2 -> with ldply.
  # "ldply" returns a dataframe. Requires library "plyr"
    # require(plyr)
    #dataset <- ldply(filenames, read.csv)
  
  # calculate the mean from the dataset. Select all rows, and only the "pollutant" column sent as parameter.
  themean <- mean(dataset[, pollutant], na.rm = TRUE)
  themean
  #as.data.frame(themean)
}


```

#### Script 2: return data frame in each line every station id with number of complete cases.
```
complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  #A) obtain vector with file names to read
  #filesToRead <- character()
  #for( i in id){ filesToRead <- c( filesToRead , paste(i,".csv",sep='')) }
  
  filenames <- sprintf("%03d.csv", id)
  if(!is.null(directory))
  {
    filenames <- paste(directory, filenames, sep="/")
  }
  
  # B) READ  selected files
  # OPTION B1
  dataset <- do.call("rbind",lapply( filenames,
                                     FUN=function(file)
                                     { fc <- read.csv(file);
                                       compl <- complete.cases(fc)
                                       ncompl <- sum(compl==TRUE)
                                       res <- c(fc[1,"ID"],ncompl)
                                     }
  )
  )

  
  colnames(dataset)<- c("id","nobs")
  as.data.frame(dataset)
  
}

```
#### Part 3

```
corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  

  # A) Select the files with ncomplete > threshold. Call previous script "complete" to get number of complete cases in every station/file. Later extract from from these list with IDs + n complete cases the ones fulfilling the threshold in "ids". 
 # Use function the function subset, the first parameter is the dataset, the second is the condition.

  fileID.ncomplete <- complete(directory)
  ids <- subset(fileID.ncomplete[["id"]],fileID.ncomplete[,"nobs"] > threshold)
 
 # Once we got the IDs of the stations fulfilling the threshold, generate the filename in correct format.
 filenames <- sprintf("%03d.csv", ids)
 
   if(!is.null(directory) && length(filenames)>0)
   {
     filenames <- paste(directory, filenames, sep="/")
   }
 

 # B) READ  selected files

 if(length(filenames)>0)
 {
   dataset <- do.call("rbind",lapply( filenames,
                                      FUN=function(file)
                                      { fc <- read.csv(file);
                                        
                                        # get row with which are complete cses
                                        rfc <- fc[complete.cases(fc),]

                                        # calculate the correlation between thrse 2 polluters in the selected station.
                                        cor(rfc["sulfate"],rfc["nitrate"])
                                      }
                                    )
                       )
 
   #format it as vector instead of data frame. (as.dataframe())
   as.vector(dataset)
 }
 else
 {
   vector('numeric')
 }

 
}


```
##### At the end of this 3rd script we got the result, a numeric vector with the correlation between poluters from stations that fulfill a minimum number of complete cases / observations.

+ corr("foldername", threshold) will return the vector with correlations for stations with ncomplete-observations > threshold.

+ The highest the "threshold" number, less stations will fulfill the requirement and will be returned by script 2.

+ Therefore, the highest is the threshold, less correlations will need to calculate stript3 (quicker).

here we see that for threshold "1000" only 3 stations are processed

 > corr("specdata",1000)
[1] -0.01895754  0.04191777  0.19014198


---
##### Comparison Execution times, when higher the threshold, less stations to calculate the correlation. Quicker.

```
> library("ggplot2")
> library(microbenchmark)
> tm <- microbenchmark(   corr("specdata", 800),
                         corr("specdata", 900),
                         corr("specdata", 5000),
                          times=2L)
> autoplot(tm)
```
Comparision execution: 

![alt text](https://github.com/ferfervi/R_Programming/blob/master/ProgrammingAssignment1/comparing_time_execution.jpg  "comparing execution times")

