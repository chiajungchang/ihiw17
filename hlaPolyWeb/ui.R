require(shiny)
require("DT")

imgtVersions=c("3.25.0","3.26.0","3.28.0","3.30.0","3.34.0","3.38.0")
names(imgtVersions)=imgtVersions

# Define UI for application that draws a histogram
fluidPage(theme="bootstrap.min.css",

  # Application title
  titlePanel("hlaPoly"),

  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
     selectInput("versionInput",label="IMGT/HLA version",choices=imgtVersions,selected="3.25.0"), 
	textInput("nucAllele", "Closest Allele:", "HLA-DPA1*01:03:01:01"),
  
  strong("Reference Allele:"),
#	textInput("subm", "sum matrix", "Gonnet"),
	h3(textOutput("genref")),
  	actionButton("go", "Go"),
  br(),
  br(),
  strong("Nucleotide sequence:"),
  br(),
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
