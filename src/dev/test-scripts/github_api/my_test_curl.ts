
import * as Curl from "node-libcurl";

//import * as http from "http";

function test_console(): void {

    console.warn("test_console: warn");
    console.error("test_console: error");
    console.log("test_console: log");
    console.debug("test_console: debug");

}

console.clear();

test_console();

const curl = new Curl.Curl();

curl.setOpt('URL', "https://api.github.com/emojis");
curl.setOpt('FOLLOWLOCATION', true);

curl.on('end', function (statusCode, data, headers) {
    console.info(statusCode);
    console.info('---');
    console.info(data.length);
    console.info(data);
    console.info(this.getInfo( 'TOTAL_TIME'));
    console.info(headers);
    this.close();
  });

  curl.on('error', curl.close.bind(curl));
  curl.perform();
