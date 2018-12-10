#!/bin/bash 

tar xf  $1 

mkdir assignments
 
for x in $(find . -type f -name "*.txt");do
  
 dieuthinsh=$(cat $x | grep ^https* | head -n 1)
 echo "$dieuthinsh" >> dieuthinseis2
 
done

for x in $(cat dieuthinseis2 | grep ^https*);do
 git clone -q "$x" 

 if [ $? -eq 0 ];then

  echo "$x : Clonig OK"

 else

  echo "$x : Clonig FAILED"
 
 fi

 onoma=$(basename -s .git "$x")

 mv $onoma assignments

done 




