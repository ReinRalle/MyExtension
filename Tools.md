
# *Development tools*

## *uglifier*

* [Terser](https://terser.org/) [(github)](https://github.com/terser/terser)

  * installation : `npm install terser` (local)

  * `package.json`

    ```JSON
    "scripts": {
      "terser": "mkdir -p dist/js && terser out/*.js -m   -o dist/js/app.js"
    }
    ```
## *Linter*

* [ESLint](https://eslint.org/) (JavaScript & TypeScript) [(github)](https://github.com/eslint/eslint)

  * [Using ESLint and Prettier in a TypeScript Project ](https://dev.to/robertcoopercode/using-eslint-and-prettier-in-a-typescript-project-53jb)

* [TSLint](https://palantir.github.io/tslint/) (TypeScript) [(github)](https://github.com/palantir/tslint)

## *Prettifier*

* [Prettier](https://prettier.io/) [(github)](https://github.com/prettier/prettier)


## *Extension's*

* [vsce](https://code.visualstudio.com/api/working-with-extensions/publishing-extension) [(github)](https://github.com/microsoft/vscode-vsce)

## *JavaScript*

* [Node.js](https://nodejs.org/en/)

  * [npm](https://www.npmjs.com/) (Package Manager)

  * `npm ls -g --depth 0` (list global node installed)
  * `npm ls --depth 0` (list local node installed)
  * `npm ls -gp --depth 0` (...)

* [Mocha](https://mochajs.org/) [(github)](https://github.com/mochajs/mocha) (JavaScript test framework)

* [YEOMAN](https://yeoman.io/) [(github)](https://github.com/yeoman/yo) (kickstart new projects)

  * [Visual Studio Code extension generator](https://github.com/Microsoft/vscode-generator-code)

## Visual Studio Code

* [Integrate with External Tools via Tasks](https://code.visualstudio.com/docs/editor/tasks)
