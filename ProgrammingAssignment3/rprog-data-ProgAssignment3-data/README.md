## Assignment 3 
##### Analyze the data from different hospitals and find the best hospital


######## section 1: example how to read data and print histogram

```

# read file data as "characters"
> outcome <- read.csv("outcome-of-care-measures.csv", colClasses ="character")

# transform the column that we want to plot to numeric
> outcome[,11] <- as.numeric(outcome[,11])
> head(outcome)

# plot histogram
> hist(outcome[,11])
```
Histogram: 
![Histogram](https://github.com/ferfervi/R_Programming/tree/master/ProgrammingAssignment3/rprog-data-ProgAssignment3-data/histogram1.png)


######## section 2: find best hospital (less outcome parameter: i.e: deads by "hard attacks", "pneumonia"..)
```
best <- function (state,outcome)
{
   fc <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
   
   #check that state is valid
   if(! state %in% fc$State) stop("invalid state")
   
   #check valid outome parameter
   valid_outcomes = c("heart attack", "heart failure", "pneumonia")
   if(! is.element(outcome,valid_outcomes)) stop("invalid outcome")

   ## Filter: keep only the ones in the state we are seeking
   data <- fc[fc$State == state,]
   
   #get the column name in file for the outcome input parameter
   outcome_column_name <- NULL
   if (outcome == "heart attack") {
     outcome_column_name <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
   } else if (outcome == "heart failure") {
     outcome_column_name <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
   } else {
     outcome_column_name <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
   }
   
   #transform the column that we want to find the min to numeric (was read as a character)
   data[,outcome_column_name] <- as.numeric(data[,outcome_column_name] )
   
   #calculate the minimum value for the outcome parameter
   min_value <-min(data[[outcome_column_name]],na.rm=TRUE)
   
   # OPTION 1) get the row for (data for hospital) with the minumum score that we were seeking
         #select the rows with the min value (only one check possible + we need to return the full row)   
             #best_hospital <- data[data[,outcome_column_name] == min_value,]
        
         #sort and get the first one in case that there are several with the minumim score.
            # best_hospital <- sort(best_hospital[,"Hospital.Name"])
     
   # OPTION 2) utilize subset function 
       # the subset function allows to select as many conditions as we want + select to return the field of interest 
         best_hospital <- subset(data[,"Hospital.Name"], !is.na(data[,outcome_column_name]) & data[,outcome_column_name] == min_value )
        
         #sort and get the first one in case that there are several with the minumim score.
         best_hospital <- sort(best_hospital)
   
   # return the first hospital in case that are several with the lowest score
   as.character(best_hospital[1])
}

```
```
> source("best.R")
> best("MD","pneumonia")
[1] "GREATER BALTIMORE MEDICAL CENTER"
```


