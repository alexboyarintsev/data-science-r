corr <- function(directory, threshold = 0) {
    setwd("C:/work/my-projects/Data Science/data-science-r/working-directory")
    result <- c()
    id <- 1:332
    for (fileid in id) {
        if (fileid < 10) {
            fileid <- paste("00", fileid, sep = "")
        } else if (fileid < 100) {
            fileid <- paste("0", fileid, sep = "")
        }
        filename <- paste(fileid, ".csv", sep = "")
        path <- paste(directory, filename, sep = "/")
        inputData <- read.csv(path, head= TRUE, sep = ",")
        inputData <- na.omit(inputData)
        completeCases <- nrow(inputData)
        if (completeCases > threshold) {
            nitrate <- inputData[,"nitrate"]
            sulfate <- inputData[,"sulfate"]
            result <-c(result, cor(nitrate, sulfate))
        }
        
    }
    result
}

#vector <- c(vector, v)

# Test

# > cr <- corr("specdata", 150)
# > head(cr)
## [1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589
# > summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.2110 -0.0500  0.0946  0.1250  0.2680  0.7630