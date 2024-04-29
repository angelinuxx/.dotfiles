#!/bin/sh
path="$1"

# if path starts with $HOME replace it with ~
case "$path" in
    "$HOME"*) path="~${path#$HOME}" ;;
esac

# code to truncate the path if it's too long
# fixed_length=$2
# if (( ${#path} > $fixed_length )); then
#     path=$(echo "$path" | tail -c "$fixed_length")
#     if ! [[ "$path" =~ ^//* ]]; then
#         path="/${path#*/}"
#     fi
#     path="...$path"
# fi
echo $path
