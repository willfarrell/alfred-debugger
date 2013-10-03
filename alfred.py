#!/usr/bin/python
import argparse, subprocess, re, sys

VERSION="0.1";

parser = argparse.ArgumentParser(description='''Execute a test''',)
parser.add_argument('-f', '--file', type=str, required=True, help="Filename of php file (ex 'script.php')")
parser.add_argument('-q', '--query', type=str, required=True, help="Value to replace {query} with")
parser.add_argument('--version', action='version', version=VERSION, help="Return version of script")
args = parser.parse_args()

if not re.search(r"\.php$", args.file, re.IGNORECASE):
    print 'Common batman, you need a file extension.'
    sys.exit(1)

process = subprocess.Popen('cat %s | sed -e "s/{query}/%s/" > .tmp && $EXT .tmp && rm .tmp;' % (args.file, args.query), shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
print process.communicate()[0]