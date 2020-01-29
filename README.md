# My Extension

***Aktuell:*** Vielleicht auch interessant [Entwicklungsverlauf](src/dev/docs/diary.md)

Mache es mal kurz in deutsch:

* Dies ist meine erste Extension für **vscode**.
* bin programmtechnischer **Anfänger** in folgenden Bereichen:

  * `markdown`
  * `vscode`
  * `javascript`
    * `node.js`
    * `npm`
    * `TypeScript`
  * `git`

* Diese Extension verfolgt das Ziel, überhaupt erst einmal ein **Grundgerüst** zu erstellen und zu verstehen (learning by doing).

* dazu gehört auch das **publishing**, was hier auf github erfolgt.

* ansonsten hat die Extension keinen besonderen Zweck
* Die Nutzung sollte nur zu Lernzwecken erfolgen (natürlich auf eigene Gefahr).

Sollte jemand etwas zu kommentieren/kritisieren haben, kann er das hier sehr gerne tun.

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