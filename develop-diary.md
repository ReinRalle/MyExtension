# Developer's Diary

## 11.01.20

* change `.git/config`

  ```python
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

* activate github's `action` in repo

  * [github actions](https://help.github.com/en/actions)

## 15.01.20

* TODO: "tasks.json" unter wsl wird vom "task explorer" noch nicht unterstützt
	* warten auf update der extension "spmeesseman.vscode-taskexplorer"
	* infolge dessen kann ich die tasks nur unzureichend unter wsl testen
	* erhalte im Moment folgende Fehlermeldung:
		* `command 'extension.commandvariable.file.fileDirnamePosix' not found`
		* deutet auf ein anderes Prob hin
	* könnte es mal unter einer reinen windows Umgebung testen (ohne wsl Nutzung)
	* solved: `"MyVar6": "${command:extension.commandvariable.file.fileDirnamePosix}"` in tasks.json produzierte den Fehler - Lösung: erstmal auskommentieren
