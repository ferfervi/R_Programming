rankall <- function (outcome,num = "best")
{ 
  fc <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
 
  # get all states existent in file
  states <- unique(fc[,"State"])
  
  #check valid outome parameter
  valid_outcomes = c("heart attack", "heart failure", "pneumonia")
  if(! is.element(outcome,valid_outcomes)) stop("invalid outcome")
  
  #get the column name in file for the outcome input parameter
  outcome_column_name <- NULL
  if (outcome == "heart attack") {
    outcome_column_name <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  } else if (outcome == "heart failure") {
    outcome_column_name <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  } else {
    outcome_column_name <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  }
  
  dataset <- do.call("rbind",lapply( states,
                                            FUN=function(state)
                                            { #exclude na values and select only the ones from the current state
                                              hospitals_in_state <- subset(fc , !is.na(fc[,outcome_column_name]) & fc[,"State"] == state)
                                              
                                              #use "order" to sort it, first by outcome and then by hospital name
                                              sorted_data_for_state <- hospitals_in_state[ order(as.numeric(hospitals_in_state[,outcome_column_name]), hospitals_in_state[,"Hospital.Name"]),]
                                              hospital <- NULL
                                              if (num == "best") 
                                              { 
                                                hospital <- head(sorted_data_for_state[,"Hospital.Name"], n = 1)
                                              } 
                                              else if (num == "worst") 
                                              { #num_rows = nrow(sorted_data_for_state)
                                                #hospital <- sorted_data_for_state[,"Hospital.Name"][num_row]
                                                
                                                hospital <- as.character(tail(sorted_data_for_state[,"Hospital.Name"], n = 1))
                                              }
                                              else 
                                              {  if(num >nrow((sorted_data_for_state))) hospital <-NA
                                                 else
                                                 {
                                                   hospital <- sorted_data_for_state[,"Hospital.Name"][num]
                                                 }
                                              }
                                              c(hospital,state)
                                            } 
                                    )
                          )
  # return it a a data frame
  colnames(dataset)<- c("hospital","state")
  dataframe <- as.data.frame(dataset)
  dataframe[ order(dataframe[,"state"]),]
  
  
}
  

  