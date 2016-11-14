library(shiny)
library(shinyFiles)
#library(gdata)
options(shiny.maxRequestSize=500*1024^2) 
# Define UI for slider demo application
shinyUI(pageWithSidebar(
  #  Application title
  headerPanel("All patterns for EBSeq multiple condition analysis"),
  
  # Sidebar with sliders that demonstrate various available options
  sidebarPanel(width=8,height=10,
               # grouping vector
               fileInput("ConditionVector", label = "Condition vector \n file name (support .csv, .txt, .tab)"),
               
               column(4,
                      # output dir
                      tags$div(tags$b("Please select a folder for output :")),
                      
                      shinyDirButton('Outdir', label ='Select Output Folder', title = 'Please select a folder'),
                      tags$br(),
                      tags$br(),
                      
                      # export DE gene list with p-value 
                      textInput("plot", 
                                label = "Export file name - Plot of all possible patterns for given conditions", 
                                value = "PatternPlot"),  
                      
                      # export DE gene list with p-value 
                      textInput("txtfile", 
                                label = "Export file name - Text file of all possible patterns for given conditions", 
                                value = "PatternTxt")
               ),
               br(),
               actionButton("Submit","Submit for processing")
  ),
  # Show a table summarizing the values entered
  mainPanel(
    h4(textOutput("print0")),
    #tableOutput("values")
    dataTableOutput("tab")
  )
))
