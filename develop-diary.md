# Developer's Diary

## 11.01.20 (12:45h)

### change `.git/config`

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
