library(shiny)

# Define UI for application that draws a histogram
fluidPage(theme="bootstrap.min.css",

  # Application title
  titlePanel("hlaPoly"),

  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
	textInput("nucAllele", "Closest Allele:", "HLA-DPA1*01:03:01:01"),
	actionButton("go", "Go"),
#	textInput("subm", "sum matrix", "Gonnet"),
	h3(textOutput("genref")),
	h2(Sys.getenv('R_USER')),
	h2(tempdir()),
	h2("fff"),
#	numericInput("sposition","Start Position:",0,min=0,max=10000),
	tags$textarea(id="conseq",placeholder= "Consensus Seq:",rows=70, cols=50, "TACCGATAACTAACTGAGTAGTTAATATGGTCAGGCGCTATTCTGAGGATTTACATTTATTAACTCACTTTATTCTCACACATAGTCTTTGAGGTAGGTACTATTATTTTCACTATTTCACATGAGAGATACTTACATCTTTTTACATACACAGAGACTTTAAGCACTTTGATCAAGTTCCCACAGCTATGAAGTAGTAGGGCTAGCTTCCAATCCAGAAAGTCTGGATCCAAGACTGTTTATCCACTGTCCTATTCACCCTATTTTGTGAAGGAAAAGACCAAGTTCAAATTCTCCAGAGTCCATTGCCAAATAATGGAGTCAGATCTATATTTCTATACATAATTACAACACAGTGTGGTGGGTGCCTGTAACTACTTACTGTCTCTACTTGGACTCATTCCATGGCAATGTTCACACAAAAAATGCC")
    ),

    # Show a plot of the generated distribution
    mainPanel(
	verbatimTextOutput('text'),
      dataTableOutput("view")
    )
  )
)
