## ASSIGNMENT-02UNIX 
## Write a unix shell script to merge all files into one file.
## Merged files must have only 1 header.

#!/bin/sh

## Getting month_

curr_month=$(date "+%h%y")

## Setting file_pattern

file_pattern="purchase_history"

file_final="$file_pattern*$curr_month.txt"
merge_file_name="$file_pattern_$curr_monthAll.txt"

#pwd
## directory

cd ./grocery
#ls -lrt $file_final
#pwd
rm $merge_file_name
touch $merge_file_name
head -1 $file_final | tail -1 >> $merge_file_name
tail -n +2 -q $file_final >> $merge_file_name
cat $merge_file_name 
echo $merge_file_name 
exit 0