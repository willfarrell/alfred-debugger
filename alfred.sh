#!/bin/bash
VERSION="0.1";

function help() {
    echo "alfred [options] [-f] <file> [-q] <query>";
    echo "";
    echo "  -f  --file     Filename of php file (ex 'script.php')";
    echo "  -h  --help     Show help options (what you're viewing now)";
    echo "  -q  --query    Value to replace {query} with";
    echo "  -v  --version  Return version of script";
}

FILE='';   # Filename from --file
QUERY='';  # String from --query
OUTPUT=''; # 
VERSION_STR="Version: $VERSION";

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
            #help # Called below
            break
        ;;
        --help )
            #help # Called below
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
        -v )
            OUTPUT=$VERSION_STR
            break
        ;;
        --version )
            OUTPUT=$VERSION_STR
            break
        ;;
        *)
            break
        ;;
    esac 
done;

if [[ $FILE ]]; then
    EXT="${FILE##*.}";
    if [[ $EXT ]]; then
        echo "Common batman, you need a file extension."
    else
        cat $FILE | sed -e "s/{query}/$QUERY/" > .tmp && $EXT .tmp && rm .tmp;
    fi
elif [[ $OUTPUT ]]; then
    echo $OUTPUT
else
    # Called from -h, --help, or when no options are passed
    help
fi