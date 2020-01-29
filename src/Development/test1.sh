#!/bin/bash

# GET https://api.github.com/repos/<org>/<repo>/check-suites/<check_suite_id>/check-runs

# declare SERVER USER REPO TMP_FOLDER
SERVER="https://api.github.com"; USER="ReinRalle"; REPO="MyExtension"; TMP_FOLDER="./Development/tmp"

test_links(){

  org="ReinRalle-test"

  mediatype1="Accept: application/vnd.github.antiope-preview+json"
  mediatype2="Accept: application/vnd.github.machine-man-preview+json"
  mediatype3="Content-Type: application/json"

  commit_hash="fccaf94074f4a8d8a0fced555ebf125e96e6129e"
  check_suite_id="412606667"
  check_run_id="400536143" # 401448925
  release_id="22754684"
  asset_id="17351745"
  path="Development"
  ref="fccaf94074f4a8d8a0fced555ebf125e96e6129e"

  # define arrays (https://unix.stackexchange.com/questions/444946/how-can-we-run-a-command-stored-in-a-variable)
  # can not run with dash (sh)!

  cmd_01=(curl -s                "$SERVER"                                                            )
  cmd_02=(curl -s                "$SERVER/meta"                                                       )
  cmd_03=(curl -s                "$SERVER/emojis"                                                     )
  cmd_04=(curl -s                "$SERVER/events"                                                     )
  cmd_05=(curl -s                "$SERVER/users/$USER"                                                )
  cmd_06=(curl -s                "$SERVER/users/$USER/events"                                         )
  cmd_07=(curl -s                "$SERVER/users/$USER/events/public"                                  )
  cmd_08=(curl -s                "$SERVER/users/$USER/gpg_keys"                                       )
  cmd_09=(curl -s                "$SERVER/users/$USER/keys"                                           )
  cmd_10=(curl -s                "$SERVER/users/$USER/repos"                                          )
  cmd_11=(curl -s                "$SERVER/users/$USER/subscriptions"                                  )
  cmd_12=(curl -s                "$SERVER/repos/$USER/$REPO"                                          )
  cmd_13=(curl -s                "$SERVER/repos/$USER/$REPO/contents"                                 )
  cmd_14=(curl -s                "$SERVER/repos/$USER/$REPO/contents/$path"                           )
  cmd_15=(curl -s                "$SERVER/repos/$USER/$REPO/git/commits/$commit_hash"                 )
  cmd_16=(curl -s                "$SERVER/repos/$USER/$REPO/license"                                  )
  cmd_17=(curl -s                "$SERVER/repos/$USER/$REPO/releases"                                 ) # {/id}"
  cmd_18=(curl -s                "$SERVER/repos/$USER/$REPO/releases/assets/$asset_id"                )
  cmd_19=(curl -s                "$SERVER/repos/$USER/$REPO/releases/$release_id/assets"              )
  cmd_20=(curl -s                "$SERVER/repos/$USER/$REPO/tags"                                     )
  cmd_21=(curl -s                "$SERVER/repos/$USER/$REPO/readme"                                   )
  cmd_22=(curl -s                "$SERVER/repos/$USER/$REPO/events"                                   )
  cmd_23=(curl -s                "$SERVER/repos/$USER/$REPO/commits"                                  )
  cmd_24=(curl -s                "$SERVER/repos/$USER/$REPO/commits/$commit_hash/status"              )
  cmd_25=(curl -s                "$SERVER/repos/$USER/$REPO/subscribers"                              )
  cmd_26=(curl -s                "$SERVER/repos/$USER/$REPO/stargazers"                               )
  cmd_27=(curl -sH "$mediatype1" "$SERVER/repos/$USER/$REPO/commits/master/check-suites"              )
  cmd_28=(curl -sH "$mediatype1" "$SERVER/repos/$USER/$REPO/commits/$commit_hash/check-runs"          )
  cmd_29=(curl -sH "$mediatype1" "$SERVER/repos/$USER/$REPO/check-suites/$check_suite_id"             )
  cmd_30=(curl -sH "$mediatype1" "$SERVER/repos/$USER/$REPO/check-suites/$check_suite_id/check-runs"  )
  cmd_31=(curl -sH "$mediatype1" "$SERVER/repos/$USER/$REPO/check-runs/$check_run_id"                 )
  cmd_32=(curl -sH "$mediatype1" "$SERVER/repos/$USER/$REPO/check-runs/$check_run_id/annotations"     )

  cmd_xx=(curl -s                "$SERVER/repos/$USER/$REPO/subscribers"                              )


  x="2"; x=$( printf "%02d" "$x" )       # set leading zero

  cmd=cmd_$x[@]                          #
  echo ${!cmd}

  return

  printf "'%s'" "${cmd[@]}"

  cmd=("${cmd[@]}")                      # copy array

                          #
  printf "'%s'" "${cmd[@]}"


#  cmd=("${cmd_20[@]}")            # copy array
#  cmd_str="${cmd[*]}"             # store cmd as string
  json=$( "${cmd[@]}" )           # execute cmd and store output
  printf "%s\n\n"  "$cmd_str"     #
  echo "$json"| jq "."            #


  # cmd="${cmd_20[@]}"; echo "$cmd"
  # abc=$( "${cmd_20[@]}" ); echo "$abc" | jq "." # run the command


  # ???

  # LINK="https://github.com/$USER/$REPO/suites/412606667/logs"
  # LINK="https://api.github.com/repos/${GITHUB_REPOSITORY}/commits/${GITHUB_SHA}/check-suites?app_id=15368"

  # curl -s "https://api.github.com/repos/$REPO/commits/$commit_hash/check-suites" # ?app_id=15368 #| jq -r '.check_suites[0].id'

}

save_log_to_path() { # $1=url, $2=target path

  # curl Arguments (https://curl.haxx.se/docs/manpage.html#-O)
  #   -D, --dump-header          -i, --include        -J, --remote-header-name    -L, --location
  #   -o, --output <file>        -O, --remote-name    -s, --silent                -S, --show-error

  # content-disposition: attachment; filename=logs_43.zip; filename*=utf-8''logs_43.zip
  log_filename=$(curl -sLD - -o /dev/null "$1" | awk 'match($0, /^content-disposition: .*filename=(.*);/, A) { print A[1] }')

  cd "$2"

  touch "$log_filename" && rm "$log_filename"    # delete file if exist!

  curl -sS -JOL "$1" && unzip -l "$log_filename" # download & view logfile

}

get_check_suite_id_by_commit(){ # $1=commit

  local link1 link2 check_suite_id

  link1="https://api.github.com/repos/$USER/$REPO/commits/$1/check-runs"

  json=$( curl -s -H "Accept: application/vnd.github.antiope-preview+json" "$link1" )

  check_suite_id=$( echo "$json" | jq ".check_runs[0].check_suite.id" )

  link2="https://github.com/$USER/$REPO/suites/$check_suite_id/logs"

   echo "commit: '$1'"
   echo "$check_suite_id"
   echo "$link2"
   echo "$json" | jq "."

  # save_log_to_path "$link2" "$TMP_FOLDER"

}

git_list_all_commits(){

  DATE_FORMAT="%a, %d.%m.%y │ %H:%M:%S"

  echo "  ┌──────────────────────────────────────────┬───────────────┬──────────┐"

  git --no-pager log --date=format:"$DATE_FORMAT" --pretty=format:"  │ %H │ %ad │"

  echo
  echo "  └──────────────────────────────────────────┴───────────────┴──────────┘"
  echo
}

main(){

  clear; clear

  get_check_suite_id_by_commit "70cc750c00da5ab166b4eb967dc4e436d2b97928"

  # git_list_all_commits

}

clear; clear; test_links # main
