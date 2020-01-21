#!/bin/sh

# chmod +x Diagnose.sh

clear

TRENNLINIE="--------------------------------------------------------------"

indent(){ # $1=string, $2=0 (no enclose), $2=1 (enclose in "'")

  case "$2" in
    0)  echo "$(echo  "$1"  | awk '{ print "  " $0 }')";;
    1)  echo "$(echo "'$1'" | awk '{ print "  " $0 }')";;
  esac

}
printout(){ # $1=heading, $2=string, $3=enclose (0 = no enclose, 1 = enclose in "'")

  local xx

  case "$3" in
    0)  xx="$(echo  "$2"  | awk '{ print "  " $0 }')";;
    1)  xx="$(echo "'$2'" | awk '{ print "  " $0 }')";;
  esac

  printf "%s:\n\n%s\n\n%s\n\n" "$1" "$xx" "$TRENNLINIE"

}

echo

ls -lAv --color=always --group-directories-first /bin

echo

ls -lAv --color=always --group-directories-first /usr/bin

echo

awk --version

exit

echo

printout "Get current date and time"      "$(date +'%d.%m.%y - %H:%Mh')" 1

printout "list root directory"            "$(ls -lAv --color=always --group-directories-first /)" 0
printout "list home directory"            "$(ls -lAv --color=always --group-directories-first ~)" 0
printout "list current directory"         "$(ls -lAv --color=always --group-directories-first)" 0
printout "list script directory"          "$(ls -lAv --color=always --group-directories-first ./.github/scripts/)" 0

printout "show set"                       "$(set)" 0

printout "show git status"                "$(git status)" 0

printout "list local installed packages"  "$(npm ll --depth 0)" 0
printout "list global installed packages" "$(npm ls -g --depth 0)" 0


