---
layout: post
title: "Gradient-Word-Clouds"
description: ""
category: Blah
tags: [blah]
---
{% include JB/setup %}

Gradient Word Clouds
========================================================

I like word clouds because they are visually appealing and provide a ton of information in a small space.  Ever since I saw Drew Conway's post [(LINK)](http://www.drewconway.com/zia/?p=2624) I have been looking for ways to improve word clouds.  One of the nice feature's of Drew's post was that he colored the words according to the gradient.  Unfortunately, Drew's cloud lacks some of the aesthetic wow factor that Ian Fellow's `wordcloud` package is known for.

This post is going to show you how to color words with a gradient based on degree of usage between two individuals.  For me it's going to help me learn the following things:

1. How to use `knitr` + markdown to make a blog post (I've been using `knitr` for reproducible latex/beamer reports.
2. How to use gradients in base (i.e. outside of `ggplot2` that I've come to depend on).
3. How to make a gradient color bar in base.

Installing and Loading qdap and wordcloud
-------------------------
First you'll need some packages to get started.  I'm using my own beta package `qdap` plus Fellow's `wordcloud` packages.  If you download `qdap` `wordcloud` is part of the install.  For the legend we'll be using the `plotrix` package.


{% highlight r %}
# install.packages('devtools')
library(devtools)
# If the newest version of qdap isn't installed...  install_github('qdap',
# 'trinker')
library(wordcloud)
library(qdap)
library(plotrix)
{% endhighlight %}





Reading in data
-------------------------
Now we'll need some data.  I happen to have presidential debate data (debate # 1) left over that we can still mine.Kn

{% highlight r %}
# download transcript of the debate to working directory
url_dl(pres.deb1.docx)

# load multiple files with read transcript and assign to working directory
dat1 <- read.transcript("pres.deb1.docx", c("person", "dialogue"))

# qprep for quick cleaning
dat1$dialogue <- qprep(dat1$dialogue)

# view a truncated version of the data (see also htruncdf)
left.just(htruncdf(dat1, 10, 45))
{% endhighlight %}



{% highlight text %}
   person dialogue                                     
1  LEHRER We'll talk about specifically about health ca
2  ROMNEY What I support is no change for current retir
3  LEHRER And what about the vouchers?                 
4  ROMNEY So that's that's number one. Number two is fo
5  OBAMA  Jim, if I if I can just respond very quickly,
6  LEHRER Talk about that in a minute.                 
7  OBAMA  but but but overall.                         
8  LEHRER OK.                                          
9  OBAMA  And so...                                    
10 ROMNEY That's that's a big topic. Can we can we stay
{% endhighlight %}


Setting Up the Data
-------------------------
1. Make a word frequency matrix 
2. Remove Lehrer's words
3. Scale the word usage
4. Create a binned fill variable

{% highlight r %}
word.freq <- with(dat1, wfdf(dialogue, person))[, -2]
csums <- colSums(word.freq[, -1])
conv.fact <- csums[2]/csums[1]
word.freq$ROMNEY2 <- word.freq[, "ROMNEY"] * conv.fact
# colSums(word.freq[, -1])
word.freq[, "total"] <- rowSums(word.freq[, -1])
word.freq$continum <- with(word.freq, ROMNEY2 - OBAMA)
word.freq <- word.freq[word.freq$total != 0, ]  #remove Leher only words
MAX <- max(word.freq$continum[!is.infinite(word.freq$continum)])
word.freq$continum <- ifelse(is.infinite(word.freq$continum), MAX, word.freq$continum)
conv.fact2 <- abs(range(word.freq$continum))
conv.fact2 <- max(conv.fact2)/min(conv.fact2)
word.freq$continum <- ifelse(word.freq$continum > 0, word.freq$continum * conv.fact2, 
    word.freq$continum)
cuts <- c(-50, -25, -15, -10, -5, -2.5, -1.5, -1, -0.5, -0.25)
cuts <- sort(c(cuts, 0, abs(cuts)))
word.freq$fill.var <- cut(word.freq$continum, breaks = cuts)
head(word.freq, 10)
{% endhighlight %}



{% highlight text %}
        Words ROMNEY OBAMA ROMNEY2   total continum    fill.var
1           a     83    72  73.125 228.125   1.5470   (1.5,2.5]
2        aarp      0     1   0.000   1.000  -1.0000   (-1.5,-1]
3        able      6     7   5.286  18.286  -1.7138 (-2.5,-1.5]
4       about     11    11   9.691  31.691  -1.3087   (-1.5,-1]
5       above      1     0   0.881   1.881   1.2111     (1,1.5]
6     abraham      0     2   0.000   2.000  -2.0000 (-2.5,-1.5]
7  absolutely      2     2   1.762   5.762  -0.2379   (-0.25,0]
8     academy      0     1   0.000   1.000  -1.0000   (-1.5,-1]
9      accept      1     0   0.881   1.881   1.2111     (1,1.5]
10 accomplish      1     0   0.881   1.881   1.2111     (1,1.5]
{% endhighlight %}


Convert the Binned Variable to Colors
-------------------------
I was not sure how to produce gradients outside of `ggplot2` and so I asked on stackoverflow.com and received a terrific and simple answer [(LINK)](http://stackoverflow.com/questions/13353213/gradient-of-n-colors-ranging-from-color-1-and-color-2#comment18225943_13353213).  Now we'll create a color column based on the fill.var using `qdap`'s `lookup` that uses an environment to recode.


{% highlight r %}
colfunc <- colorRampPalette(c("red", "blue"))
word.freq$colors <- lookup(word.freq$fill.var, levels(word.freq$fill.var), rev(colfunc(length(levels(word.freq$fill.var)))))
head(word.freq, 10)
{% endhighlight %}



{% highlight text %}
        Words ROMNEY OBAMA ROMNEY2   total continum    fill.var  colors
1           a     83    72  73.125 228.125   1.5470   (1.5,2.5] #BB0043
2        aarp      0     1   0.000   1.000  -1.0000   (-1.5,-1] #5000AE
3        able      6     7   5.286  18.286  -1.7138 (-2.5,-1.5] #4300BB
4       about     11    11   9.691  31.691  -1.3087   (-1.5,-1] #5000AE
5       above      1     0   0.881   1.881   1.2111     (1,1.5] #AE0050
6     abraham      0     2   0.000   2.000  -2.0000 (-2.5,-1.5] #4300BB
7  absolutely      2     2   1.762   5.762  -0.2379   (-0.25,0] #780086
8     academy      0     1   0.000   1.000  -1.0000   (-1.5,-1] #5000AE
9      accept      1     0   0.881   1.881   1.2111     (1,1.5] #AE0050
10 accomplish      1     0   0.881   1.881   1.2111     (1,1.5] #AE0050
{% endhighlight %}


Plot the Word Cloud and Gradient Legend
-------------------------    
Now that we have color gradients let's use `wordcloud` to plot and `plotrix`'s `color.legend` to make a legend.

{% highlight r %}
par(mar = c(7, 1, 1, 1))
wordcloud(word.freq$Words, word.freq$total, colors = word.freq$colors, min.freq = 1, 
    ordered.colors = TRUE, random.order = FALSE, rot.per = 0, scale = c(5, 0.7))
# Add legend
COLS <- colfunc(length(levels(word.freq$fill.var)))
color.legend(0.025, 0.025, 0.25, 0.04, qcv(Romney, Obama), COLS)
{% endhighlight %}





Concluding Thoughts
-------------------------
Alright, this is my first knitr generated blog post.  Very easy.  I regret not having tried it earlier :(

I accomplished my goal of making a gradient word cloud and a gradient legend.  The actual word cloud really isn't that informative because there's too many words and too many colors.  In some situations this approach may be useful but in this one I don't like it.  Secondly, I used the blue to red theme because it plays to the political parties but in this visualization better contrasting colors would be more appropriate.  Overall I don't feel I was successful in presenting information better than Drew Conway's post.

### What the Reader Can Take Away from the Post

1. Using wordcloud's user defined color feature
2. Using qdap's `lookup` to recode
3. Creating gradients in base (easy)
4. Creating the accompanying gradient legend

*For a .txt version of this script* [-click here-](https://dl.dropbox.com/u/61803503/gradient_wordcloud.txt)

*Addendum:   
To make a knitr output upload to wordpress.com I found help from* [http://www.carlboettiger.info](http://www.carlboettiger.info/2012/02/28/knitr-with-flickr-and-wordpress.html)




