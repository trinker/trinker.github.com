The [Lexical Content Classification Rate](http://trinker.github.io/qdap_examples/animation_lexical_classification) was generated via:

```
library(animation)
library(grid)
library(gridBase)
library(qdap)
library(reports)
library(igraph)
library(plotrix)

lex_ani2 <- lexical_classification(mraja1spl$dialogue, mraja1spl$person)

## Set up the network version
lex_net <- Animate(lex_ani2, contextual="white", lexal="blue",
    current.color = "yellow", current.speaker.color="grey70")
bgb <- vertex_apply(lex_net, label.color="grey80", size=17, color="grey40")
bgb <- edge_apply(bgb, label.color="yellow")


## Set up the bar version
lex_bar <- Animate(lex_ani2, type="bar")

## Set up the text
lex_text <- Animate(lex_ani2, type="text", size = 3, width=125, color="white")

## Generate a folder
loc <- reports::folder(animation_lexical_classification)
setwd(loc)

## Set up the plotting function
oopt <- animation::ani.options(interval = 0.1)


lex_text_bar <- Map(function(x, y){

    uns <- unit(c(-1.6,.5,-.2,.25), "cm")

    x <- x +
        theme(plot.margin = uns,
            text=element_text(color="white"),
            legend.text=element_text(color="white"),
            legend.background = element_rect(fill = "black"),
            panel.border = element_rect(color = "black"),
            panel.background = element_rect(fill = "black"),
            plot.background = element_rect(fill = "black",
                color="black"))

    uns2 <- unit(c(-.5,.5,-.45,.25), "cm")

    y <- y +
        theme(plot.margin = uns2,
            text=element_text(color="white"),
            legend.text=element_text(color="white"),
            legend.background = element_rect(fill = "black"),
            plot.background = element_rect(fill = "black",
                color="black"))

    gA <- ggplotGrob(x)
    gB <- ggplotGrob(y)
    maxWidth <- grid::unit.pmax(gA$widths[2:5], gB$widths[2:5])
    gA$widths[2:5] <- as.list(maxWidth)
    gB$widths[2:5] <- as.list(maxWidth)
    out <- arrangeGrob(gA, gB, ncol=1, heights = c(.3, .70))
    ## grid.draw(out)
    invisible(out)

}, lex_text, lex_bar)


FUN <- function(follow=FALSE, theseq = seq_along(bgb)) {

    Title <- "Animated Content Rate: Romeo and Juliet Act 1"
    Legend <- c(.2, -1, 1.5, -.95)
    Legend.cex <- 1

    lapply(theseq, function(i) {
        if (follow) {
            png(file=sprintf("%s/images/Rplot%s.png", loc, i),
                width=750, height=875)
        }
        ## Set up the layout
        layout(matrix(c(rep(1, 7), rep(2, 6)), 13, 1, byrow = TRUE))

        ## Plot 1
        par(mar=c(2, 0, 2, 0), bg="black")
        #par(mar=c(2, 0, 2, 0))
        set.seed(22)
        plot.igraph(bgb[[i]], edge.curved=TRUE)
        mtext(Title, side=3, col="white")
        color.legend(Legend[1], Legend[2], Legend[3], Legend[4],
              c("Functional", "Content"), attributes(bgb)[["legend"]],
              cex = Legend.cex, col="white")

        ## Plot2
        plot.new()
        vps <- baseViewports()

        print(lex_text_bar[[i]], vp = vpStack(vps$figure,vps$plot))
        animation::ani.pause()

        animation::ani.pause()

        if (follow) {
            dev.off()
        }
    })

}

## Detect OS
type <- if(.Platform$OS.type == "windows") shell else system


saveHTML(FUN(), autoplay = FALSE, loop = TRUE, verbose = FALSE,
    ani.height = 1000, ani.width=750,
    outdir = loc, single.opts =
    "'controls': ['first', 'previous', 'play', 'next', 'last', 'loop', 'speed'], 'delayMin': 0")

FUN(TRUE)
```

