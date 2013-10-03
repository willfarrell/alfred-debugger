#!/bin/bash
VERSION="0.4";

function help() {
    echo "alfred [options] [-f] <file> [-q] <query>";
    echo "";
    echo "  -f  --file     Filename of php file (ex 'script.php')";
    echo "  -h  --help     Show help options (what you're viewing now)";
    echo "  -q  --query    Value to replace {query} with";
    echo "  -v  --version  Return version of script";
}

hput () {
  eval hash"$1"='$2'
}

hget () {
  eval echo '${hash'"$1"'#hash}'
}

FILE='';   # Filename from --file
QUERY='';  # String from --query
OUTPUT=''; # 
VERSION_STR="Version: $VERSION";

# Supported Scripts
hput bash bash
hput sh zsh
hput rb rudy
hput php php
hput py python
hput pl perl
hput scpt osascript

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
    COMMAND=`hget "$EXT"`
    if [[ -z $EXT ]]; then
        echo "Common batman, you need a file extension."
    elif [[ $COMMAND ]]; then
        cat $FILE | sed -e "s/{query}/$QUERY/" > .tmp && $COMMAND .tmp && rm .tmp;
    else
        echo "That script isn't supported. Try .php, .pl, .py, .rb, or .scpt"
    fi
elif [[ $OUTPUT ]]; then
    echo $OUTPUT
else
    # Called from -h, --help, or when no workable options are passed
    help
fi