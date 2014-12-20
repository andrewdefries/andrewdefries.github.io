printf---\n
printfoutput:\n
printf  html_document:\n
printf    self_contained: no\n
printf---\n
printf```{r setup, results='asis'}\n
printflibrary(knitr)\n
printfknit_hooks$set(webgl = hook_webgl)\n
printfcat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')\n
printf```\n
printf\n
printfThis works fine.\n
printf\n
printf```{r testgl, webgl=TRUE}\n
printfx <- sort(rnorm(1000))\n
printfy <- rnorm(1000)\n
printfz <- rnorm(1000) + atan2(x,y)\n
printfplot3d(x, y, z, col=rainbow(1000))\n
printf```\n
printf\n
printfThe following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.\n
printf\n
printf```{r testgl2, webgl=TRUE}\n
printfopen3d()\n
printf4-amino-N-(1,1-dimet<-read.table("4-amino-N-(1,1-dimet.xyz")\n
printfx<-4-amino-N-(1,1-dimet$V2\n
printfy<-4-amino-N-(1,1-dimet$V3\n
printfz<-4-amino-N-(1,1-dimet$V4\n
printfatomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))\n
printf#spheres3d(x, y, z, col=rainbow(1000))\n
printfspheres3d(x, y, z, col=atomcolor)\n
printf```\n
