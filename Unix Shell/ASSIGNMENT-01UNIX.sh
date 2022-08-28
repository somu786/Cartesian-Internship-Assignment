## ASSIGNMENT-01UNIX
## Write a script to find out list of unique dates on which there are sales.



#!/bin/sh
file=$1
## Getting and Extracting files
extract=$(cat $file | tail -n +2 | cut -d ',' -f3 | uniq)

for d in $extract
do  
    ## Find unique Dates
    $ d=$(echo $d | tr ' ' '\n' | sort -nu)
	    ## Print_dates_one_by_one
		echo $d
	fi
done
exit 0