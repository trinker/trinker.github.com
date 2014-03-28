The [Gantt Sentence Type](http://trinker.github.io/qdap_examples/gantt_sent_type) was generated via:

```
library(animation)
library(qdap)

loc <- folder(by_sent_type)

dat <- rajSPLIT[rajSPLIT$act == 1, ]
dat$end_mark <- factor(end_mark(dat$dialogue))

ani_gantt <- with(dat, gantt_plot(text.var = dialogue, 
    grouping.var = list(person, sex), fill.var=end_mark), plot=FALSE) +
    ggtitle("Sentence Type for Romeo and Juliet: Act 1")

out <- Animate(ani_gantt, colors=qcv(red, grey90, blue, orange))

FUN <- function() {
    lapply(out, function(x) {
        print(x)
    })
}


type <- if(.Platform$OS.type == "windows") shell else system

saveHTML(FUN(), autoplay = FALSE, loop = TRUE, verbose = FALSE,
    ani.width = 850, ani.height=350,
    outdir = loc, single.opts =
    "'controls': ['first', 'play', 'loop', 'speed'], 'delayMin': 0")
```

