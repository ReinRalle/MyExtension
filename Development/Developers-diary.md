# Developer's Diary

## 11.01.20

* change `.git/config` <details>
  <summary>.git/config</summary>

   ```yaml
   # vscode: select language format: Properties

   [core]
     repositoryformatversion = 0
     filemode = true
     bare = false
     logallrefupdates = true
     ignorecase = true

   [remote "origin"]
     url = git@github.com:ReinRalle/MyExtension.git
     fetch = +refs/heads/*:refs/remotes/origin/*

   [remote "github"] # add for testing 11.01.20, 12:30h
     url = git@github.com:ReinRalle/MyExtension
     fetch = refs/heads/*:refs/remotes/github/*

   [branch "master"] # add for testing 11.01.20, 12:30h
      remote = origin
      merge = refs/heads/master
  ```
  </details>

* activate github's `action` in repo

  [github actions](https://help.github.com/en/actions)

## 15.01.20

* ~~TODO~~: "tasks.json" unter wsl wird vom "task explorer" noch nicht unterstützt
	* warten auf update der extension "spmeesseman.vscode-taskexplorer"
	* infolge dessen kann ich die tasks nur unzureichend unter wsl testen
	* erhalte im Moment folgende Fehlermeldung:
		* `command 'extension.commandvariable.file.fileDirnamePosix' not found`
		* deutet auf ein anderes Prob hin
	* könnte es mal unter einer reinen windows Umgebung testen (ohne wsl Nutzung)
	* solved: `"MyVar6": "${command:extension.commandvariable.file.fileDirnamePosix}"` in tasks.json produzierte den Fehler - Lösung: erstmal auskommentieren

* `github action`: kann nicht verstehen, was das Pipe Symbol bei `run: |` soll!
	* Erklärung unter: [github-actions](https://dev.to/bnb/an-unintentionally-comprehensive-introduction-to-github-actions-ci-blm)
	* hat mit yaml syntax zu tun
	* [Learn YAML in five minutes!](https://www.codeproject.com/Articles/1214409/Learn-YAML-in-five-minutes)

* git: show all config properties in different files:

  `git --no-pager config --list --show-origin`

* markdown
	* Strikethrough uses two tildes
	* [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

* GitHub Actions: [Working with GitHub Actions](https://jeffrafter.com/working-with-github-actions/)

## 16.01.20

* **node.js:** [Why and How to Migrate from NPM to Yarn](https://waverleysoftware.com/blog/yarn-vs-npm/)

* **github-actions:**
  * [GitHub Marketplace](https://github.com/marketplace?type=actions)

  * [actions/create-release](https://github.com/actions/create-release)
  * [Manual workflow triggers in Github Actions](https://stackoverflow.com/questions/58933155/manual-workflow-triggers-in-github-actions/59621799#59621799)

  * <details>
    <summary>Action Example</summary>

    ```yaml
      name: Test

      on:
        watch
          types: [started]

      jobs:
        build:
          runs-on: ubuntu-latest

          if: github.actor ==   github.event.repository.owner.login

          steps:
             - name: Checkout repository
               uses: actions/checkout@v2
               # add more ...
      ```
    </details>

  * [Automating the build and publish process with GitHub Actions (and GitHub Package Registry)](https://stackoverflow.com/questions/58347746/automating-the-build-and-publish-process-with-github-actions-and-github-package)

  * [commit changes made in your **`workflow run`** directly to your repo](https://github.com/EndBug/add-and-commit)

  * [GitHub Action to automate deploying VS Code extensions](https://github.com/lannonbr/vsce-action)

  * **Examples:**
    * github-actions: [vscode-extension-example 1](https://github.com/daimor/vscode-objectscript/actions)

    * github-actions: [vscode-extension-example 2](https://github.com/ggbecker/content-navigator/actions)

    * github-actions: [vscode-extension-example 3](https://github.com/kinoooshnik/vs_plugin_search_for_errors_on_stackoverflow/actions)

* **github-api:** [GitHub REST API v3](https://developer.github.com/v3/)

  * [Accessing GitHub's REST API with CURL](https://blogs.infosupport.com/accessing-githubs-rest-api-with-curl/)

  * example:

    in this example, the 'vmg' and 'redcarpet' values are provided for the :owner and :repo parameters in the path while :state is passed in the query string.

    ```bash
    # curl -i "https://api.github.com/repos/:owner/:repo/issues?state=:state"
	  curl -i "https://api.github.com/repos/vmg/redcarpet/issues?state=closed"
    ```

  * <details>

    <summary>curl examples</summary>

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

  * [GitHub Rest Api Example and Uses](https://www.restapiexample.com/use-of-rest-api/github-rest-api-example-uses/)
  * [Integrating REST APIs into CI/CD pipelines](https://circleci.com/blog/cicd-rest-apis/)


## 17.01.20

* `WSL - bash`

  * **~~Problem~~**: mein `weasel` script (`~/weaser_start.sh`) scheint nicht ausgeführt zu werden.

  * **Ursache**: bash .profile file`~/.profile` wird nicht aufgerufen, wenn unter vscode ein neues Terminal unter "remote wsl" geöffnet wird.

  * **Lösung**: hinzufügen folgender Zeile in den:
    *  ~~"workspace settings" (`.vscode/settings.json`)~~
    * "user settings" (`/C:/Users/:USER/AppData/Roaming/Code/User/settings.json`) (windows):

    ```json
    "terminal.integrated.shellArgs.linux": ["-l"]
    ```
    Anotation (1): [can only be defined in user settings](https://code.visualstudio.com/docs/editor/integrated-terminal#_configuration)

    Anotation (2): argument `-l` => login shell (run `~/.profile`)

* `node.js`
  * um mögliche Überchneidungen auszuschliessen, versuche ich mal, `node.js` komplett (windows & wsl) zu deinstallieren.

  * im nächsten Schritt installiere ich `node.js` mithilfe von [nvm](https://github.com/nvm-sh/nvm/blob/master/README.md) unter `Remote - WSL`:

    ```bash
    # install nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
    ```
## 18.01.20

`node.js`

* **Problem**: `nvm` lässt sich weder von einem shell script noch von einem `package.json` script nutzen.

* **Info**: `nvm` ist eine `builin function` von bash

* **Lösung**:

  <details>
  <summary>shell script: /Development/test_nvm.sh</summary>

  ```bash
  #!/bin/bash

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
  # printf "%s\n\n" "$(nvm exec v12.14.0 node --v8-options)"

  # node --version
  ```
  </details>

  `package.json`:

  ```json
  ..

  "scripts": {
    "nvm-ls": "${. ~/.nvm/nvm.sh && nvm ls}"
  }

  ..
  ```

## 19.01.20

