library("knitr")

#knit("1,1'-piperazine-1,4-.Rmd")
#markdownToHTML('1,1'-piperazine-1,4-.md', '1,1'-piperazine-1,4-.html', options=c("use_xhml"))
#system("pandoc -s 1,1'-piperazine-1,4-.html -o 1,1'-piperazine-1,4-.pdf")


knitr::knit2html('1,1'-piperazine-1,4-.Rmd', "html_document")
