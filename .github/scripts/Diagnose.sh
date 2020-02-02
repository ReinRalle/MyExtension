#!/bin/sh

# chmod +x Diagnose.sh

SEPERATOR="------------------------------------------------------------------------------------"

printout(){ # $1=heading, $2=string, $3=enclose (0 = no enclose, 1 = enclose in "'")

  local str

  case "$3" in # enclose
    0)  str="$(echo  "$2"  | awk '{ print "  " $0 }')";; # indent with no enclose
    1)  str="$(echo "'$2'" | awk '{ print "  " $0 }')";; # indent with enclose in "'"
  esac

  printf "%s\n\n%s\n\n%s\n\n" "$1" "$str" "$SEPERATOR"

}

list_directories()(

  get_directory(){ # $1=file

    if [ -d "$1" ]; then
      echo "$(ls -lAv --color=always --group-directories-first $1)"
    else
      echo "Error: '$1' not exist"
    fi

  }

  printout "list directory: '/'"                  "$(get_directory /)" 0
  printout "list directory: '/bin'"               "$(get_directory /bin)" 0
  printout "list directory: '/usr/bin'"           "$(get_directory /usr/bin)" 0
  printout "list directory: '/home'"              "$(get_directory /home)" 0
  printout "list directory: '/home/runner'"       "$(get_directory /home/runner)" 0
  printout "list directory: '/home/runner/work'"  "$(get_directory /home/runner/work)" 0
  printout "list directory: '/home/work'"         "$(get_directory /home/runner/work)" 0

  printout "list directory: './'"                 "$(get_directory ./)" 0
  printout "list directory: './.github/scripts'"  "$(get_directory ./.github/scripts)" 0

)

list_divers(){

  printout "Get current date and time"           "$(date +'%d.%m.%y - %H:%Mh')" 1

  printout "show set"                            "$(set)" 0
  printout "show \$PWD"                          "$PWD" 1

  printout "show git status"                     "$(git status)" 0

  printout "list local installed packages"       "$(npm ll --depth 0)" 0
  printout "list global installed packages"      "$(npm ls -g --depth 0)" 0

  which awk
  which perl
  which sed

}

clear

echo

list_directories
list_divers
