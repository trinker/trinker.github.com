% Quick Start Guide: reports package
% Tyler Rinker
% 2-19-13




# Purpose
reports (Rinker, 2013) is a package that assists in writing flexible reports
and presentations.  The package is designed to be used with RStudio,
MiKTex/TexLive/LibreOffice, knitr and Pandoc. 
![](https://dl.dropbox.com/u/61803503/packages/reports.JPG)

# reports Will Make You...
- Efficient    
- Organized    
- Consistent     
- Happy    

# Getting Started
**Download:**    
* RStudio - [http://www.rstudio.com/](http://www.rstudio.com/)       
* MiKTex - [http://miktex.org/](http://miktex.org/) or    
* TexLive - [http://www.tug.org/texlive/](http://www.tug.org/texlive/)   
* LibreOffice - [http://www.libreoffice.org/](http://www.libreoffice.org/)   
* Pandoc - [http://johnmacfarlane.net/pandoc/](http://johnmacfarlane.net/pandoc/)     
* knitr (Xie, 2013) - [http://yihui.name/knitr/](http://yihui.name/knitr/)     
* knitcitations (Boettiger, 2013) 

[[[`install.packages("reports", "knitr", "knitcitations")`]]]=hi


# Windows Users...

may want to use:


```r
install.packages("installr")
```



# Development Version Installation
[https://github.com/trinker/reports](https://github.com/trinker/reports)    

```r
library(devtools)
install_github("reports", "trinker")
```


# Set Up .Rprofile
The user can add these options to their .Rprofile:   

[[[`options(bib.loc = "C:/Users/trinker/Desktop/PhD Program/MASTER.bib")`]]]=hi            
[[[`options(name_reports = "Tyler Rinker\\\\University at Buffalo\\\\Department of Learning and Instruction)`]]]=hi       
[[[`options(source_reports = path.expand("~/path_1"), path.expand("~/path_2"))`]]]=hi     
[[[`options(temp_reports = "apa6.mod.qual_tex")`]]]=hi    
[[[`options(github.user = "trinker")`]]]=hi    

# Create Report/Paper Project
Now the user is ready to generate a new report/paper project.  Use:    

```r
setwd(desired.location)
new_project("NEW")
```


# Get Started!

[Project Directory Workflow](https://dl.dropbox.com/u/61803503/report_directory_guide.pdf)    

# 
[[[kws1PX1Dw9w]]]=yt

# References
<p>Boettiger C (2013).
<EM>knitcitations: Citations for knitr markdown files</EM>.
R package version 0.3-3, <a href="http://CRAN.R-project.org/package=knitcitations">http://CRAN.R-project.org/package=knitcitations</a>.

<p>Rinker TW (2013).
<EM>reports: Package to asssist in report writing</EM>.
University at Buffalo/SUNY, Buffalo, New York.
version 0.1.0, <a href="http://github.com/trinker/reports">http://github.com/trinker/reports</a>.

<p>Xie Y (2013).
<EM>knitr: A general-purpose package for dynamic report generation in R</EM>.
R package version 1.1, <a href="http://yihui.name/knitr/">http://yihui.name/knitr/</a>.


