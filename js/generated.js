// Generated using Sourcery 0.5.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT






/**
Packs a JavaScript object conforming to the LogType protocol defined in Swift

@parameter {object} obj The object to pack
*/
function packLogType(obj) {
  return {
    
      
      text1: packTextContaining(obj.text1)
      
      ,
    
      
      text2: packTextContaining(obj.text2)
      
      
    
  };
}



/**
Packs a JavaScript object conforming to the TextContaining protocol defined in Swift

@parameter {object} obj The object to pack
*/
function packTextContaining(obj) {
  return {
    
      
      text: obj.text
      
      
    
  };
}



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



module.exports.SwiftLogger = {
  
    testFunc: function(
      
    ) {
      swiftMessage({a: "callStatic", t: "SwiftLogger", m: "testFunc",
        
      })
    },
  
    testFuncWithArgument: function(
      
        text
      
    ) {
      swiftMessage({a: "callStatic", t: "SwiftLogger", m: "testFuncWithArgument",
        
        args: {
          
            
            text
            
            
          
        }
        
      })
    },
  
    logTextContaining: function(
      
        containing
      
    ) {
      swiftMessage({a: "callStatic", t: "SwiftLogger", m: "logTextContaining",
        
        args: {
          
            
            containing: packTextContaining(containing)
            
            
          
        }
        
      })
    },
  
    logUsingRecursiveProtocol: function(
      
        object
      
    ) {
      swiftMessage({a: "callStatic", t: "SwiftLogger", m: "logUsingRecursiveProtocol",
        
        args: {
          
            
            object: packLogType(object)
            
            
          
        }
        
      })
    },
  
};


