"use strict";

const os = require('os');
const colors = require('colors');
var execFile = require('child_process').execFile;

function te(){
    var xxx = process.versions;
    var args = process.argv;
    var env = process.env;

    console.log(args[1]);
    console.log("\nos.homedir() => '" + os.homedir() + "'");
    console.log(os.platform().bold.red);
    console.log(os.arch());
    console.log(xxx);
    console.log(env);
}
te;

//const child = execFile('code.cmd', ['--help'], (error, stdout, stderr) => {
//
//  if (error) {
//    throw error;
//  }
//  console.log(stdout);
//
//});