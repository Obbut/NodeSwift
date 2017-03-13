// Generated using Sourcery 0.5.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


var s = null;

function swiftMessage(msg) {
  if (s == null) {
    s = require('net').Socket();
    s.connect(8403, 'localhost');
  }

  var json = JSON.stringify(msg);

  var lenbuf = Buffer.allocUnsafe(4);
  lenbuf.writeInt32LE(json.length, 0);

  s.write(lenbuf);
  s.write(json);
}



module.exports.SwiftClass = {
  
    testFunc: function(
      
    ) {
      swiftMessage({a: "callStatic", t: "SwiftClass", m: "testFunc",
        
      })
    },
  
    testFuncWithArgument: function(
      
        text
      
    ) {
      swiftMessage({a: "callStatic", t: "SwiftClass", m: "testFuncWithArgument",
        
        args: {
          
            text
          
        }
        
      })
    },
  
};


