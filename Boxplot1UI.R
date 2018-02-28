# Change "newplot1", all __5_s, and edit tiles below:
tabItem(tabName = "Boxplot",
        tabsetPanel( 
          tabPanel("Plots"),# To create a tab panel - see https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html
          tabPanel("Data", 
             dataTableOutput('table__5_'),
             downloadButton('download__5_',"Download the data")),
          tabPanel("Plot Size", 
             numericInput("plotWidth__5_", "Plot Width (Required)", 1000),
             numericInput("plotHeight__5_", "Plot Height (Required)", NA)),
          tabPanel("Plot Title",
             textInput("title__5_", "Title 1", "Total Years of Working Experience"),
             numericInput("titleFont__5_", "Title Font", 10)), 
          tabPanel("Axis Labels",
             textInput("xLabel__5_", "x-Axis Label", "Department"),
             textInput("yLabel__5_", "y-Axis Label 1", "Years Worked at IBM"),
             numericInput("textFont__5_", "textFont", 10)),
    tabPanel("Data Size", 
             numericInput("yDataMin__5_", "yData Minimum (Required)", 0),
             numericInput("yDataMax__5_", "yData Maximum (Required)", NA))),
        plotlyOutput("Histogram__5_", height=800)
)
