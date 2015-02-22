#!/bin/bash

RUNTIME=$WORKAROUND_CPP_BASE/Deployment/$TARGET
mkdir -p $RUNTIME

cd $RUNTIME
for f in $(cat $WORKAROUND_BASE/config/DEPLOYMENT.TXT)
do 
	src=$(echo $f|cut -d: -f1)
	src=${src/\$TARGET/$TARGET}
	dst=$(echo $f|cut -d: -f2)

	echo $src
			
	if [[ "$dst" == "." ]]
	then
		rm -f $(basename $src)
	else
		rm -rf $dst
	fi
	ln -s $WORKAROUND_CPP_BASE/$src $dst
done
