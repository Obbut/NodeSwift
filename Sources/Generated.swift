// Generated using Sourcery 0.5.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Cheetah

func callStatic(typeName: String, methodName: String, arguments: JSONObject?) throws {
  switch (typeName, methodName) {
  
    
      case ("SwiftLogger", "testFunc"):
        SwiftLogger.testFunc(
          
        )
    
      case ("SwiftLogger", "testFuncWithArgument"):
        SwiftLogger.testFuncWithArgument(
          
            
              text: String(arguments!["text"])!
            
            
          
        )
    
      case ("SwiftLogger", "logTextContaining"):
        SwiftLogger.logTextContaining(
          
            
              containing: try TextContainingFromJavascript(unpacking: arguments!["containing"] as! JSONObject)
            
            
          
        )
    
      case ("SwiftLogger", "logUsingRecursiveProtocol"):
        SwiftLogger.logUsingRecursiveProtocol(
          
            
              object: try LogTypeFromJavascript(unpacking: arguments!["object"] as! JSONObject)
            
            
          
        )
    
  

  default:
    fatalError()
  }
}



class LogTypeFromJavascript : LogType {
    
    var text1: TextContaining
    
    var text2: TextContaining
    

    init(unpacking json: JSONObject) throws {
        guard
          
            
              let text1JSONObject = json["text1"] as? JSONObject,
              let text1 = try? TextContainingFromJavascript(unpacking: text1JSONObject)
            
            ,
          
            
              let text2JSONObject = json["text2"] as? JSONObject,
              let text2 = try? TextContainingFromJavascript(unpacking: text2JSONObject)
            
            
          
        else {
            fatalError("JavaScript object does not conform to protocol 'LogType'")
        }

        
          self.text1 = text1
        
          self.text2 = text2
        
    }
}



class TextContainingFromJavascript : TextContaining {
    
    var text: String
    

    init(unpacking json: JSONObject) throws {
        guard
          
            
              let text = String(json["text"])
            
            
          
        else {
            fatalError("JavaScript object does not conform to protocol 'TextContaining'")
        }

        
          self.text = text
        
    }
}


