The [Gantt Sentence Type](http://trinker.github.io/qdap_examples/gantt_sent_type) was generated via:

```
library(animation)
library(grid)
library(gridBase)
library(qdap)
library(reports)
library(igraph)

loc <- folder(gantt_sent_type)

dat <- rajSPLIT[rajSPLIT$act == 1, ]
dat$end_mark <- factor(end_mark(dat$dialogue))

ani_gantt <- with(dat, gantt_plot(text.var = dialogue, 
    grouping.var = list(person, sex), fill.var=end_mark))

out <- Animate(ani_gantt)

FUN <- function() {
    lapply(out, function(x) {
        print(x)
    })
}


type <- if(.Platform$OS.type == "windows") shell else system

saveHTML(FUN(), autoplay = FALSE, loop = TRUE, verbose = FALSE,
    ani.width = 650, ani.height=425, 
    outdir = loc, single.opts =
    "'controls': ['first', 'play', 'loop', 'speed'], 'delayMin': 0")

FUN(TRUE)
```

