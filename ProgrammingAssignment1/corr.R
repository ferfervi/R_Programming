corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
 # filenames <- list.files(directory)
#  if(!is.null(directory))
 #  {
  #  filenames <- paste(directory, filenames, sep="/")
  #}
  
  # A) Select the files that with ncomplete > threshold
  fileID.ncomplete <- complete(directory)
 ids <- subset(fileID.ncomplete[["id"]],fileID.ncomplete[,"nobs"] > threshold)
 filenames <- sprintf("%03d.csv", ids)
 
   if(!is.null(directory) && length(filenames)>0)
   {
     filenames <- paste(directory, filenames, sep="/")
   }
 
 # B) READ  selected files
 # OPTION B1
 if(length(filenames)>0)
 {
   dataset <- do.call("rbind",lapply( filenames,
                                      FUN=function(file)
                                      { fc <- read.csv(file);
                                        
                                        rfc <- fc[complete.cases(fc),]
                                        cor(rfc["sulfate"],rfc["nitrate"])
                                      }
                                    )
                       )
 
   as.vector(dataset)
 }
 else
 {
   vector('numeric')
 }

 
}