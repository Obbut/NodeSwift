let SwiftLogger = require('./ecmaswift').SwiftLogger;

SwiftLogger.logTextContaining({
  text: "henk is een hondje",
  fred: "Henk is een fredje"
});

console.log("Hello 1");

SwiftLogger.logUsingRecursiveProtocol({
  text1: { text: "text 1 from Javascript" },
  text2: { text: "text 2 from Javascript" },
  sayHello: () => {
    console.log("Hello, I'm saying hello because I'm asked to");
  }
}).then(() => {
  console.log("Hello 2");
});
