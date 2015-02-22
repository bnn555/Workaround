#!/bin/bash

_P=($@)
OBJS=""

for (( i=0; i < $#; i++ ))
do
	_dir=${_P[$i]}
   for _obj in $(cat $_dir/${TARGET}/.objs_cc 2>/dev/null)
   do
      echo $_dir/$_obj
   done
done
