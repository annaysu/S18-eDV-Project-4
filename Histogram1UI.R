# Change "histogram1", all __1_s, and edit tiles below:
tabItem(tabName = "Histogram",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          #the table__1_ is defined in the SERVER code
          tabPanel("Data", 
             dataTableOutput('table__1_'),
             downloadButton('download__1_',"Download the data")),
          tabPanel("Plot Size", 
             numericInput("plotWidth__1_", "Plot Width (Required)", 1000),
             numericInput("plotHeight__1_", "Plot Height (Required)", NA)),
          #you can edit the title and size of the font of the title
          tabPanel("Plot Title",
             textInput("title__1_", "Title 1", "Monthly Income by Age and Occupation"),
             numericInput("titleFont__1_", "Title Font", 10)), 
          #you'll see four things under the legend tab
          tabPanel("Plot Legend",
             textInput("legendTitle__1_", "Legend Title", "Ages"),
             numericInput("legendTitleSize__1_", "Legend Title Size", 10),
             numericInput("legendItemSize__1_", "Legend Item Size", 10),
             numericInput("legendKeySize__1_", "Legend Key Size", 5)), 
          tabPanel("Axis Labels",
             textInput("xLabel__1_", "x-Axis Label", "Monthly Income"),
             textInput("yLabel__1_", "y-Axis Label 1", "Monthly Income Count"),
             numericInput("textFont__1_", "textFont", 10)),
    tabPanel("Data Size", 
             numericInput("yDataMin__1_", "yData Minimum (Required)", 0),
             numericInput("yDataMax__1_", "yData Maximum (Required)", NA))),
        #where the plot is displayed since it's not said above or anywhere else lol
        plotlyOutput("Histogram__1_", height=800)
)
#Misc Change