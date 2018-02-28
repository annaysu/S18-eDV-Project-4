dfB <- eventReactive(c(input$selectDepartment_1), { 
  project <- "https://data.world/yuchan-su/s18-edv-project-2" 
  data.world::set_config(cfg_env("DW_API")) 
  paramQuery <- data.world::qry_sql(
    "   
    select department, age, distancefromhome,totalworkingyears
    from ibm_hr_attrition
    where department in (?, ?, ?)
    order by department
    ")
  
  paramQuery$params <- c(input$selectDepartment_1[1], input$selectDepartment_1[2], input$selectDepartment_1[3])
  data.world::query(paramQuery, dataset = project)
})

dfB1 <- eventReactive(c(input$selectDepartment_1, input$yDataMin__1_, input$yDataMax__1_), { 
  if( ! is.na(input$yDataMin__1_) & ! is.na(input$yDataMax__1_)) {
    dfB() %>% dplyr::filter(between(age, input$yDataMin__1_, input$yDataMax__1_))
  }
  else {
    dfB()
  }
})

