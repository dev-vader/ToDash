#!/bin/bash

COMMAND="$1"
ITEM="$2"
THIRD_PARAM="$3"

SUB_DIR="/Users/vincentweber/Desktop/todo/"

GREEN='\033[1;32m'
NC='\e[0m'


##DIRPC="/home/vince/Development/ToDash/"
##DIRMAC="/Users/vincentweber/Desktop/todo/"
##Empty var to hold number of tasks(lines) in a file


##var used to output number of tasks
LINE_COUNT=""
function taskCount {
	LINE_COUNT=$(sed -n '$=' $SUB_DIR$COMMAND.txt ) 
}

function createTaskOrCOMMAND {
##When checking blank variable this still hits.
	if [ -e $SUB_DIR$COMMAND.txt ];
	then
		echo "$ITEM" >> $SUB_DIR$COMMAND.txt
		taskCount $SUB_DIR$COMMAND.txt
		echo "$ITEM has been added to todo list $COMMAND"
		echo "$LINE_COUNT task(s) in list $COMMAND"
		echo

	else
		
		##	touch /home/vince/Development/ToDash/$COMMAND.txt
		touch $SUB_DIR$COMMAND.txt
		echo "$ITEM" >> $SUB_DIR$COMMAND.txt
		echo "$ITEM has been added to todo list $COMMAND"
		taskCount $SUB_DIR$COMMAND.txt
		echo "$LINE_COUNT task(s) in list $COMMAND"
		echo
	fi
}

##Check if arguments after todash call is empty..print splash message
function emptyString {
	if [[ -z "$COMMAND" ]];
	then
		echo "Hello, thanks for using TODASH the simple BASH COMMAND manager."
		echo "ex: todash COMMANDname 'Schedule vet appointment for kitty'"
   		echo
	fi
}

##Reads file until end of fell, appends task number (line) before task.
function readList {
	counter=1
	while IFS= read -r lines
	do 
		echo "($counter.)$lines"	
		let "counter+=1"
	done < "$SUB_DIR$ITEM.txt"
	echo
}

##Removes task using sed, prints out tasks then removes it 
##Add if for confirmation
function removeTask {
	sed -n "$THIRD_PARAM p" $SUB_DIR$ITEM.txt
	## OSX sed requires ' ' after -i
	out=`sed -i ':a;N;$!ba;s/\n/ /g' "$THIRD_PARAM d" $SUB_DIR$ITEM.txt`
	echo "$out has been removed."
}

##Change output new line per list and quantity of tasks
function taskLists {
	##for file in $SUB_DIR*; 
	##do
	##	echo ${file}
	##done
	echo 
	echo "Your TODO lists:"
	echo $(basename $SUB_DIR*)
	echo
}

function deleteList {
	if [ -f $SUB_DIR$ITEM.txt ];
	then
		rm $SUB_DIR$ITEM.txt
		echo "Todo list $ITEM has been removed."
	else 
		echo "Todo list $ITEM does not exist."
	fi
}

##Switch case to handle all argurments
case $COMMAND in 
	"")
		emptyString
		;;
	lists)
		taskLists
		;;
	list)
		taskLists
		;;
	read)
		readList
		;;
	remove)
		removeTask
		;;
	delete)
		deleteList
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


