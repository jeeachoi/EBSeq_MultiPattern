library(shiny)
library(shinyFiles)
library(EBSeq)
#library(colourpicker)

# Define server logic for slider examples
shinyServer(function(input, output, session) {
  volumes <- c('home'="~")
  shinyDirChoose(input, 'Outdir', roots=volumes, session=session, restrictions=system.file(package='base'))
  output$Dir <- renderPrint({parseDirPath(volumes, input$Outdir)})

  In <- reactive({
    print(input$Outdir)
    #outdir <- paste0("~", input$Outdir[[1]][[2]], "/")
    outdir <- paste0("~",do.call("file.path",input$Outdir[[1]]),"/")
    print(outdir)
    
   Group.file <- input$ConditionVector$name
    if(is.null(Group.file)) stop("Input file is missing")
    if(!is.null(Group.file)){
      Group.Sep=strsplit(Group.file,split="\\.")[[1]]
      if(Group.Sep[length(Group.Sep)]=="csv")GroupVIn=read.csv(input$ConditionVector$datapath,stringsAsFactors=F,header=F)
      if(Group.Sep[length(Group.Sep)]!="csv")GroupVIn=read.table(input$ConditionVector$datapath,stringsAsFactors=F,header=F, sep="\t")
    }
    GroupV=GroupVIn[[1]]
   
    print(input)
    # Compose data frame
    #input$filename$name
    List <- list(
      GroupFile=Group.file,
      Cond=factor(GroupV, levels=unique(GroupV)),# follow the order they appeared
      
      Dir=outdir, 
      # For Two-cond
      Out1 = paste0(outdir,input$plot,".pdf"),		
      Out2 = paste0(outdir,input$txtfile,".txt")
    )

   Patt=GetPatterns(as.factor(GroupV))
   Patt=as.matrix(Patt)
   pdf(List$Out1, height=7, width=5)
   PlotPattern(Patt)
   dev.off()
   write.table(Patt, file=List$Out2)
    List=c(List, list(Sig=Patt))	
  })   
  
  Act <- eventReactive(input$Submit,{
    In()})
  # Show the values using an HTML table
  output$print0 <- renderText({
    tmp <- Act()
    str(tmp)
    paste("output directory:", tmp$Dir)
  })
  
  output$tab <- renderDataTable({
    tmp <- Act()$Sig
    t1 <- tmp
    print("Done!")
    t1
  },options = list(lengthManu = c(4,4), pageLength = 20))
  

})
