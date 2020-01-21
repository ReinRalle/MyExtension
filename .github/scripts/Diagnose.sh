#!/bin/sh

# chmod +x Diagnose.sh

clear

TRENNLINIE="--------------------------------------------------------------"

printout(){ # $1=heading, $2=string, $3=enclose (0 = no enclose, 1 = enclose in "'")

  local xx

  case "$3" in # enclose
    0)  xx="$(echo  "$2"  | awk '{ print "  " $0 }')";; # indent with no enclose
    1)  xx="$(echo "'$2'" | awk '{ print "  " $0 }')";; # indent with enclose in "'"
  esac

  printf "%s:\n\n%s\n\n%s\n\n" "$1" "$xx" "$TRENNLINIE"

}

printout "Get current date and time"      "$(date +'%d.%m.%y - %H:%Mh')" 1

printout "list root directory"            "$(ls -lAv --color=always --group-directories-first /)" 0
printout "list home directory"            "$(ls -lAv --color=always --group-directories-first ~)" 0
printout "list current directory"         "$(ls -lAv --color=always --group-directories-first)" 0
printout "list script directory"          "$(ls -lAv --color=always --group-directories-first ./.github/scripts/)" 0
printout "list '/bin' directory"          "$(ls -lAv --color=always --group-directories-first /bin)" 0
printout "list '/usr/bin' directory"      "$(ls -lAv --color=always --group-directories-first /usr/bin)" 0

printout "show set"                       "$(set)" 0

printout "show git status"                "$(git status)" 0

printout "list local installed packages"  "$(npm ll --depth 0)" 0
printout "list global installed packages" "$(npm ls -g --depth 0)" 0
