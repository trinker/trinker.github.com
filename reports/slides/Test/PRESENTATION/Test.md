% reports package
% Tyler Rinker
% 2-19-13




# Purpose
reports is a package that assists in writing apa6 style reports
and presentations.  The package is designed to be used with RStudio,
MikTex, knitr and Pandoc. 

# reports Will Make You...
- Efficient    
- Organized    
- Consistent     
- Happy    

# Getting Started
**Download:**    
* RStudio - [http://www.rstudio.com/](http://www.rstudio.com/)    
* MikTex - [http://miktex.org/](http://miktex.org/)    
* Pandoc - [http://johnmacfarlane.net/pandoc/](http://johnmacfarlane.net/pandoc/)     
* knitr - [http://yihui.name/knitr/](http://yihui.name/knitr/)   

`install.packages("knitr")`


# Installation
[https://github.com/trinker/reports](https://github.com/trinker/reports)    

```r
library(devtools)
install_github("reports", "trinker")
```


**note- The user may need to install [qdap](http://cran.r-project.org/web/packages/qdap/index.html) before installing.*

# Set Up .Rprofile
The user can add these options to their .Rprofile:   
`options(bib.loc = "C:/Users/trinker/Desktop/PhD Program/MASTER.bib")` 

`options(name_reports = "Tyler Rinker\\\\University at Buffalo\\\\Department of Learning and Instruction")`    


# Create Report/Paper Project
Now the user is ready to generate a new report/paper project.  Use:    

```r
setwd(desired.location)
new_project("NEW")
```


# Get Started!

[Quick Start Slides](https://dl.dropbox.com/u/61803503/report_directory_guide.pdf)
