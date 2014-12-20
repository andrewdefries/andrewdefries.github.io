
for i in *.xyz

do

echo "working on $i"

name=(`echo $i | sed 's/.xyz//g'`)

echo "running $name R script"
 
cat testrgl.R | sed "s/testrgl/$name/g" > $name.R

echo "making $name Rmd file"

cat testrgl.Rmd | sed "s/data/$name/g" >  $name.Rmd

echo "finishing $name Rmd file"

cat $name.Rmd | sed 's/^/printf/g' | sed 's/$/\\n/g' >  $name.Rmd

echo "executing $name.R"


R CMD BATCH $name.R

done
