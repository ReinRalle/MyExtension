#!/bin/bash

# must stay in ./.github/scripts

# helper
indent(){ # $1=string, $2=0 (no enclose), $2=1 (enclose in "'")

  case "$2" in
    0)  echo "$(echo  "$1"  | awk '{ print "  " $0 }')";;
    1)  echo "$(echo "'$1'" | awk '{ print "  " $0 }')";;
  esac

}

clear

# change working directory to this script folder (bash scripts run in subshell!)
cd $(dirname $0)

# store contens of the script folder
LIST_PWD=$(ls -lAv --color=always --group-directories-first)

# store staged contents’ mode bits, object name and stage number (in script folder only)
# [<tag> ]<mode> <object> <stage> <file>
LIST_STAGED="$(git ls-files --stage)"

echo

printf "current path: '%s'\n\n%s\n\n"  "$PWD" "$(indent "$LIST_PWD" 0)"

printf "git staged files:\n\n%s\n\n"   "$(indent "$LIST_STAGED" 0)"

# update the file permission to: execute

# git update-index --chmod=+x 'Diagnose.sh'
# git update-index --chmod=+x 'decrypt_secrets.sh'

# to check: run 'git ls-files --stage' again

# if all fine, commit it, for example: 'git commit -m "made a file executable"' and push
