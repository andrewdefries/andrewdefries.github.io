library("knitr")

#knit("1-_methylethyl_D-ala.Rmd")
#markdownToHTML('1-_methylethyl_D-ala.md', '1-_methylethyl_D-ala.html', options=c("use_xhml"))
#system("pandoc -s 1-_methylethyl_D-ala.html -o 1-_methylethyl_D-ala.pdf")


knitr::knit2html('1-_methylethyl_D-ala.Rmd', "html_document")
