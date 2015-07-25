complete <- function(directory, id = 1:332) {
    setwd("C:/work/my-projects/Data Science/data-science-r/working-directory")
    result <- data.frame()
    for (fileid in id) {
        if (fileid < 10) {
            fileid <- paste("00", fileid, sep = "")
        } else if (fileid < 100) {
            fileid <- paste("0", fileid, sep = "")
        }
        filename <- paste(fileid, ".csv", sep = "")
        path <- paste(directory, filename, sep = "/")
        inputData <- read.csv(path, head= TRUE, sep = ",")
        row <- data.frame(inputData[1,"ID"], nrow(na.omit(inputData)))
        result <- rbind(result, row)
    }
    names(result) <- c("id", "nobs")
    result
}


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