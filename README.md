alfred-debugger
===============

A little script to help you write your Alfred Workflows. In the case your script has an error, Alfred defautls to searching your query in a search engine. To catch these errors you can run them in Terminal, and see what the errors are quickly and easily. 

## Install
```bash
cp alfred.sh /usr/local/bin/alfred

# Add `alias alfred=/usr/local/bin/alfred` to `~/.bashrc`
# or
# Add `/usr/local/bin` to `$PATH`
```

## Options
```bash
alfred [options] [-c] <command> [-f] <file> [-q] <query>

  -c  --command  The command to use (ex 'php' or 'python')
  -f  --file     Filename of php file (ex 'script.php')
  -h  --help     Show help options (what you're viewing now)
  -q  --query    Value to replace {query} with
  -v  --version  Return version of script
```

## Running
Just run `alfred -c <command> -f <file> -q <query>`.

## Sample
In Alfred create a `Script Filter` with the following code.
```php
// PHP
$query = urlencode("{query}");
require("sample.php");
```

Right-click the workflow in Alfred, click `Show in Finder`. Create a new file `sample.php` that will be include by the code above.

```php
<?php
// sample.php

//error_reporting(0); // uncomment to hide all errors
require_once('workflows.php');
$w = new Workflows();

if (!isset($query)) { $query = urlencode("{query}"); }

$w->result( 'debug', $query, "Your query was '$query'", '', 'icon.png', 'yes' );

echo $w->toxml();
?>
```

Open terminal to the open folder and run `$ alfred -c php -f sample.php -q helloworld`. If all works ok you can be sure your Alfred Workflow will too. Go ahdea and try it out now, and have fun making new workflows.
