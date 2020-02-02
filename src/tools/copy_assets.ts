import * as shell from "shelljs";

// const buildFolder = '../../../dist/dev/';

// const files = new Set(['.env', 'LICENSE', 'README.md', 'package.json', 'package-lock.json']);
// const folders = new Set(['./src/views', './src/public', "123", "234", "34fffffffffffffffffffffffff5"]);

shell.echo('\nlist directories\n------------');
var x = new Set(process.argv);
var c = process;

shell.echo(__dirname);

console.log(x);
console.log(c.cwd);

// if (1) { shell.exit(5); }

//  shell.ls("-Rd", './src/**/').forEach(function (file) { console.log(file); });

// console.log(buildFolder, "\n");
// console.log(files);
// console.log(folders);
// console.log(folders);
// 
// //if (1) { shell.exit(); }
// 
// // Copy Files
// files.forEach((file) => {
//     //  shell.cp('-R', file, buildFolder);
//     console.log(file);
// });
// 
// // Copy Folders
// folders.forEach((folder) => {
//     //   shell.cp('-R', folder, buildFolder);
//     console.error(folder);
// });

