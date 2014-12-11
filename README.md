andrewdefries.github.io
=======================

This is a home base for several cheminformatics projects hosted in my public github. I have a PhD in chemical genetics so it is my practice to model biological systems as circuits of biological pathways and biomolecules. For some time I have been pre-occupied with the question of what it means for something to be called a pesticide. To this end I have performed a wide scale analysis of [pesticides used in the state of California from 1991-2011](https://github.com/andrewdefries/CA_Pesticides_1991_2011 "CA_Pesticides_1991_2011 Github!") using annotation information from the [FDA pesticide glossary](https://github.com/andrewdefries/FDA_Pesticide_Glossary "FDA_Pesticide_Glossary Github!") and the [DrugBank database](http://www.drugbank.ca/downloads#structures "DrugBank.ca Structure Download").

Cleaning unstructured data
==========================
The FDA and CA pesticide data sources were from unstructured PDF files and were "cleaned" using Unix command line tools and regex available with Ubuntu BASH.

```
sed 's/foo/bar/g'
sed 's/foo/bar/d'
cut -d "$delimeter" -f$range
```

![unstructured PDF files](https://github.com/andrewdefries/andrewdefries.github.io/blob/master/Images/FDA_and_CA_Pesticides_UnstructuredText.png "Representative view of original source material")



Before we jump into a big data report let us take a step back to address two questions. The first question we must consider, "how it is possible for small molecules and pesticides to have relevance to our health and well-being?". The second, "how is it possible to do chemistry in the computer?".

Small molecules and Risk
========================

Let us consider, for a moment, how our health may be adversely impacted by environment, occupation, and lifestyle. As the idiom goes, ["you are what you eat"](https://github.com/andrewdefries/YAWYE "YAWYE Github!"). We should amend the idiom to say, "you are what you eat, and breath", and also consider lifestyle choices that have a high chance of triggering a disease state. Here, for several reasons, we refine our consideration for small molecule agents that may contaminate the air, food, and water we consume. A report of the pesticides found in adult and baby food will be released soon.  


![Small molecules and Risk](https://github.com/andrewdefries/andrewdefries.github.io/blob/master/Images/SmallMoleculesAndRisk.png "Let us consider the big picture of small problems")

Cheminformatics Brief Intro
=============================

In the field of cheminformatics structural information of small molecules is used to make a create several forms of representation for downstream use in computational pipelines. The goal is to determine biological pathways where a particular small molecule is of therapeutic or research importance (cite). This fantastic feat is possible as we have inherited an immensity of data from the field of medicine and specifically genomics. Currently, as a public, we are sitting on this data or ignoring it. 

![Cheminformatics Brief](https://github.com/andrewdefries/andrewdefries.github.io/blob/master/Images/CheminformaticsOverview_01.png)


Therefore it is my attempt, here, to tie a couple of pieces of data together to gain understanding and answer, "what is a pesticide?".

Visualizing Chemical Space with RGL
==============================

To simplify our examination of thousands of chemicals we can create visual representations based on chemical differences in a 3D axis. RGL a popular package in R makes this quite easy. The graphs are also available as static images or as a webGL canvas.

![Chemical Space with RGL](https://github.com/andrewdefries/andrewdefries.github.io/blob/master/Images/ChemicalSpaceRGL.png)

Visualizing Nearest Neighbors in large tables
=============================================

Sometimes the best way to view relationships is in a table. Therefore, the Tanimoto similarity relationships of small molecules in the dataset have been calculated and used to embed compounds into html tables for quick browsing. Soon images will be clickable and lead to annotated compound homepages.

![Nearest neighbor tables](https://github.com/andrewdefries/andrewdefries.github.io/blob/master/Images/CheminformaticsHwriter.png)

Chemical Reports in Latex with mol2chemfig
==========================================

A report is not complete without the ability to write a PDF document. To use chemical structures in our reports an open source workflow is available using the Latex package mol2chemfig that converts smiles to tikz drawings.

![Chemical Reports mol2chemfig](https://github.com/andrewdefries/andrewdefries.github.io/blob/master/Images/CheminformaticsMol2chemfig.png)
HTML Gallery
=============
To view the html gallery of the projects click below:

http://andrewdefries.github.io/


