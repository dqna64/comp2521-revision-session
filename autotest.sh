#!/bin/sh

parameters="
	default_compilers = {'c' : [['clang', '-Werror', '-std=gnu11', '-g', '-lm']]}
	upload_url = https://example.com/autotest.cgi
"
target="$(readlink -n "$0")"
targetDir="$(dirname "$target")"

exec python3 "/usr/local/bin/autotest/autotest.py" --exercise_directory "${targetDir}/problems" --parameters "$parameters" "$@"


