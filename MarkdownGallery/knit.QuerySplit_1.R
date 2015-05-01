library(knitr)
library(markdown)

knit("QuerySplit_1.Rmd")

markdownToHTML("QuerySplit_1.md", "QuerySplit_1.html", options=c("use_xhtml"))
