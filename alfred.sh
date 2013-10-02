#!/bin/bash

function help() {
	echo "alfred [options] [-f] <file> [-q] <query>"
	echo ""
	echo "  -f  --file   Filename of php file (ex 'script.php')"
	echo "  -h  --help   Show help options (what you're viewing now)"
	echo "  -q  --query  Value to replace {query} with"
}

FILE='';
QUERY='';

while true ; do
    case "$1" in
        -f )
            FILE=$2
            shift 2
        ;;
        --file )
            FILE=$2
            shift 2
        ;;
        -h )
            help
            break
        ;;
        --help )
            help
            break
        ;;
        -q )
            QUERY=$2
            shift 2
        ;;
        --query )
            QUERY=$2
            shift 2
        ;;
        *)
            break
        ;;
    esac 
done;

if [ $FILE ]; then
	EXT="${FILE##*.}";
	cat $FILE | sed -e "s/{query}/$QUERY/" > .tmp && $EXT .tmp && rm .tmp;
fi