#!/usr/bin/env bash

[ -z "$1" ] && echo -e "Usage:\n\t some-command | ./line-picker.sh " && exit 1 

lines=()

while read -r ln; do
    lines+=("$ln")
done

for ln in "${lines[@]}"; do
    echo "$ln"
    read -rp "do you want to keep this line? (y/n): " action </dev/tty

    [ "$action" = "q" ] && exit 0
    [ "$action" = "y" ] && echo "$ln" >> "$1"
done
