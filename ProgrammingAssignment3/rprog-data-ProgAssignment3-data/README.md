## Assignment 3 
##### Analyze the data from different hospitals and find the best hospital


###### section 1: example how to read data and print histogram

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


![alt text](https://github.com/ferfervi/R_Programming/blob/master/ProgrammingAssignment3/rprog-data-ProgAssignment3-data/histogram1.png  "Histogram")



######  section 2: find best hospital (less outcome parameter: i.e: deads by "hard attacks", "pneumonia"..)
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


######  section 3: get the hospital in position "num" (ranking) for the selected state and de selected outcome (parameter)

```
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
```
```
> source("rankhospital.R")
> rankhospital("MD", "pneumonia", "worst")
[1] "CIVISTA MEDICAL CENTER"
> rankhospital("TX", "heart failure", 4)
[1] "DETAR HOSPITAL NAVARRO"
```


######  section 4: get the hospital in position (num) for every state

```

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
  dataframe <- dataframe[ order(dataframe[,"state"]),]
  
  
}
```
```
> source("rankall.R")
> tail(rankall("pneumonia","worst"),2)
                             hospital state
51       POCAHONTAS MEMORIAL HOSPITAL    WV
53 SOUTH LINCOLN MEDICAL CENTER - CAH    WY
```

```
> rankall("heart attack")
                                   hospital state
2          PROVIDENCE ALASKA MEDICAL CENTER    AK
1                  CRESTWOOD MEDICAL CENTER    AL
4                   ARKANSAS HEART HOSPITAL    AR
3                      MAYO CLINIC HOSPITAL    AZ
5         GLENDALE ADVENTIST MEDICAL CENTER    CA
6      ST MARYS HOSPITAL AND MEDICAL CENTER    CO
7                        WATERBURY HOSPITAL    CT
9                       PROVIDENCE HOSPITAL    DC
8         BAYHEALTH - KENT GENERAL HOSPITAL    DE
10               MOUNT SINAI MEDICAL CENTER    FL
11                 STEPHENS COUNTY HOSPITAL    GA
54         GUAM MEMORIAL HOSPITAL AUTHORITY    GU
12                      HILO MEDICAL CENTER    HI
16              MARY GREELEY MEDICAL CENTER    IA
13                  PORTNEUF MEDICAL CENTER    ID
14                    SAINT JOSEPH HOSPITAL    IL
15   ST VINCENT HEART CENTER OF INDIANA LLC    IN
17                    KANSAS HEART HOSPITAL    KS
18        ST ELIZABETH MEDICAL CENTER NORTH    KY
19                ST FRANCIS MEDICAL CENTER    LA
22     BETH ISRAEL DEACONESS MEDICAL CENTER    MA
21              JOHNS HOPKINS HOSPITAL, THE    MD
20                            YORK HOSPITAL    ME
23                    MUNSON MEDICAL CENTER    MI
24                        ST MARYS HOSPITAL    MN
26                    BOONE HOSPITAL CENTER    MO
25                    WESLEY MEDICAL CENTER    MS
27                    BENEFIS HOSPITALS INC    MT
34       CAROLINAS MEDICAL CENTER-NORTHEAST    NC
35             SANFORD MEDICAL CENTER FARGO    ND
28           FAITH REGIONAL HEALTH SERVICES    NE
30                  CATHOLIC MEDICAL CENTER    NH
31             EAST ORANGE GENERAL HOSPITAL    NJ
32                      ST VINCENT HOSPITAL    NM
29      SUNRISE HOSPITAL AND MEDICAL CENTER    NV
33                     NYU HOSPITALS CENTER    NY
36                     JEWISH HOSPITAL, LLC    OH
37            OKLAHOMA HEART HOSPITAL SOUTH    OK
38               PORTLAND VA MEDICAL CENTER    OR
39                      DOYLESTOWN HOSPITAL    PA
40        HOSPITAL DR CAYETANO COLL Y TOSTE    PR
41                          MIRIAM HOSPITAL    RI
42                      MUSC MEDICAL CENTER    SC
43 AVERA HEART HOSPITAL OF SOUTH DAKOTA LLC    SD
44    METHODIST MEDICAL CENTER OF OAK RIDGE    TN
45         CYPRESS FAIRBANKS MEDICAL CENTER    TX
46            DIXIE REGIONAL MEDICAL CENTER    UT
49       CHESAPEAKE REGIONAL MEDICAL CENTER    VA
48        ROY LESTER SCHNEIDER HOSPITAL,THE    VI
47       FLETCHER ALLEN HOSPITAL OF VERMONT    VT
50   PROVIDENCE SACRED HEART MEDICAL CENTER    WA
52                    BELLIN MEMORIAL HSPTL    WI
51       MONONGALIA COUNTY GENERAL HOSPITAL    WV
53                   WYOMING MEDICAL CENTER    WY
```  
```  
> head(rankall("heart attack",20),10)
                              hospital state
2                                 <NA>    AK
1       D W MCMILLAN MEMORIAL HOSPITAL    AL
4    ARKANSAS METHODIST MEDICAL CENTER    AR
3  JOHN C LINCOLN DEER VALLEY HOSPITAL    AZ
5                SHERMAN OAKS HOSPITAL    CA
6             SKY RIDGE MEDICAL CENTER    CO
7              MIDSTATE MEDICAL CENTER    CT
9                                 <NA>    DC
8                                 <NA>    DE
10      SOUTH FLORIDA BAPTIST HOSPITAL    FL
```  
