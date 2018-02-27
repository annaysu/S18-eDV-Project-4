dfB <- eventReactive(c(input$selectRegion_1), { 
  project <- "https://data.world/yuchan-su/s18-edv-project-2" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select department,age
    from ibm_hr_attrition
    ")
  
  #by defaul it fills all 4 parameter, but if you change it to only East, its going to just display East. Since the above query is actuallly rerun.... The query above is actually DEPENDENT On the selected query region from the website. 
  
  paramQuery$params <- c(input$selectDeparment_1[1], input$Department_1[2], input$selectDepartment_1[3])
  data.world::query(paramQuery, dataset = project)
})

#if you chnage the region you do want these here to help load into the dataframe
dfB1 <- eventReactive(c(input$selectDepartment_1), { 
  if( ! is.na(input$yDataMin__4_) & ! is.na(input$yDataMax__4_)) {
    dfB() %>% dplyr::filter(between(age, input$yDataMin__4_, input$yDataMax__4_))
  }
  else {
    dfB()
  }
})
