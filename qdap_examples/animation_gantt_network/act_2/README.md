The [combination Gantt + Dialogue Map](hhttp://trinker.github.io/qdap_examples/animation_gantt_network/act_12/) was generated via:

```
library(animation)
library(grid)
library(gridBase)
library(qdap)
library(reports)
library(igraph)

mraja2

loc <- folder(animation_gantt_network)

ani_gantt <- with(raj.act.2, gantt(dialogue, person))
ani_network <- with(raj.act.2, discourse_map(dialogue, person))
oopt <- animation::ani.options(interval = 0.1)

out <- Animate(ani_gantt)
out2 <- Animate(ani_network)

FUN <- function(follow=FALSE) {
    lapply(seq_along(out), function(i) {
        if (follow) {
            png(file=sprintf("%s/images/Rplot%s.png", loc, i), 
                width=650, height=725)
        }
        layout(matrix(c(rep(1, 9), rep(2, 4)), 13, 1, byrow = TRUE))
        par(mar=c(0, 0, 1, 0))
        set.seed(10)
        plot.igraph(out2[[i]], edge.curved=TRUE)
        mtext("Discourse Map for Romeo and Juliet: Act 2", side=3, padj=1)     
        plot.new()              
        vps <- baseViewports()
        p <- out[[i]] + theme(plot.margin = unit(c(-.75,1,.2,0), "cm")) + 
           ggtitle(NULL) + ylab("Person") + xlab(NULL)
        print(p,vp = vpStack(vps$figure,vps$plot))
        animation::ani.pause()
        if (follow) {
            dev.off()
        }
    })

}


type <- if(.Platform$OS.type == "windows") shell else system

saveHTML(FUN(), autoplay = FALSE, loop = TRUE, verbose = FALSE,
    ani.width = 650, ani.height=1000, 
    outdir = loc, single.opts =
    "'controls': ['first', 'play', 'loop', 'speed'], 'delayMin': 0")

FUN(TRUE)
```

