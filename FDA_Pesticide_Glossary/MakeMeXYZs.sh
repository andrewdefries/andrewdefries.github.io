for i in *.sdf

do

echo "###################################"

echo "doing $i"

name=(`echo $i | sed 's/.sdf//g'`)

babel $name -O $name.xyz 

echo "did $i"

echo "nekone"


echo "###################################"


done
