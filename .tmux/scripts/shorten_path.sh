#!/bin/bash

path="$1"

# if path starts with $HOME replace it with ~
case "$path" in
    "$HOME"*) path="~${path#$HOME}" ;;
esac

# code to truncate the path if it's too long
fixed_length=$2

# if the path is too long, truncate it keeping the first token and the last n tokens
# e.g. if the fixed length is 38 and the path is ~/Clienti/Foo/configurator-portal/workspace/configurator-portal/
# then the result will be -> ~/Clienti...kspace/configurator-portal
if (( ${#path} > fixed_length )); then
    tokens=($(echo "$path" | tr '/' ' '))
    path_head="${tokens[0]}"
    if [[ "$path_head" == "~" ]]; then
        path_head="$path_head/${tokens[1]}"
    fi
    path_head="$path_head..."
    path_tail=""
    current_length=${#path_head}
    for (( i = ${#tokens[@]} - 1; i > 0; i-- )); do
        if (( current_length < fixed_length )); then
            path_tail="${tokens[i]}/$path_tail"
            current_length=$((current_length + ${#tokens[i]} + 1))
        else
            break
        fi
    done
    # remove trailing slash
    path_tail="${path_tail%/}"
    current_length=$((current_length - 1))

    # if there are exceding characters, replace the initial #exceding characters with "..."
    excess=$((current_length - fixed_length))
    if (( excess > 0 )); then
        path_tail="${path_tail:${excess}}"
    fi
    path="$path_head$path_tail"
fi

echo "$path"
