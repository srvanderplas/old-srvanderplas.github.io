#' Function to format a document for Dept 1 using input from a provided text file
#' @param data Formatted data produced by parseInput()
#' @param filename File name (no extension)
Dept1_Document <- function(data, filename="Dept1_Test"){
  # Input: data, a named list
  # Output: a properly formatted word document

  require(ReporteRs)

  # List of all required variables for this format:
  req.vars <- c("Value1Input", "Value1Fun", "Value1Target", "Value2", "Value3", "Value4", "CNS1", "CNS2", "CNS3", "Status1", "Status2", "Status3", "Status4", "Status5", "TerrorLevel", "CooperRisk", "Comment")

  # Fix data to have all variables required (even if not provided in the input txt file)
  fixed.data <- fixMissingInput(data, all.var.names=req.vars)

  # Use functions that are specified to operate on their values
  fun.list <- req.vars[str_detect(req.vars, "Fun")]
  fun.var.list <- str_replace(fun.list, "Fun$", "")
  for(i in 1:length(fun.list)){
    func <- get(fixed.data[[fun.list[i]]])
    fixed.data[[fun.var.list[i]]] <- func(fixed.data[[paste0(fun.var.list[[i]], "Input")]])
  }

  # Variables in each section of the main document
  col.1.vars <- list(c("Value1: %s (Target: %s)", "Value1", "Value1Target"),
                     "Value2",
                     "Value3",
                     "Value4")
  col.2.vars <- list("CNS1", "CNS2", "CNS3")
  col.3.vars <- list("Status1", "Status2", "Status3", "Status4", "Status5")
  end.vars <- list("Comment")

  mydoc <-  docx()

  # Header
  mydoc <- addSection(mydoc, ncol = 3, columns.only = TRUE)
  mydoc <- addImage(mydoc, "logo.png", width=2, height=.75, par.properties = parLeft())
  mydoc <- addColumnBreak(mydoc)
  mydoc <- addTitle(mydoc, value = fixed.data$Title, level = 1)
  mydoc <- addColumnBreak(mydoc)
  mydoc <- addParagraph(mydoc, value = paste0("Terror Level: ", fixed.data$TerrorLevel))
  mydoc <- addParagraph(mydoc, value = paste0("Plant Risk: ", fixed.data$CooperRisk))

  # Begin Columns
  mydoc <- addSection(mydoc, ncol = 3, columns.only = TRUE)
  mydoc <- makeColumn(mydoc, vars=col.1.vars, data=fixed.data, title="Column 1")
  mydoc <- addColumnBreak(mydoc)
  mydoc <- makeColumn(mydoc, vars=col.2.vars, data=fixed.data, title="Column 2")
  mydoc <- addColumnBreak(mydoc)
  mydoc <- makeColumn(mydoc, vars=col.3.vars, data=fixed.data, title="Column 3")

  # Items at the end of the document
  mydoc <- addSection(mydoc, ncol = 1, columns.only = TRUE)
  mydoc <- makeColumn(mydoc, vars=end.vars, data=fixed.data, title="Other Information")

  writeDoc(mydoc, file = paste0(filename, ".docx"))
}

#' Function to format a document for Dept 2 using input from a provided text file
#' @param data Formatted data produced by parseInput()
#' @param filename File name (no extension)
Dept2_Document <- function(data, filename){
  # Input: data, a named list
  # Output: a properly formatted word document

  require(ReporteRs)

  # List of all required variables for this format:
  req.vars <- c("Value1Input", "Value1Fun", "Value1Target", "Value2", "Value3", "Value4", "Value5", "Value6", "Value7", "CNS1", "CNS2", "CNS3", "CNS4", "CNS5", "CNS6", "Status1", "Status2", "Status3", "Status4", "Status5", "TerrorLevel", "CooperRisk", "Comment")

  # Fix data to have all variables required (even if not provided in the input txt file)
  fixed.data <- fixMissingInput(data, all.var.names=req.vars)

  # Use functions that are specified to operate on their values
  fun.list <- req.vars[str_detect(req.vars, "Fun")]
  fun.var.list <- str_replace(fun.list, "Fun$", "")
  for(i in 1:length(fun.list)){
    func <- get(fixed.data[[fun.list[i]]])
    fixed.data[[fun.var.list[i]]] <- func(fixed.data[[paste0(fun.var.list[[i]], "Input")]])
  }

  # Variables in each section of the main document
  col.1.vars <- list(c("Value1: %s (Target: %s)", "Value1", "Value1Target"),
                     "Value2",
                     "Value3",
                     "Value4",
                     "Value5",
                     "Value6",
                     "Value7",
                     c("Repeat Value2: %s", "Value2"))
  col.2.vars <- list("CNS1", "CNS2", "CNS3")
  col.3.vars <- list("Status1", "Status2", "Status3", "Status4", "Status5")
  end.vars <- list("Comment")

  mydoc <-  docx()

  # Header
  mydoc <- addSection(mydoc,ncol = 3)
  mydoc <- addImage(mydoc, "logo.png", width=2, height=.75, par.properties = parLeft())
  mydoc <- addColumnBreak(mydoc)
  mydoc <- addTitle(mydoc, value = fixed.data$Title, level = 1)
  mydoc <- addColumnBreak(mydoc)
  mydoc <- addParagraph(mydoc, value = paste0("Terror Level: ", fixed.data$TerrorLevel))
  mydoc <- addParagraph(mydoc, value = paste0("Plant Risk: ", fixed.data$CooperRisk))

  # Begin Columns
  mydoc <- addSection(mydoc, ncol = 3)
  mydoc <- makeColumn(mydoc, vars=col.1.vars, data=fixed.data, title="Informative Title")
  mydoc <- addColumnBreak(mydoc)
  mydoc <- makeColumn(mydoc, vars=col.2.vars, data=fixed.data, title="More Info")
  mydoc <- addColumnBreak(mydoc)
  mydoc <- makeColumn(mydoc, vars=col.3.vars, data=fixed.data, title="Etc.")

  # Items at the end of the document
  mydoc <- makeColumn(mydoc, vars=end.vars, data=fixed.data, title="Misc. Information")

  writeDoc(mydoc, file = paste0(filename, ".docx"))
}
