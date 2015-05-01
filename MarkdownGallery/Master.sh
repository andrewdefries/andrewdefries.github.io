babel Query.sdf QuerySplit_.sdf -m

Do=(`ls QuerySplit_*.sdf`)

for i in "${Do[@]}" 
	do
	name=(`echo $i | sed 's/.sdf//g'`)
	echo "making $i xyz coords"
	babel $i -O $name.xyz --gen3D
	babel $i -O $name.png
	cat $name.xyz | sed '1d' | sed '1d' > tmp
	mv tmp $name.xyz
#	mywd=(`pwd`)
#	cat testrgl.Rmd | sed "s/myquery/$name/g" | sed "s/mywd/$mywd/g" > $name.Rmd
	sdfid=(`head -n 1 Query.sdf`)
	cat testrgl.Rmd | sed "s/myquery/$name/g" | sed "s/mywd/\/home\/cheminfused\/Desktop\/andrewdefries.github.io\/MarkdownGallery/g" | sed "s/Query/$sdfid/g" > $name.Rmd
	cat testrgl.R | sed "s/myquery/$name/g" > knit.$name.R
	echo "kniting $name report"
	R CMD BATCH knit.$name.R 
	done
