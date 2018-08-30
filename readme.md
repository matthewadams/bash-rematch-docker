# Bash Regular Expression Matcher

## Motivation
This image was created out of the need for portable regular expression matching in `sh` scripts.

## Summary
* This image matches either `stdin` or the first argument given with a given regular expression using Bash's regular expression matching.  If matching from `stdin`, argument `$1` should contain the regular expression; if matching via positional arguments, `$1` should contain the value being matched and `$2` should contain the regular expression.
* If there are any capture groups, they are `echo`ed to `stdout`, separated by a space by default.
* To change the capture group delimiter, set the environment variable `MATCH_DELIM` to your desired delimiter.
* Exits with `0` if a match, else `1`.

## Examples

### Pass value to test & regex
```
$ docker run --rm -it matthewadams12/match it '^(i)(t)$'
i t
```

### Pipe value to test from `stdin`
```
$ echo it | docker run --rm -i matthewadams12/match '^(i)(t)$'
i t
```

### Use custom delimiter
```
$ echo it | docker run --rm -i -e MATCH_DELIM=x matthewadams12/match it '^(i)(t)$'
ixtx
```

### Match with no capture groups
```
$ docker run --rm -it matthewadams12/match it '^it$'
$ echo $?
0
```

### Fail to match
```
$ docker run --rm -it matthewadams12/match it '^not it$'
$ echo $?
1
```

