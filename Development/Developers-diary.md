# Developer's Diary

## 11.01.20


* `git`

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

* `github actions`

  * Info: [github actions](https://help.github.com/en/actions)
  * Info: [Working with GitHub Actions](https://jeffrafter.com/working-with-github-actions/)

  * change: activate github's `action` in repo

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

* `github action`

  * Problem: kann nicht verstehen, was das Pipe Symbol bei `run: |` soll!
	* Erklärung unter: [github-actions](https://dev.to/bnb/an-unintentionally-comprehensive-introduction-to-github-actions-ci-blm)
	* hat mit yaml syntax zu tun
	* Info: [Learn YAML in five minutes!](https://www.codeproject.com/Articles/1214409/Learn-YAML-in-five-minutes)

* `git`
  * Info: show all config properties in different files:

    `git --no-pager config --list --show-origin`

* `markdown`
	* Info: Strikethrough uses two tildes
	* Info: [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

## 16.01.20

* `node.js`
  * Info: [Why and How to Migrate from NPM to Yarn](https://waverleysoftware.com/blog/yarn-vs-npm/)

* `github-actions`
  * Info: [GitHub Marketplace](https://github.com/marketplace?type=actions)

  * Info: [actions/create-release](https://github.com/actions/create-release)
  * Info: [Manual workflow triggers in Github Actions](https://stackoverflow.com/questions/58933155/manual-workflow-triggers-in-github-actions/59621799#59621799)

  * Info: [Automating the build and publish process with GitHub Actions (and GitHub Package Registry)](https://stackoverflow.com/questions/58347746/automating-the-build-and-publish-process-with-github-actions-and-github-package)

  * Info: [commit changes made in your **`workflow run`** directly to your repo](https://github.com/EndBug/add-and-commit)

  * Info: [GitHub Action to automate deploying VS Code extensions](https://github.com/lannonbr/vsce-action)

  * <details>
    <summary>Examples</summary>

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
* `github-api`

  * Info: [GitHub REST API v3](https://developer.github.com/v3/)

  * Info: [Accessing GitHub's REST API with CURL](https://blogs.infosupport.com/accessing-githubs-rest-api-with-curl/)

  * Info: [GitHub Rest Api Example and Uses](https://www.restapiexample.com/use-of-rest-api/github-rest-api-example-uses/)

  * Info: [Integrating REST APIs into CI/CD pipelines](https://circleci.com/blog/cicd-rest-apis/)

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

* `WSL - bash`

  * ~~Problem~~: mein `weasel` script (`~/weaser_start.sh`) scheint nicht ausgeführt zu werden.

  * Ursache: bash .profile file`~/.profile` wird nicht aufgerufen, wenn unter vscode ein neues Terminal unter "remote wsl" geöffnet wird.

  * Fix: hinzufügen folgender Zeile in den:
    *  ~~Change: "workspace settings" (`.vscode/settings.json`)~~
    * Change: "user settings" (`/C:/Users/:USER/AppData/Roaming/Code/User/settings.json`) (windows):

      ```json
      "terminal.integrated.shellArgs.linux": ["-l"]
      ```
      Anotation (1): [can only be defined in user settings](https://code.visualstudio.com/docs/editor/integrated-terminal#_configuration)

      Anotation (2): argument `-l` => login shell (run `~/.profile`)

* `node.js`
  * Change: um mögliche Überchneidungen auszuschliessen, versuche ich mal, `node.js` komplett (windows & wsl) zu deinstallieren. Im nächsten Schritt installiere ich `node.js` mithilfe von [nvm](https://github.com/nvm-sh/nvm/blob/master/README.md) unter `Remote - WSL`:

    ```bash
    # install nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
    ```
## 18.01.20

* `node.js`

  * Problem: `nvm` lässt sich weder von einem shell script noch von einem `package.json` script nutzen.

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

    ```
    > npm ls -g --depth 0

    /home/reinralle/.nvm/versions/node/    v12.14.0/lib
    ├── npm@6.13.6
    ├── npm-check@5.9.0
    └── npm-check-updates@4.0.1
    ```
  * Problem: alle Scripts im `package.json` file funktionieren nicht mehr!
    * Error: `N/A: version "N/A -> N/A" is not yet installed`
    * Ursache: hab mit `nvn` 'rumgespielt'
    * Fix:

      ```bash
      # Eingabe im WSL Terminal

      # points "default" at the latest installed Node version

      nvm alias default node
      ```
* `Markdown`

  * Info: interaktiver Inhalt
    * Info: [mozilla: \<details\>\</details\>, \<summery\>\</summery\>](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details)
    * Info: [GitHub Flavored Markdown Spec](https://github.github.com/gfm/)