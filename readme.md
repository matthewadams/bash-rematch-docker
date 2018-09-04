# Bash Regular Expression Matcher

## Motivation
This image was created out of the need for portable regular expression matching in `sh` scripts.

## Summary
* This image matches either `stdin` or the second argument given with a given regular expression using Bash's regular expression matching.
If matching from `stdin`, the only argument given should be the regular expression, otherwise the second argument will be matched against the regular expression and `stdin` will be ignored.
* All matched capture groups, include the original string as capture group `0`, are `echo`ed to `stdout`, separated by a space by default.
* To change the capture group delimiter, set the environment variable `MATCH_DELIM` to your desired delimiter.
* Exits with `0` if a match, else a nonzero value.

## Examples

### Pass value to test & regex
```
$ docker run --rm -it matthewadams12/match '^(i)(t)$' it
it i t
```

### Pipe value to test from `stdin`
```
$ echo it | docker run --rm -i matthewadams12/match '^(i)(t)$'
it i t
```

### Use custom delimiter
```
$ echo it | docker run --rm -i -e MATCH_DELIM=';' matthewadams12/match '^(i)(t)$'
it;i;t
```

### Match with no capture groups
```
$ docker run --rm -it matthewadams12/match '^it$' it
it
$ echo $?
0
```

### Fail to match
```
$ docker run --rm -it matthewadams12/match '^not it$' it
$ echo $?
1
```
