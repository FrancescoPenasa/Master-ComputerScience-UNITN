#!/bin/bash


local_dir=$(pwd)
for d in $(find $local_dir -maxdepth 1 -type d)
do
	cd $d 
	echo "removed in $d"
	echo $(rm *.synctex.gz)
	echo $(rm *.log)
	echo $(rm *.aux)
	echo "\n"
done >output_file