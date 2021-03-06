\name{newH5DF}
\alias{newH5DF}
\title{Function to create a new h5DF object}
\usage{
  newH5DF(DF, filePath, chunkSize = 50000, ...)
}
\arguments{
  \item{DF}{data frame or file path to csv file containing
  data frame to be written to h5DF object}

  \item{filePath}{path to file that will contain the h5DF
  data object}

  \item{chunkSize}{the number of rows that each chunk will
  take}

  \item{...}{parameters passed to read.csv() function}
}
\value{
  a h5DF object
}
\description{
  Function to create a new h5DF object
}
\examples{
# Create a new h5DF object from the iris dataset
ir1 <- newH5DF(iris, "iris.h5", 10)
ir1 # The details of the object
chNames <- ir1$chunkNames # The names of the chunks
ir1$readChunk(chNames[3]) # read chunk number 3
ir1$readChunks(chNames[1:5]) # read the first 5 chunks
ir1$readTable() # reads back the whole table
ir2 <- openH5DF("iris.h5") # create H5 df from file
# Create a h5MEMDF object from a h5DF object by memorize (i.e. brings the h5DF object into memory)
irMDF <- ir2$memorize()
irMDF # this is a h5MEMDF object, chunked DF object in memory with pointers
irMDF$ptrs
}

