library("knitr")

#knit("1,3-dichloropropene_.Rmd")
#markdownToHTML('1,3-dichloropropene_.md', '1,3-dichloropropene_.html', options=c("use_xhml"))
#system("pandoc -s 1,3-dichloropropene_.html -o 1,3-dichloropropene_.pdf")


knitr::knit2html('1,3-dichloropropene_.Rmd', "html_document")
