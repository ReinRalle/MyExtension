"use strict";
function print_console() {
    console.log("start app.js");
    console.warn("show warnings...");
    console.error("show errors...");
    console.error("show errors..");
    console.error("show errors........");
}
debugger;
try {
    var doc = document.getElementById("demo");
    if (doc !== null) {
        doc.innerHTML = "5 + 16";
    }
}
catch (error) {
    console.error(error);
}
//# sourceMappingURL=app.js.map