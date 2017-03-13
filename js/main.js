let SwiftLogger = require('./generated').SwiftLogger;

SwiftLogger.logTextContaining({
  text: "henk is een hondje",
  fred: "Henk is een fredje"
});

SwiftLogger.logUsingRecursiveProtocol({
  text1: { text: "text 1 from Javascript" },
  text2: { text: "text 2 from Javascript" }
});
