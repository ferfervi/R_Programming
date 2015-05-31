rankhospital <- function (state,outcome,num)
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
  
  #exclude na values 
  hospitals_without_na <- subset(data , !is.na(data[,outcome_column_name]))
  
  #use "order" to sort it, first by outcome and then by hospital name
  sorted_data <- hospitals_without_na[ order(hospitals_without_na[,outcome_column_name], hospitals_without_na[,"Hospital.Name"]),]

  if (num == "best") 
  {
    source("best.R")
    best(state, outcome)
  } 
  else if (num == "worst") 
  {
    tail(sorted_data[,"Hospital.Name"], n = 1)
  }
  else 
  {
    if(num >nrow((sorted_data))) NA
     else
       {
         sorted_data[,"Hospital.Name"][num]
       }
  }
}
