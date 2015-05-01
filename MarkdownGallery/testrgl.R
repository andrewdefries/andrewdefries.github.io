library(knitr)
library(markdown)

knit("myquery.Rmd")

markdownToHTML("myquery.md", "myquery.html", options=c("use_xhtml"))
