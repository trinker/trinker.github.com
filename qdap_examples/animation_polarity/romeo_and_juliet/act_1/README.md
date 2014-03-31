The [Polarity Analysis Plot](http://trinker.github.io/qdap_examples/animation_polarity/romeo_and_juliet/act_1) was generated via:

```
library(animation)
library(grid)
library(gridBase)
library(qdap)
library(reports)
library(igraph)
library(plotrix)

(raj1<- with(mraja1spl, polarity(dialogue, person)))

## Set up the network version
bg_black <- Animate(raj1, neutral="white", current.speaker.color="grey70")
bgb <- vertex_apply(bg_black, label.color="grey80", size=15, label.size=22,
    color="grey40")
bgb <- edge_apply(bgb, label.color="yellow")

## Set up the bar version
raj1_bar <- Animate(raj1, as.network=FALSE)

## Generate a folder
loc3 <- folder(animation_polarity3)

## Set up the plotting function
oopt <- animation::ani.options(interval = 0.1)


FUN3 <- function(follow=FALSE, theseq = seq_along(bgb), seed=10) {

    Title <- "Animated Polarity: Romeo and Juliet Act 1"
    Legend <- c(-1.3, -1, -.2, -.95)
    Legend.cex <- 1

    lapply(theseq, function(i) {
        if (follow) {
            png(file=sprintf("%s/images/Rplot%s.png", loc3, i), 
                width=650, height=725)
        }
        ## Set up the layout
        layout(matrix(c(rep(1, 9), rep(2, 4)), 13, 1, byrow = TRUE))

        ## Plot 1
        par(mar=c(2, 0, 2, 0), bg="black")
        #par(mar=c(2, 0, 2, 0))
        set.seed(seed)
        plot.igraph(bgb[[i]], edge.curved=TRUE)
        mtext(Title, side=3, col="white")

        color.legend(Legend[1], Legend[2], Legend[3], Legend[4],
              c("Negative", "Neutral", "Positive"), attributes(bgb)[["legend"]],
              cex = Legend.cex, col="white")

        ## Plot2
        plot.new()              
        vps <- baseViewports()

        uns <- unit(c(-1.3,.5,-.75,.25), "cm")
        p <- raj1_bar[[i]] + 
            theme(plot.margin = uns,
                text=element_text(color="white"),
                plot.background = element_rect(fill = "black", 
                    color="black")) 
        print(p,vp = vpStack(vps$figure,vps$plot))
        animation::ani.pause()

        if (follow) {
            dev.off()
        }
    })

}


## Detect OS
type <- if(.Platform$OS.type == "windows") shell else system

saveHTML(FUN3(), autoplay = FALSE, loop = TRUE, verbose = FALSE,
    ani.height = 1000, ani.width=650,
    outdir = loc3, single.opts =
    "'controls': ['first', 'play', 'loop', 'speed'], 'delayMin': 0")

FUN3(TRUE, seed=83)
```

