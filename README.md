# pipetools

A collection of familiar and intuitive shell tools for processing text data in a pipeline. The only dependencies are POSIX utilities such as `tr` that should be available on any POSIX-compliant system.

## Examples

```sh
echo foo bar baz | words
# Output:
foo
bar
baz
```

```sh
echo foo bar baz | words | map '$IDX $ELEM' | filter '$IDX -gt 0'
# Output:
1 bar
2 baz
```

```sh
echo foo bar baz | words | map '$IDX $ELEM' | map '$IDX $(( $X0 + 10 )) $X1'
# Output:
0 10 foo
1 11 bar
2 12 baz
```

```sh
echo foo bar baz | words | map '$(( $IDX + 1 ))' | reduce 1 '$(( $ACC * $ELEM ))'
# Output:
6
```

The tools all follow the same conventions:

- Input is line-based (newline-separated). You can use `words` to convert whitespace to newlines.
- `$IDX` is the index of the element in the input stream.
- `$ELEM` is the element itself.
- `$X0`, `$X1`, etc. are the whitespace separated words in the current element (think columns in a table).
- `$ACC` is the accumulator for the reduce operation.

The `$(( $X0 + $X1 ))` syntax is called arithmetic expansion, which allows for basic arithmetic operations within a shell script.

## Installation

Copy the contents of the `tools` directory to a directory in your PATH, or run the `install.sh` script to create symlinks automatically to your selected target directory.

## Author

Jan Tuomi <<jan@jantuomi.fi>>  
Built with 100% natural human intelligence
