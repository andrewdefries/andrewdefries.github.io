library(knitr)

knit("$namergl.Rmd")
markdownToHTML('$namergl.md', '$namergl.html', options=c("use_xhml"))
system("pandoc -s $namerlg.html -o $namergl.pdf")


