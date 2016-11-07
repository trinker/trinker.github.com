#NEED data from dissertation
sankeydat <- Map(function(x, y){
    
    # browser()
    
    x[['to']] <- paste0(x[['to']], ".")

    x <- arrange(x, from, to)
    nodes <- data_frame(
        name = c(unique(x[[c('from')]]), unique(x[[c('to')]])),
        id = seq_along(name) - 1
    )
    
    edges <- x %>%
        left_join(nodes, by = c('from' = 'name')) %>%
        rename(source = id) %>%
        left_join(nodes, by = c('to' = 'name')) %>%
        rename(target = id, value = n) %>%
        select(source, target, value)
    
    list(nodes, edges)
    
}, netobsformedges, netobsformnodes)


readr::write_rds(sankeydat, 'C:/Users/Tyler/Desktop/sankey.rds')

