let SwiftLogger = require('./generated').SwiftLogger;

SwiftLogger.logTextContaining({
  text: "henk is een hondje",
  fred: "Henk is een fredje"
});

console.log("Hello 1");

SwiftLogger.logUsingRecursiveProtocol({
  text1: { text: "text 1 from Javascript" },
  text2: { text: "text 2 from Javascript" }
}).then(() => {
  console.log("Hello 2");
});
