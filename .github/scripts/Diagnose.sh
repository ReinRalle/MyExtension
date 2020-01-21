#!/bin/sh

# chmod +x Diagnose.sh

clear

TRENNLINIE="--------------------------------------------------------------"

printout(){

  printf "%s:\n\n%s\n\n%s\n\n" "$1" "$2" "$TRENNLINIE"

}

echo

printout "Get current date and time"      "$(date +'%d.%m.%y - %H:%Mh')"

printout "list root directory"            "$(ls -lAv --color=always --group-directories-first /)"
printout "list home directory"            "$(ls -lAv --color=always --group-directories-first ~)"
printout "list current directory"         "$(ls -lAv --color=always --group-directories-first)"

printout "show set"                       "$(set)"

printout "show git status"                "$(git status)"

printout "list local installed packages"  "$(npm ll --depth 0)"
printout "list global installed packages" "$(npm ls -g --depth 0)"
