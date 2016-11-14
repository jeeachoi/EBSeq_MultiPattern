# Get pattern for EBSeq Multiple condition analysis

EBSeq R package and its vignette could be found at 
https://github.com/lengning/EBSeq

To install EBSeq, in R run: 

> install.packages("devtools")

> library(devtools)

> install_github("lengning/EBSeq/package/EBSeq")

Or install locally.


### Run the app
To launch EBSeq Shiny GUI, in R run:

> library(shiny)

> library(shinyFiles)

> runGitHub('jeeachoi/EBSeq_MultiPattern')

<img src="https://github.com/jeeachoi/EBSeq_MultiPattern/blob/master/MultiPattern.png" width="300" height="400" />

## 2. Input files
Example input condition file can be found "CondMulti.csv". 

## 3. Output files
(1) Plot of all possible patterns is provided

(2) Text file showing all possible patterns is provided

You may also see the output on Shiny app (bottom) once it's done running.
