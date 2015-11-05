#!/bin/bash

## Simple TODO COMMAND 
## Prints to file taken as second ARG ( $ TODO School Yada yada yada )
## Creates file COMMAND in set directory if it does not exist
## Appends test with timestamp to file

COMMAND="$1"
ITEM="$2"
THIRD_PARAM="$3"

SUB_DIR="/home/vince/Development/ToDash/"

##
DIR="/home/vince/Development/ToDash/$COMMAND.txt"-

##Empty var to hold number of tasks(lines) in a file
LINE_COUNT=""

##directory in which will hold COMMANDs


##Create makefile to create directory set as desktop title TODO
##Check for root Dir every call I guess?


function taskCount {
	LINE_COUNT=$(sed -n '$=' $SUB_DIR$COMMAND.txt ) 
}

function createTaskOrCOMMAND {
##When checking blank variable this still hits.
	if [ -e $SUB_DIR$COMMAND.txt ];
	then
		echo "$ITEM" >> $SUB_DIR$COMMAND.txt
		taskCount $SUB_DIR$COMMAND.txt
		echo "$ITEM has been added to $COMMAND"
		echo "$LINE_COUNT task(s) in list $COMMAND"
		echo

	else
		touch /home/vince/Development/ToDash/$COMMAND.txt
		echo "$ITEM" >> $SUB_DIR$COMMAND.txt
		echo "$ITEM has been added to $COMMAND"
		taskCount $SUB_DIR$COMMAND.txt
		echo "$LINE_COUNT task(s) in list $COMMAND"
		echo
	fi
}

function emptyString {
	if [[ -z "$COMMAND" ]];
	then
		echo "Hello, thanks for using TODASH the simple BASH COMMAND manager."
		echo "ex: todash COMMANDname 'Schedule vet appointment for kitty'"
   		echo
	fi
}

function readList {
	counter=0
	while IFS= read -r lines
	do 
		echo "($counter) $lines"	
		let "counter+=1"
	done < "$SUB_DIR$ITEM.txt"

}

function removeTask {
	sed -n "$THIRD_PARAM p" $SUB_DIR$ITEM.txt
	sed -i "$THIRD_PARAM d" $SUB_DIR$ITEM.txt
}

case $COMMAND in 
	"")
		emptyString
		;;
	lists)
		echo "Lists"
		;;
	read)
		readList
		;;
	remove)
		removeTask
		;;
	help)
		echo
		echo "ToDash commands:"
		echo "todash lists - prints all working lists"
		echo "todash delete list LISTNAME - deletes list LISTNAME"
		echo "todash read LISTNAME - prints all list items to console"
		echo "todash remove LISTNAME 6 - removes item#6 from LISTNAME"
		echo "todash LISTNAME TASK - writes TASK to LISTNAME creates LISTNAME if it doesnt exist"
		echo
	;;
	*)
		createTaskOrCOMMAND
esac





## Check if FILE exists in TODO dir and != "other keywords"
	## if it exists append task 
	##Echo "nth task added "
		## if it doesnt exist create COMMAND
		## append string to COMMAND

## View COMMAND
	##print out COMMAND giving numbers before items
	##if COMMAND doesnt exist print Error: Please check COMMAND name.

## todo remove COMMAND itemnumber
	## Print item has been completed
	## Remove item

