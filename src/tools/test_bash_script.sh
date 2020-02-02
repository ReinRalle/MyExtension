#!/bin/bash

export LC_ALL="C"   # sort order - dotfiles first!

folder="./"

# all files/directories, directories first, strip 'total', indent with 2 spaces
file_list="$(ls -la --group-directories-first "$folder" | awk '/^total/{next}{printf "  %s\n", $0}')"

pwd="$(pwd)"

#clear
echo "$@"
echo
printf "pwd: '%s'\n\n" "$pwd"
printf "%s\n"          "$file_list"
echo
