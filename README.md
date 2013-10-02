alfred-debugger
===============

A little script to help you write your Alfred Workflows.

## Install
```bash
cp alfred.sh /usr/local/bin/alfred

# Add `alias alfred=/usr/local/bin/alfred` to `~/.bashrc`
# or
# Add `/usr/local/bin` to `$PATH`

```

## Options
```bash
Usage: alfred [options] [-f] <file> [-q] <query>

  -f --file		Filename of php file (ex 'script.php')
  -h --help		Show help options (what you're viewing now)
  -q --query	Value to replace {query} with
```

## Running
Just run `alfred -f <file> -q <query>`.
