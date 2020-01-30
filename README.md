![CI](https://github.com/ReinRalle/MyExtension/workflows/CI/badge.svg?branch=master)

# My Extension

***Aktuell:*** Vielleicht ist auch der [Entwicklungsverlauf](src/dev/docs/Diary.md) interessant!

Mache es mal kurz in deutsch:

* Dies ist meine erste Extension für **vscode**.
* Bin programmtechnischer **Anfänger** in folgenden Bereichen (eigentlich in allem :grin:):

  * `markdown`
  * `vscode`
  * `javascript`
    * `node.js`
    * `npm`
    * `TypeScript`
  * `git`

* Diese Extension soll dazu dienen, überhaupt erst einmal ein **Grundgerüst** zu erstellen/verstehen (learning by doing).

* Dazu gehört auch die Veröffentlichung (`publishing`)  auf dem [VsCode Marketplace](https://marketplace.visualstudio.com/vscode).

* Ansonsten verfolgt die Extension vorerst kein besonderes Ziel.
* Die Nutzung sollte nur zu Lernzwecken erfolgen (natürlich auf eigene Gefahr).

Sollte jemand etwas zu kommentieren/kritisieren haben, kann er das sehr gerne tun.

## `Entwicklung`:

* verwendete Requisiten
  * [WSL](https://docs.microsoft.com/de-de/archive/blogs/wsl/)
  * [git](https://git-scm.com/)

  * [VsCode](https://code.visualstudio.com/)
  * [node.js](https://nodejs.org/en/)
    * [npm](https://www.npmjs.com/)
    * [vscode-generator-code](https://github.com/microsoft/vscode-generator-code)
    * [vscode-vsce](https://github.com/microsoft/vscode-vsce)
    * [colors](https://www.npmjs.com/package/colors)

* cloning repo: `git clone git@github.com:ReinRalle/`
* Abhängigkeiten installieren: `npm install`
* VsCode im aktuellen Verzeichnis starten: `code .`
* Extension 'paketisieren' (VSIX): `vsce package`
* Extension publizieren auf [MarketPlace](marketplace.visualstudio.com): `vsce publish`

## License

MIT