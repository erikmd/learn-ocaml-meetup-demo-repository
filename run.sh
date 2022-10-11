#!/bin/bash

dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )

echo "Browse http://localhost:8080 once the local server is runnning"

exec sudo docker run --pull always --rm -v "$dir/src:/repository:ro" -p 8080:8080 ocamlsf/learn-ocaml:master "$@"
