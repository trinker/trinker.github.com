The [Polarity Analysis Plot](http://trinker.github.io/qdap_examples/animation_polarity/pres_debates/debate_2_extended) was generated via:

```
library(animation)
library(grid)
library(gridBase)
library(qdap)
library(reports)
library(igraph)
library(plotrix)
library(gplots)

deb2dat <- subset(pres_debates2012, time=="time 2")
deb2dat[, "person"] <- factor(deb2dat[, "person"])
(deb2 <- with(deb2dat, polarity(dialogue, person)))

## Set up the network version
bg_black <- Animate(deb2, neutral="white", current.speaker.color="grey70")
bgb <- vertex_apply(bg_black, label.color="grey80", size=30, label.size=22,
    color="grey40")
bgb <- edge_apply(bgb, label.color="yellow")

## Set up the bar version
deb2_bar <- Animate(deb2, as.network=FALSE)

## Set up the line version
deb2_line <- plot(cumulative(deb2_bar))

## Generate a folder
loc3 <- folder(animation_polarity3)

## Set up the plotting function
oopt <- animation::ani.options(interval = 0.1)


## Helper function to cbind ggplots
cbinder <- function(x, y){

    uns_x <- unit(c(-1.3,.15,-.75,.25), "cm")
    uns_y <- unit(c(-1.3,.5,-.75,.15), "cm")

    x <- x + theme(plot.margin = uns_x,
        text=element_text(color="white"),
        plot.background = element_rect(fill = "black",
        color="black")
    )

    y <- y + theme(plot.margin = uns_y,
        text=element_text(color="white"),
        plot.background = element_rect(fill = "black", 
        color="black")
    )

    plots <- list(x, y)
    grobs <- list()
    heights <- list()
    
    for (i in 1:length(plots)){
        grobs[[i]] <- ggplotGrob(plots[[i]])
        heights[[i]] <- grobs[[i]]$heights[2:5]
    }
    
    maxheight <- do.call(grid::unit.pmax, heights)
    
    for (i in 1:length(grobs)){
         grobs[[i]]$heights[2:5] <- as.list(maxheight)
    }
    
    do.call("arrangeGrob", c(grobs, ncol = 2))
}

## Combine bar and line plots into 1 plot
deb2_combo <- Map(cbinder, deb2_bar, deb2_line)

FUN3 <- function(follow=FALSE, theseq = seq_along(bgb)) {

    Title <- "Animated Polarity: 2012 Presidential Debate 2"
    Legend <- c(.2, -1.075, 1.5, -1.005)
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
        set.seed(20)
        plot.igraph(bgb[[i]], edge.curved=TRUE)
        mtext(Title, side=3, col="white")
        color.legend(Legend[1], Legend[2], Legend[3], Legend[4],
              c("Negative", "Neutral", "Positive"), attributes(bgb)[["legend"]],
              cex = Legend.cex, col="white")

        ## Plot2
        plot.new()
        vps <- baseViewports()
        p <- deb2_combo[[i]]
        print(p,vp = vpStack(vps$figure,vps$plot))
        animation::ani.pause()

        if (follow) {
            dev.off()
        }
    })
}

FUN3()

type <- if(.Platform$OS.type == "windows") shell else system

saveHTML(FUN3(), autoplay = FALSE, loop = TRUE, verbose = FALSE,
    ani.height = 1000, ani.width=650,
    outdir = loc3, single.opts =
    "'controls': ['first', 'play', 'loop', 'speed'], 'delayMin': 0")

FUN3(TRUE)

```

