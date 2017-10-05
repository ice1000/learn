for i in `ls` ;
do
    if [[ $i == *$1 ]] ;
    then
	echo $i
    fi
done
