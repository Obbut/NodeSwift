// Generated using Sourcery 0.5.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


function swiftMessage(msg) {
  var json = JSON.stringify(msg);

  var lenbuf = Buffer.allocUnsafe(4);
  lenbuf.writeInt32LE(json.length, 0);

  var s = require('net').Socket();
  s.connect(8403, 'localhost');
  s.write(lenbuf);
  s.write(json);
  s.end();
}



module.exports.SwiftClass = {
  
    testFunc: function() {
      swiftMessage({a: "callStatic", t: "SwiftClass", m: "testFunc"})
    }
  
};


