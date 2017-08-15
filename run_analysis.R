run_analysis <- function()
{
  library(dplyr)
  library(tidyr)
  ## Getting the Column Names 
  tcol <-  tcol<- read.delim(file.choose(), stringsAsFactors = FALSE, header= FALSE)
  tcol<- separate(tcol, V1, into = c("SrNo","Feature"), sep = " ")
  tcol <- tcol[,2]
  
  
  ## Cleaning of Train X Data File 
  testx<- read.delim(file.choose(),stringsAsFactors = FALSE, header = FALSE)
  temp<- testx[[1]]
  ##converting the fields as character
  temp<- as.character(temp)
  ## Separating the one big colummn to different column Space " " as seperator 
  temp<- sapply(temp, strsplit, " ")
  ## Replacing the junk values to be NA 
  temp <- sapply(temp, na_if, "")
  ## A loop for the records to remove the NA value out of the records 
  for(i in 1:length(temp))
  {
    temp[[i]]<- temp[[i]][!is.na(temp[[i]])]
  }
  temp<- do.call(rbind.data.frame, temp)
  colnames(temp) <- tcol
  rownames(temp)<- 1:nrow(temp)
  testx<- temp
  
  ##----------------------------------------------------------------------------
  
  ## Cleaning of Train X Data File 
  trainx <- read.delim(file.choose(), stringsAsFactors = FALSE, header = FALSE)
  temp<- trainx[[1]]
  ##converting the fields as character
  temp<- as.character(temp)
  ## Separating the one big colummn to different column Space " " as seperator
  temp<- sapply(temp, strsplit, " ")
  ## Replacing the junk values to be NA
  temp <- sapply(temp, na_if, "")
  
  ## A loop for the records to remove the NA value out of the records 
  for(i in 1:length(temp))
  {
    temp[[i]]<- temp[[i]][!is.na(temp[[i]])]
  }
  
  temp<- do.call(rbind.data.frame, temp)
  colnames(temp) <- tcol
  rownames(temp)<- 1:nrow(temp)
  trainx<- temp
  
  ## Rbind  the two file Temp and Train 
  
  test_train_rbind <- rbind(testx, trainx)
  
}