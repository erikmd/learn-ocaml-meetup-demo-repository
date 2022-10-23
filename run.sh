#!/bin/bash

dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )

echo "Browse http://localhost:8080 once the local server is runnning"
echo "Type Ctrl+C or run ( docker stop learn-ocaml-server ) to stop it"

exec sudo docker run --pull always --name learn-ocaml-server --rm -v "$dir/src:/repository:ro" -v learn-ocaml-meetup-demo-sync:/sync -p 8080:8080 ocamlsf/learn-ocaml:master "$@"
