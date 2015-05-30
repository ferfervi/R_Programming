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