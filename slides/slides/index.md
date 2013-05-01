---
title       : reports package
subtitle    : Quick Start Guide
author      : Tyler Rinker
logo        : reports.PNG
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax, quiz, bootstrap]
mode        : selfcontained
--- dt:10



<style>
body {
  background-color: #000;
}
.quiz-option label{
  display: inline;
  font-size: 1em;
}
.refs {
  padding-left: 80px;
  text-indent: -35px;
}
</style>


## Purpose
reports (<a href="http://github.com/trinker/reports">Rinker, 2013</a>) is a package that assists in writing flexible reports
and presentations.  The package is designed to be used with RStudio,
MiKTex/TexLive/LibreOffice, Pandoc, knitr (<a href="http://www.crcpress.com/product/isbn/9781466561595">Xie, 2013</a>), slidify 
(<a href="http://ramnathv.github.com/slidify/">Vaidyanathan, 2012</a>) and knitcitations (<a href="http://CRAN.R-project.org/package=knitcitations">Boettiger, 2013</a>).  
</br> 
<div style="width:703.5px;margin:auto;">
    <p><a href="http://trinker.github.io/reports/dependencies"target="_blank"><img src="https://dl.dropboxusercontent.com/u/61803503/packages/reports.PNG" width="670" height="550"></a></p>
</div>


--- &twocol

## Why reports ##
</br>
<font size="22">reports Will Make You...</font>

*** =left
</br>
>- <font size="22" color="red">Efficient</font>
>- <font size="22" color="red">Organized</font>    
>- <font size="22" color="red">Consistent</font>     
>- <font size="22" color="red">Happy</font> 

*** =right
</br></br>
<div style="width:241.5px;margin:auto;">
    <p><img src="http://png-1.findicons.com/files/icons/350/aqua_smiles/128/fun.png" width="230" height="150"></p>
</div>



---

## Getting Started
**Download:**    
* RStudio - [http://www.rstudio.com/](http://www.rstudio.com/)       
* MiKTex - [http://miktex.org/](http://miktex.org/) or    
* TexLive - [http://www.tug.org/texlive/](http://www.tug.org/texlive/)   
* LibreOffice - [http://www.libreoffice.org/](http://www.libreoffice.org/)   
* Pandoc - [http://johnmacfarlane.net/pandoc/](http://johnmacfarlane.net/pandoc/)     
* knitr (<a href="http://www.crcpress.com/product/isbn/9781466561595">Xie, 2013</a>) - [http://yihui.name/knitr/](http://yihui.name/knitr/) 
* slidify (<a href="http://ramnathv.github.com/slidify/">Vaidyanathan, 2012</a>) - [http://ramnathv.github.io/slidify/](http://ramnathv.github.io/slidify/)   
* knitcitations (<a href="http://CRAN.R-project.org/package=knitcitations">Boettiger, 2013</a>)
<hr color="green" size="3">


```r
install.packages("reports")
```

*This will install: knitr, knitcitations & slidify too*

---

## Windows Users...

may want to use:


```r
install.packages("installr")
```


---

## Development Version Installation

<a href="https://github.com/trinker/reports"target="_blank">https://github.com/trinker/reports</a>
 


```r
library(devtools)
install_github("reports", "trinker")
```


---

## Set Up .Rprofile ##

The user can add these options to their .Rprofile       


```r
options(bib.loc = "C:/Users/trinker/Desktop/PhD Program/MASTER.bib")
options(name_reports = "Tyler Rinker\\\\University at Buffalo\\\\Department of Learning and Instruction")
options(source_reports = path.expand("~/path_1"), path.expand("~/path_2"))
options(temp_reports = "apa6.mod.qual_tex")
options(github.user = "trinker")
```



---

## Create Report/Paper Project ##
### Now the user is ready to generate a new report/paper or presentation project.  

Use:    

```r
setwd(desired.location)
new_report("NEW")

# or

presentation("NEW")
```


---

## Get Started!

<a href="https://dl.dropbox.com/u/61803503/report_directory_guide.pdf"target="_blank">Project Directory Workflow</a>

<a href="http://trinker.github.io/reports/"target="_blank">reports Functions</a>

<a href="http://trinker.github.io/reports/dependencies/"target="_blank">reports Dependencies</a>


---

<iframe class="youtube-player" type="text/html" width="640" height="360" src="http://www.youtube.com/embed/kws1PX1Dw9w?autoplay=0" frameborder="0"></iframe>

--- .refs
## References
<p>Boettiger C (2013).
<EM>knitcitations: Citations for knitr markdown files</EM>.
R package version 0.4-4, <a href="http://CRAN.R-project.org/package=knitcitations">http://CRAN.R-project.org/package=knitcitations</a>.

<p>Rinker TW (2013).
<EM>reports: Package to asssist in report writing</EM>.
University at Buffalo/SUNY, Buffalo, New York.
version 0.1.3, <a href="http://github.com/trinker/reports">http://github.com/trinker/reports</a>.

<p>Vaidyanathan R (2012).
<EM>slidify: Generate reproducible html5 slides from R markdown</EM>.
R package version 0.3.5, <a href="http://ramnathv.github.com/slidify/">http://ramnathv.github.com/slidify/</a>.

<p>Xie Y (2013).
&ldquo;knitr: A Comprehensive Tool for Reproducible Research in R.&rdquo;
In Stodden V, Leisch F and Peng RD (eds.), <EM>Implementing Reproducible Computational Research</EM>.
Chapman and Hall/CRC.
ISBN 978-1466561595, <a href="http://www.crcpress.com/product/isbn/9781466561595">http://www.crcpress.com/product/isbn/9781466561595</a>.

