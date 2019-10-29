library(shiny)
require("hlaPoly")

hlaData<-hlaDataInit()

function(input, output) {

  datasetInput <- eventReactive(input$go,{
	locus = sub("\\*.*","",input$nucAllele)
	allele2d = sub(":.*","",input$nucAllele)
	if(is.na(hlaData$refAllele[allele2d])){
       genAllele = as.character(hlaData$refAllele[locus])
	}
	else{
       genAllele = as.character(hlaData$refAllele[allele2d])

	}
    hlaGetAlign(hlaData, genAllele, input$nucAllele, input$conseq)
  })

  output$view <- renderDataTable({
     hlaAlign = datasetInput()
	mydata = hlaAlign2Novel(hlaAlign)
	if(is.na(mydata)){
		mydata
	}
	else{
	levels(mydata$reftype)=c("17ws reference","closest allele","upstream unreferenced","downstream unreferenced","seq extension")
	colnames(mydata)[8]="feature_number"
	colnames(mydata)[1]="reference type"
	mydata[,c(1,8,9,10,4,5,6,7,2,3)]
	}
  },
	options = list(
  autoWidth = FALSE,
	scrollX=TRUE,
  columnDefs = list(list(width = '200px', targets =c(5,6) ))
  ))

  output$text<- renderPrint({
	hlaAlign = datasetInput()
	cc=as.character(hlaAlign$triomsa)
	for(i in seq(1, nchar(cc[1]), 100)){
		print(i)
		j=i+99
		if(j>=nchar(cc[1])) j=nchar(cc[1])
		cat(paste(substring(cc[1],i,j),names(cc[1]),sep="\t"),"\n")
		cat(paste(substring(cc[2],i,j),names(cc[2]),sep="\t"),"\n")
		cat(paste(substring(cc[3],i,j),names(cc[3]),sep="\t"),"\n")
	}
  })
  output$genref<-renderText({
	
	locus = sub("\\*.*","",input$nucAllele)
	allele2d = sub(":.*","",input$nucAllele)
	if(is.na(hlaData$refAllele[allele2d])){
       genAllele = as.character(hlaData$refAllele[locus])
	}
	else{
       genAllele = as.character(hlaData$refAllele[allele2d])

	}
	genAllele

 })
	
}
