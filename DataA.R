dfA <- eventReactive(c(input$selectDepartment_1), { 
  project <- "https://data.world/yuchan-su/s18-edv-project-2" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select department, monthlyincome
    from ibm_hr_attrition
    where department in (?, ?, ?)
    order by monthlyincome
    ")
  paramQuery$params <- c(input$selectDepartment_1[1], input$selectDepartment_1[2], input$selectDepartment_1[3])
  data.world::query(paramQuery, dataset = project)
})

dfA1 <- eventReactive(c(input$selectDepartment_1, input$yDataMin__1_, input$yDataMax__1_), { 
  
  #do a filter if the min and max is not NULL
  if( ! is.na(input$yDataMin__1_) & ! is.na(input$yDataMax__1_)) {
    dfA() %>% dplyr::filter(between(monthlyincome, input$yDataMin__1_, input$yDataMax__1_))
  }
  else {
    dfA()
  }
})
