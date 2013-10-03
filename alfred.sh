#!/bin/bash
VERSION="0.2";

function help() {
    echo "alfred [options] [-c] <command> [-f] <file> [-q] <query>";
    echo "";
    echo "  -c  --command  The command to run your script (ex 'php or 'python')";
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
        -c )
            COMMAND=$2
            shift 2
        ;;
        --command )
            COMMAND=$2
            shift 2
        ;;
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

if [[ $FILE && $COMMAND ]]; then
    cat $FILE | sed -e "s/{query}/$QUERY/" > .tmp && $COMMAND .tmp && rm .tmp;
elif [[ $OUTPUT ]]; then
    echo $OUTPUT
else
    # Called from -h, --help, or when no workable options are passed
    help
fi