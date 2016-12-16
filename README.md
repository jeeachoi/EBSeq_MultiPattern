# Get pattern for EBSeq Multiple condition analysis

To run the EBSeq_MultiPattern graphical user interface (GUI), it requires the following packages: shiny, shinyFiles, EBSeq

R version ≥ 3.0.0 is needed. For mac user, make sure whether xcode is installed.

To install the shiny and EBSeq packages, in R run:

> install.packages("shiny")

> install.packages("shinyFiles")

> install.packages("EBSeq")

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

You may also see the output on Shiny app GUI (bottom) once it's done running.
