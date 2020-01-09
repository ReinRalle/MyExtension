// import http = require('http');
// import fs = require('fs');

import assert = require("assert");

function test_color(): void {

    var colors = require('colors/safe');

    colors.setTheme({
        silly: 'rainbow',
        input: 'grey',
        verbose: 'cyan',
        prompt: 'grey',
        info: 'green',
        data: 'grey',
        help: 'cyan',
        warn: 'yellow',
        debug: 'blue',
        error: 'red',
        custom: ['yellow', 'bold']
    });

    console.log(colors.rainbow("test_color: rainbow color"));
    console.log(colors.custom("test_color: custom color"));
    console.log("");
}

function test_console(): void {

    console.warn("test_console: warn");
    console.error("test_console: error");
    console.log("test_console: log");
    console.debug("test_console: debug");

}
function test_generator(): void {

    const simpleGenerator = function* () {
        yield 5;
        yield 10;
        return 20;
    };
    const generator = simpleGenerator();

    console.log(generator.next());
    console.log(generator.next());
    console.log(generator.next());

}

function test_class(): void {

    class Person {

        public Name: string;
        public Age: number;
        public City: string;

        constructor(name: string, age: number, city: string) {
            this.Name = name;
            this.Age = age;
            this.City = city;
        }
    }
    var p: Person = new Person("ReinRalle", 59, "Issum");

    try {
        assert.equal(p.Age, 599, "falsches Alter");
    }
    catch (ex) {
        console.log(ex.message);
    }
}

function test_array(): void {

    let primes = [2, 3, 5, 7, 11];

    console.log(primes);

}
// let fi = http.get("http://www.google.com", res => {
//     console.log(res.statusCode); // => 200
// });


console.clear();

test_color();
test_console();
// test_generator();
// test_class();
// test_array();
