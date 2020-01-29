# Developer's Diary :construction:

## 11.01.20

* `Change: git`

  * <details>
    <summary>change .git/config</summary>

     ```yaml
     # vscode: select language format:   Properties

     [core]
       repositoryformatversion = 0
       filemode = true
       bare = false
       logallrefupdates = true
       ignorecase = true

     [remote "origin"]
       url = git@github.com:ReinRalle/  MyExtension.git
       fetch = +refs/heads/*:refs/remotes/  origin/*

     [remote "github"] # add for testing   11.01.20, 12:30h
       url = git@github.com:ReinRalle/  MyExtension
       fetch = refs/heads/*:refs/remotes/github/  *

     [branch "master"] # add for testing   11.01.20, 12:30h
        remote = origin
        merge = refs/heads/master
    ```
    </details>

* `Info: GitHub Actions` :green_heart:

  * [github actions](https://help.github.com/en/actions)

  * [Working with GitHub Actions](https://jeffrafter.com/working-with-github-actions/)

* `Change: GitHub-Action` :green_heart:

  * activate github's `action` in repo

## 15.01.20

* ~~TODO~~: "tasks.json" unter wsl wird vom "task explorer" noch nicht unterstützt
	* warten auf update der extension "spmeesseman.vscode-taskexplorer"
	* infolge dessen kann ich die tasks nur unzureichend unter wsl testen
	* erhalte im Moment folgende Fehlermeldung:
		* `command 'extension.commandvariable.file.fileDirnamePosix' not found`
		* deutet auf ein anderes Prob hin
	* könnte es mal unter einer reinen windows Umgebung testen (ohne wsl Nutzung)
	* Ursache: `"MyVar6": "${command:extension.commandvariable.file.fileDirnamePosix}"` in tasks.json produziert den Fehler
  * Fix: erstmal auskommentieren

* Problem: `GitHub-Action` :green_heart:

  * Kann nicht verstehen, was das Pipe Symbol bei `run: |` soll!
	* Erklärung unter: [github-actions](https://dev.to/bnb/an-unintentionally-comprehensive-introduction-to-github-actions-ci-blm)
	* hat mit yaml syntax zu tun
	* Info: [Learn YAML in five minutes!](https://www.codeproject.com/Articles/1214409/Learn-YAML-in-five-minutes)

* `Info: git`

  * show all config properties in different files:

    `git --no-pager config --list --show-origin`

* `Info: markdown`
	* Strikethrough uses two tildes
	* [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

## 16.01.20

* `Info: node.js`
  * [Why and How to Migrate from NPM to Yarn](https://waverleysoftware.com/blog/yarn-vs-npm/)

* `Info: GitHub-Actions` :green_heart:
  * [GitHub Marketplace](https://github.com/marketplace?type=actions)

  * [actions/create-release](https://github.com/actions/create-release)
  * [Manual workflow triggers in Github Actions](https://stackoverflow.com/questions/58933155/manual-workflow-triggers-in-github-actions/59621799#59621799)

  * [Automating the build and publish process with GitHub Actions (and GitHub Package Registry)](https://stackoverflow.com/questions/58347746/automating-the-build-and-publish-process-with-github-actions-and-github-package) :package:

  * [commit changes made in your **`workflow run`** directly to your repo](https://github.com/EndBug/add-and-commit)

  * [GitHub Action to automate deploying VS Code extensions](https://github.com/lannonbr/vsce-action)

  * <details>
    <summary>Action Examples</summary>

    * Example:
      ```yaml
        name: Test

        on:
          watch
            types: [started]

        jobs:
          build:
            runs-on: ubuntu-latest

            if: github.actor ==     github.event.repository.owner.login

            steps:
               - name: Checkout repository
                 uses: actions/checkout@v2
                 # add more ...
        ```

    * example GitHub Projects:

      * [vscode-objectscript](https://github.com/daimor/vscode-objectscript/actions)

      * [content-navigator](https://github.com/ggbecker/content-navigator/actions)

      * [vs_plugin_search_for_errors_on_stackoverflow](https://github.com/kinoooshnik/vs_plugin_search_for_errors_on_stackoverflow/actions)

    </details>
* `Info: GitHub-Api`

  * [GitHub REST API v3](https://developer.github.com/v3/)

  * [Accessing GitHub's REST API with CURL](https://blogs.infosupport.com/accessing-githubs-rest-api-with-curl/)

  * [GitHub Rest Api Example and Uses](https://www.restapiexample.com/use-of-rest-api/github-rest-api-example-uses/)

  * [Integrating REST APIs into CI/CD pipelines](https://circleci.com/blog/cicd-rest-apis/)

  * <details>

    <summary>curl examples</summary>

      in this example, the 'vmg' and 'redcarpet' values are provided for the :owner and :repo parameters in the path while :state is passed in the query string.

      ```bash
      # curl -i "https://api.github.com/repos/:owner/:repo/issues?state=:state"
	    curl -i "https://api.github.com/repos/vmg/redcarpet/issues?state=closed"
      ```

      noch ein paar andere Beispiele:

      ```bash
	    curl    https://api.github.com #
	    curl -i https://api.github.com
	    curl    https://api.github.com/users/reinralle/events
	    curl    https://api.github.com/users/reinralle/repos
	    curl -H "Content-Type: application/json" https://api.github.com
	    curl    https://api.github.com -H Accept:application/vnd.github.v3+json

	    curl -s https://api.github.com/repos/reinralle/myextension/releases
	  ```
    </details>

## 17.01.20

* `Problem: WSL - bash` :bug:

  * mein `weasel` script (`~/weaser_start.sh`) scheint nicht ausgeführt zu werden.

  * Ursache: bash .profile file`~/.profile` wird nicht aufgerufen, wenn unter vscode ein neues Terminal unter "remote wsl" geöffnet wird.

  * Fix: hinzufügen folgender Zeile in den:
    *  ~~Change: "workspace settings" (`.vscode/settings.json`)~~
    * Change: "user settings" (`/C:/Users/:USER/AppData/Roaming/Code/User/settings.json`) (windows):

      ```json
      "terminal.integrated.shellArgs.linux": ["-l"]
      ```
      Anotation (1): [can only be defined in user settings](https://code.visualstudio.com/docs/editor/integrated-terminal#_configuration)

      Anotation (2): argument `-l` => login shell (run `~/.profile`)

* `Change: node.js`
  * Um mögliche Überchneidungen auszuschliessen, versuche ich mal, `node.js` komplett (windows & wsl) zu deinstallieren. Im nächsten Schritt installiere ich `node.js` mithilfe von [nvm](https://github.com/nvm-sh/nvm/blob/master/README.md) unter `Remote - WSL`:

    ```bash
    # install nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
    ```
## 18.01.20

* `Problem: node.js` :bug:

  * `nvm` lässt sich weder von einem shell script noch von einem `package.json` :package: script nutzen.

    * Info: `nvm` ist eine `builin function` von bash

    * Fix: add `. ~/.nvm/nvm.sh`

      <details>
      <summary>shell script </summary>

        ```bash
        #!/bin/bash

        # /Development/test_nvm.sh

        clear; echo

        . ~/.nvm/nvm.sh # sorce ~/.nvm/nvm.sh

        # printf "%s\n\n" "$(bash -c "help")"
        # printf "%s\n\n" "$(bash "--help")"
        # printf "%s\n\n" "$(bash -c "help set")"
        # printf "%s\n\n" "$(nvm --help)"
        # printf "%s\n\n" "$(nvm --version)"
        # printf "%s\n\n" "$(nvm debug)"
        # printf "%s\n\n" "$(nvm ls)"
          printf "%s\n\n" "$(nvm exec v12.14.0 node --version)"
        # printf "%s\n\n" "$(nvm exec v12.14.0 node --help)"
        # printf "%s\n\n" "$(nvm exec v12.14.0 node   --v8-options)"

        # node --version
        ```
      </details>

      <details>
        <summary>package.json</summary>

        ```json
        ..

        "scripts": {
          ..
          "nvm-ls": "${. ~/.nvm/nvm.sh && nvm ls}"
          ..
        }

        ..
        ```
      </details>

## 19.01.20

* `node.js`

  * Info: listet alle global installierten Packages

    ```bash
    #!/bin/bash

    # test.sh

    npm ls -g --depth 0
    ```
    out:
    ```
    /home/reinralle/.nvm/versions/node/    v12.14.0/lib
    ├── npm@6.13.6
    ├── npm-check@5.9.0
    └── npm-check-updates@4.0.1
    ```
  * Problem: alle Scripts im `package.json` :package: file funktionieren nicht mehr! :bug:
    * Error: `N/A: version "N/A -> N/A" is not yet installed`
    * Ursache: hab mit `nvn` 'rumgespielt'
    * Fix:

      ```bash
      # Eingabe im WSL Terminal
      #   points "default" at the latest installed Node version

      nvm alias default node
      ```
* `Info: Markdown`

  * interaktiver Inhalt
    * [mozilla: \<details\>\</details\>, \<summery\>\</summery\>](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details)

    * [GitHub Flavored Markdown Spec](https://github.github.com/gfm/)

  * [Complete list of github markdown emoji markup ](https://gist.github.com/rxaviers/7360908)

## 20.01.20

* `Info: github-actions` :green_heart:

  * [GitHub Actions in Action](https://slides.com/bahmutov/github-actions-in-action/#/) (Slide)

  * [Creating and using encrypted secrets](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets)

  * `GitHub`

    * [Actions](https://github.com/actions)

    * [Marketplace](https://github.com/marketplace?type=actions)

      * [Create a Release](https://github.com/marketplace/actions/create-a-release)

      * [Upload a Release Asset](https://github.com/marketplace/actions/upload-a-release-asset)

    * other
      * [publish-to-github-action](https://github.com/mikeal/publish-to-github-action)

* `Info: git`
  * [GitCommitEmoji.md](https://gist.github.com/parmentf/035de27d6ed1dce0b36a)

  * `emoji's`
    | emoji               | description              |
    | :------------------:|--------------------------|
    | :tada:              | initial commit           |
    | :construction:      | Work in progress         |
    | :lipstick:          | Cosmetic                 |
    | :bug:               | Bugfix                   |
    | :green_heart:       | Continuous Integration   |
    | :package:           | Package.json in JS       |
    | :rocket:            | Deploying stuff          |
    | :arrow_up:          | Upgrading dependencies   |
    | :art:               | Improve format/structure |
    | :lock:              | Security                 |

## 21.01.20

* `Problem:` neue action scripts (*.sh) lassen sich nicht ausführen

  * `Ursache:` falsche 'permissions'

  * `Lösung:`

    <details>
    <summary>bash</summary>

    ```bash
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
    ```
    </details>

  * `Info: git`

    * [Change file permissions when working with git repo’s on windows](https://medium.com/@akash1233/change-file-permissions-when-working-with-git-repos-on-windows-ea22e34d5cee)

## 22.01.20

* `https://github.com/ReinRalle/MyExtension/suites/412606667/logs`

```bash
#!/bin/bash

# GET https://api.github.com/repos/<org>/<repo>/check-suites/<check_suite_id>/check-runs

local ORG="reinralle"
local REPO="myextension"

local LINK="https://api.github.com/repos/<org>/<repo>/check-suites/<check_suite_id>/check-runs"

```
## 26.01.20

* `node-jq`: `sudo apt install libtool`
* `export TERM=xterm-256color`
* [typescript](https://code-examples.net/de/docs/typescript/index)
* [TypeScript Tutorials](https://www.logicbig.com/tutorials/misc/typescript.html)