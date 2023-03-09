# Fish :fish: Shell `todo.txt` parser

Super minimal `todo.txt` pretty-printer.

## Quickstart

```fish
fisher install cideM/todo-fish
```

```fish
$ echo "x this is done" > todo.txt
$ echo "not done" >> todo.txt
$ echo "(A) priority" >> todo.txt
$ echo todo.txt | ftd
.
    [ ] (A) priority
    [ ] not done
$ echo todo.txt | ftd -v
.                   (1/3)
    [ ] (A) priority
    [ ] not done
    [x] this is done
```

## Installation

### Fisher

Install with [Fisher](https://github.com/jorgebucaran/fisher) (recommended):

```shell
fisher install cideM/todo-fish
```

### Manual

This assumes that you're fish config folder is located under `~/.config/fish`

```shell
curl https://raw.githubusercontent.com/cideM/todo-fish/master/functions/ftd.fish\
  -o ~/.config/fish/functions/ftd.fish
```

## Usage

Pipe a list of file paths to `ftd`...

```fish
echo todo.txt | ftd
```

...or call with filenames

```fish
ftd todo.txt
```

Call it with the `-v` or `--verbose` flag for progress stats and displaying done tasks.

```fish
echo todo.txt | ftd -v
```

## Recipes

### How to show the stats for several todo.txt files

```fish
fd todo.txt | ftd
```

Just use whatever program generates a list of paths to `todo.txt` files and pipe it into `ftd`. Alternatively pass the file names as positional parameters:

```fish
ftd path/to/todo.txt path/to/another/todo.txt
```

## TODO

- [ ] Rename -v to --show-done and --show-stats
- [x] Accept positional params for file lists
