MakePost <- function(title){
    require(lubridate)
    title <- gsub("[[:space:]]+", "-", title)
    oldwd <- getwd()
    
    # TODO: Change this to where Rmd is on your local folder
    setwd("C:/Users/trinker/GitHub/trinker.github.com/Rmd")
    filename <- paste0(today(), "-", title, ".Rmd")
    outtext <- paste(gsub("default", title, readLines("default.txt")), collapse="\n")
    cat(outtext, file = filename)
    setwd(oldwd)
}

KnitPost <- function(input, base.url = "/") {
    require(knitr)
    require(lubridate)
    
    opts_knit$set(base.url = base.url)
    in.file <- sub(".Rmd$", "", basename(input))
    fig.path <- paste0("../figs/", in.file, "/")
    opts_chunk$set(fig.path = fig.path)
    opts_chunk$set(fig.cap = "center")
    opts_chunk$set(dev = "bmp")
    opts_chunk$set(dev.args=list(bg="red"))
    
    render_jekyll()
    out.file <- paste0("C:/Users/trinker/GitHub/trinker.github.com/_posts/", in.file, ".md")
    
    knit(input, output = out.file, envir = parent.frame())
}

# TODO: Change this to where Rmd is on your local folder
setwd("C:/Users/trinker/GitHub/trinker.github.com/Rmd/")