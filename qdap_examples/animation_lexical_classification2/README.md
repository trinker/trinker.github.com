The [Animated Lexical Classification (Trend Line + Text + Bar Plot): Romeo and Juliet Act 1](http://trinker.github.io/qdap_examples/animation_lexical_classification2) was generated via:

```
## Generate a folder
loc2 <- reports::folder(animation_lexical_classification2)
setwd(loc2)

lex_ani2 <- lexical_classification(mraja1spl$dialogue, mraja1spl$person)

## Set up the bar version
lex_bar <- Animate(lex_ani2, type="bar")
cumline <- cumulative(lex_bar)
lex_line <- plot(cumline)
ylims <- range(cumline[[1]][-c(1:100)]) + c(-.1, .1)

## Set up the text
lex_text <- Animate(lex_ani2, type="text", size = 4, width = 80)


lex_line_text_bar <- Map(function(x, y, z){

    mar <- theme(plot.margin = unit(c(0, .5, 0, .25), "cm"))

    gA <- ggplotGrob(x + mar + 
        theme(panel.background = element_rect(fill = NA, colour = NA), 
            panel.border = element_rect(fill = NA, colour = NA),
            plot.background = element_rect(fill = NA, colour = NA)))
    gB <- ggplotGrob(y + mar)
    gC <- ggplotGrob(z + mar + ylab("Average Content Rate") + 
        coord_cartesian(ylim = ylims) +
        ggtitle("Average Content Rate: Romeo & Juliet Act 1"))

    maxWidth <- grid::unit.pmax(gA$widths[2:5], gB$widths[2:5], gC$widths[2:5])
    gA$widths[2:5] <- as.list(maxWidth)
    gB$widths[2:5] <- as.list(maxWidth)
    gC$widths[2:5] <- as.list(maxWidth)
    out <- arrangeGrob(gC, gA, gB, ncol=1, heights = c(.38, .25, .37))
    ## grid.draw(out)
    invisible(out)

}, lex_text, lex_bar, lex_line)


FUN <- function(follow=FALSE, theseq = seq_along(lex_line_text_bar)) {


    lapply(theseq, function(i) {
        if (follow) {
            png(file=sprintf("%s/images/Rplot%s.png", loc2, i),
                width=750, height=875)
        }
 
        print(lex_line_text_bar[[i]])
        animation::ani.pause()

        if (follow) {
            dev.off()
        }
    })

}

FUN()

## Detect OS
type <- if(.Platform$OS.type == "windows") shell else system

library(animation)
saveHTML(FUN(), autoplay = FALSE, loop = TRUE, verbose = FALSE,
    ani.height = 1000, ani.width=750,
    outdir = loc2, single.opts =
    "'controls': ['first', 'previous', 'play', 'next', 'last', 'loop', 'speed'], 'delayMin': 0")

FUN(TRUE)
```

