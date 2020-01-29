"use strict";
exports.__esModule = true;
var Curl = require("node-libcurl");
//import * as http from "http";
function test_console() {
    console.warn("test_console: warn");
    console.error("test_console: error");
    console.log("test_console: log");
    console.debug("test_console: debug");
}
console.clear();
test_console();
var curl = new Curl.Curl();
curl.setOpt('URL', "https://api.github.com/emojis");
curl.setOpt('FOLLOWLOCATION', true);
curl.on('end', function (statusCode, data, headers) {
    console.info(statusCode);
    console.info('---');
    console.info(data.length);
    console.info(data);
    console.info(this.getInfo('TOTAL_TIME'));
    this.close();
});
curl.on('error', curl.close.bind(curl));
curl.perform();
