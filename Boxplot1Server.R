# Change all __5_s, Download information, and edit the plot and ggplotly arguments below:
# Build Download Button and Output DataTable---------------
  output$download__5_ <- downloadHandler(
    filename = function(){"Histogram.csv"}, 
    content = function(fname){
      write.csv(dfB1(), fname)
    }
  )
  output$table__5_ <- renderDataTable({
    DT::datatable(dfB1(), rownames = FALSE, extensions = list(Responsive = TRUE, FixedHeader = TRUE)
    )
  })
# ---------------------------------------------------------
# Build and Output Throughput Plot ------------------------
  output$Histogram__5_ <- renderPlotly({
    plot = dfB1() %>% ggplot() + 
      geom_boxplot(mapping = aes(x = department , y = totalworkingyears), size = 2) +
      theme_bw() +
      theme(plot.title = element_text(size = input$titleFont__5_, face = "bold")) + 
      theme(axis.text=element_text(size=input$textFont__5_),
            axis.title=element_text(size=input$textFont__5_, face="bold"),
            axis.text.x = element_text(angle = 45, hjust = 1))  +
      theme(plot.margin=unit(c(2,2,2,2),"cm")) +
      scale_y_continuous(labels = scales::comma) + # Disable scientific notation
      ggtitle(paste(Departments(), input$title__5_)) +
      xlab(input$xLabel__5_) + ylab(input$yLabel__5_) +
      theme(axis.title.y = element_text(margin = margin(t = 10, r = 10, b = 10, l = 10))) +
      scale_color_discrete(name = input$legendTitle__5_)
    
    if( ! is.na(input$plotWidth__5_) & ! is.na(input$plotHeight__5_))
      ggplotly(plot, tooltip = c("age"), session="knitr", width = input$plotWidth__5_, height = input$plotHeight__5_)
    else
      ggplotly(plot, tooltip = c("age"), session="knitr") 
  })
  # ---------------------------------------------------------
  