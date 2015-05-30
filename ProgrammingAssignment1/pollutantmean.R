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
  #filesToRead <- character()
  #for( i in id){ filesToRead <- c( filesToRead , paste(i,".csv",sep='')) }
  
  filenames <- sprintf("%03d.csv", id)
  if(!is.null(directory))
  {
     filenames <- paste(directory, filenames, sep="/")
  }
  
  # B) READ  selected files
  # OPTION B1
   dataset <- do.call("rbind",lapply(filenames,
                                     FUN=function(files){read.csv(files,
                                                             header=TRUE, sep=",")}))
  
  # OPTION B2
 # require(plyr)
  #dataset <- ldply(filenames, read.csv)
  
  # calculate the mean from the dataset
  themean <- mean(dataset[, pollutant], na.rm = TRUE)
  themean
  #as.data.frame(themean)
}