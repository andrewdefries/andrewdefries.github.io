babel Query.sdf QuerySplit_.sdf -m

Do=(`ls QuerySplit_*.sdf`)

for i in "${Do[@]}" 
	do
	name=(`echo $i | sed 's/.sdf//g'`)
	echo "making $i xyz coords"
	babel $i -O $name.xyz
	cat testrgl.Rmd | sed "s/myquery/$name/g" > $name.Rmd
	cat testrgl.R | sed "s/myquery/$name/g" > knit.$name.R
	echo "kniting $name report"
	R CMD BATCH knit.$name.R 
	done
