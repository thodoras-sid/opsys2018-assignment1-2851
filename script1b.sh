#!/bin/bash
  
 myfaction(){ 

 ONOMA=($(echo "$x" | md5sum))
  	
 PERIEXOMENO=($(curl -s $x | md5sum))
  
 if [ -f "$ONOMA" ]; then
   PALIOPERIEXOMENO=$(cat "$ONOMA")
    
   if [ $PALIOPERIEXOMENO != "$PERIEXOMENO" ]; then
      echo "$PERIEXOMENO" > $ONOMA
      echo "$x"
   fi
 else
   echo "$x INIT"
   touch $ONOMA
   echo "$PERIEXOMENO" > $ONOMA
 fi

 }

 for x in $(cat $1 | grep ^https*);do myfaction $x &
 done
 wait
