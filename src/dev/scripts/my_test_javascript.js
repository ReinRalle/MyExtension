"use strict";

function test_function(arg) {
    console.log(arg);
}

function test_colors() {

    const colors = require('colors');

    console.log("bold.red".bold.red);
    console.log("bold.green".bold.green);
    console.log("bold.blue".bold.blue);

}

function test_environment() {

    const os = require('os');

    console.log(os.homedir());
    console.log(os.arch());
    console.log(os.platform());
    os.totalmem


    console.log(process.args);
    console.log(process.versions);
    console.log(process.env);

}

function test_execfile(xy) {

    var execFile = require('child_process').execFile;

    console.log("test_execfile");

    console.log(xy);

    const child = execFile('code', ['--help'], (error, stdout, stderr) => {

        if (error) {
            throw error;
        }
        console.log(stdout);

    });

}

function test_execfile2(file, args) {

    var xx = arguments;
    var execFile = require('child_process').execFile;
    const colors = require('colors');

    console.log("test_execfile");

    console.log(file);

    const child = execFile(file, args, (error, stdout, stderr) => {

        if (error) {
            console.log("error(" + error.code + ")");
        }
        console.log(stdout);

    });

}

test_execfile2("git", ["status"]);
return
test_execfile2("man", ['--help', 'ls']);
test_execfile2("ls", ['-al']);
test_execfile2("wslpath");
test_execfile2("git", ["status", "--help"]);
test_execfile2("which", ['dir']);
test_execfile2("ls", ['-la', "/home/reinralle"]);
test_execfile2("cat", ['/home/reinralle/weasel_start.sh']);
test_execfile2("notepad.exe", ["test.txt"]);

// test_function("hallo welt");
// test_colors();
// test_environment();
// test_execfile("hallo");