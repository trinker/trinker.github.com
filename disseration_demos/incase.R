# Mouse Over Gantt Plot

```{r, fig.width =8, fig.height = 3}
g <- rinker_observations %>% 
    ungroup() %>%
    filter(Observation == 1 ) %>%
    filter(Person != 'Students' & !is.na(Word_Count) & !is.na(Dialogue)) %>% # nrow()
    mutate(Endmark = stringi::stri_extract_first_regex(Dialogue, "[?.!]$") %>% unlist()) %>%
    select(Person, Endmark, Word_Count, Dialogue) %>%
    tbl_df() %>%
    na.omit() %>%
    mutate(
        start = starts(Word_Count),
        end = ends(Word_Count),
        start = ifelse(Word_Count < 25, start -15, start),
        end = ifelse(Word_Count < 25, end + 15, end),
        Dialogue = gsub("'", "`", Dialogue),
        Endmark = ifelse(is.na(Endmark), "NULL", Endmark)
    ) %>% #View()
    ggplot(aes(x = start,  y = Person, xend = end, yend = Person, color = Endmark) ) + 
        theme_minimal() + 
        geom_segment_interactive(aes(tooltip = Dialogue), size = 7) +
        ylab(NULL) +
        xlab("Duration (Words)") +
        scale_color_manual(values = c('red', 'grey60', 'blue'))

ggiraph(code = print(g), width = 1, hover_css = "cursor:pointer;fill:red;stroke:red;", width_svg = 8, height_svg = 3)
```
`r gantt`



