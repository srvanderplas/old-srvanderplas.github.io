#----Libraries----
library(stringr)
library(lubridate)

library(dplyr)

library(knitr)
library(rmarkdown)
# library(markdown)
library(ReporteRs) # https://davidgohel.github.io/ReporteRs/gettingstarted.html
#-----------------

#---- Functions to parse input----

parseInput <- function(text){
  # Input: text (in single string form)
  # Output: List of variables and values

  # Debugging:
#   template.text <- readLines("testInput.txt")
#   text <- paste0(template.text, collapse="\n")

  textlines <- str_split(text, "\\n")[[1]]
  vars <- str_extract(textlines, "(.*):") %>%
    str_replace_all(pattern="\\s*?:$", replacement="")
  values <- str_extract(textlines, ":(.*)$") %>%
    str_replace_all(pattern="^:\\s{0,}", replacement="")
  data <- as.list(values)
  names(data) <- vars
  data <- lapply(data, fixTypes)
  return(data)
}

fixTypes <- function(tmp){
  # Input: a (probably named) string value
  # Output: appropriately formatted input:
  #         Currently recognized:
  #           - Dates (M-D-Y format)
  #           - Numeric data (separated by ; or , if in vector form)
  #           - Strings

  # Preserve names
  name.tmp <- names(tmp)

  # Split on commas and semicolons
  tmp2 <- str_split(tmp, "[;,]")[[1]]

  # Type convert
  numeric <- suppressWarnings(as.numeric(tmp2))
  date <- suppressWarnings(mdy(tmp))

  # Test for sensible output
  if(sum(is.na(numeric))==0 & is.na(date)){
    tmp <- numeric
    names(tmp) <- name.tmp
    return(tmp)
  } else if(sum(is.na(numeric))>0 & !is.na(date)){
    tmp <- date
    names(tmp) <- name.tmp
    return(tmp)
  }

  # If type is not recognized, return the string value
  names(tmp) <- name.tmp
  return(tmp)
}

missingValue <- function(vname, data){
  # Replace a single missing value with its'
  if(!vname %in% names(data)){
    data[[vname]] <- "-"
    data[[paste0(vname, "Error")]] <- " (not supplied)"
  } else {
    data[[paste0(vname, "Error")]] <- ""
  }
  return(data)
}

fixMissingInput <- function(data, all.var.names=NULL){
  fixedData <- data

  if(!"Title" %in% names(data)){
    fixedData$Title <- "Some Title"
  }

  if(!"Author" %in% names(data)){
    fixedData$Author <- ""
  }

  if(!"Date" %in% names(data)){
    fixedData$Date <- now()
    fixedData$DateError <- " (assumed to be today)"
  } else {
    fixedData$DateError <- ""
  }

  for(i in all.var.names){
    fixedData <- missingValue(vname=i, data=fixedData)
  }

  if(!"Comment" %in% names(data)){
    fixedData$Comment <- " none"
  }

  return(fixedData)
}

#-----End Fcns. to parse input----

#----Functions to knit documents----

#' Creates a column of variable-driven output specified by vars
#' @param mydoc ReporteRs Document
#' @param vars Structured list of variables
#' @param data List of data values
#' @param title Title of column (if specified). Otherwise, no title will be printed.
#' @param titleLevel section level of title (if specified). Defaults to 3.
makeColumn <- function(mydoc, vars, data, title=NULL, titleLevel=3){
  if(!is.null(title)){
    mydoc <- addTitle(mydoc, value = title, level=3)
  }

  for(i in 1:length(vars)){
    if(length(vars[[i]])==1){
      # If only a single value, print value and value's name
      mydoc <- addParagraph(mydoc, value=sprintf("%s: %s", vars[[i]], data[[vars[[i]]]]))
    } else {
      # If multiple values, assume the first is a sprintf-compatible pattern
      i1 <- vars[[i]][1]
      j <- vars[[i]][-1]
      mydoc <- addParagraph(mydoc, value=do.call(sprintf, c(i1, data[j])))
    }
  }
  return(mydoc)
}

knit_internal_docs <- function(data){


  md.htmlText <- readLines("internalDocument.Rmd")
  mdTempFile <- tempfile(pattern = "file", tmpdir = "./", fileext = ".md")
  knit(text=md.htmlText, output=mdTempFile)
  pandoc(mdTempFile, config='internalConfig.txt')
}

knit_external_docs <- function(data){
  fixedData <- data

  if(!"Title" %in% names(data)){
    fixedData$Title <- "External Document Title"
  }

  if(!"Author" %in% names(data)){
    fixedData$Author <- ""
  }

  if(!"Date" %in% names(data)){
    fixedData$Date <- now()
    fixedData$DateError <- " (assumed to be today)"
  } else {
    fixedData$DateError <- ""
  }

  if(!"Value1" %in% names(data)){
    fixedData$Value1 <- NA
    fixedData$Value1Error <- " (not supplied)"
  } else {
    fixedData$Value1Error <- ""
  }

  if(!"Value2" %in% names(data)){
    fixedData$Value2 <- NA
    fixedData$Value2Error <- " (not supplied)"
  } else {
    fixedData$Value2Error <- ""
  }

  if(!"Value3" %in% names(data)){
    fixedData$Value3 <- NA
    fixedData$Value3Error <- " (not supplied)"
  } else {
    fixedData$Value3Error <- ""
  }

  if(!"Comment" %in% names(data)){
    fixedData$Comment <- " none"
  }

  md.htmlText <- readLines("internalDocument.Rmd")
  mdTempFile <- tempfile(pattern = "file", tmpdir = "./", fileext = ".md")
  knit(text=md.htmlText, output=mdTempFile)
  pandoc(mdTempFile, config='internalConfig.txt')
}

#----End Fcns. to knit documents----
