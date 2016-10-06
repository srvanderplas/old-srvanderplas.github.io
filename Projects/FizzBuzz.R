# FizzBuzz program

i <- 1:100

fizzbuzz <- function(i) {
  str <- ""
  if (i %% 3 == 0) {
    str <- "Fizz"
  }
  if (i %% 5 == 0) {
    str <- paste0(str, "Buzz")
  }
  if (nchar(str) < 1) {
    str <- as.character(i)
  }

  str
}

unlist(lapply(1:100, fizzbuzz))
