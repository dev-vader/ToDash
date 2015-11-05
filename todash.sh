#!/bin/bash

## Simple TODO list 
## Prints to file taken as second ARG ( $ TODO School Yada yada yada )
## Creates File list in set directory if it does not exist
## Appends test with timestamp to file

list="$1"
item="$2"

##Create makefilt to create directory set as desktop title TODO
##Check for root Dir every call I guess?

echo $1 $2 "In the program"

if [ -e /Users/vincentweber/Dektop/todo/$LIST.txt ];
then
	echo "DEBUGGER: FILE EXISTS"	
else
	echo "DEBUGGER: FILE CREATED"
	touch /Users/vincentweber/Desktop/todo/$LIST.txt


## Check if file exists in TODO dir and != "other keywords"
	## if it exists append task 
	##Echo "nth task added "
		## if it doesnt exist create List
		## append string to list

## View list
	##print out list giving numbers before items
	##if list doesnt exist print Error: Please check list name.

## todo remove list itemnumber
	## Print item has been completed
	## Remove item

