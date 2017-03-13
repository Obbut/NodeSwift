// Generated using Sourcery 0.5.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Cheetah

func callStatic(typeName: String, methodName: String, arguments: JSONObject?) {
  switch (typeName, methodName) {
  
    
      case ("SwiftClass", "testFunc"):
        SwiftClass.testFunc(
          
        )
    
      case ("SwiftClass", "testFuncWithArgument"):
        SwiftClass.testFuncWithArgument(
          
            text: String(arguments!["text"])!
          
        )
    
  

  default:
    fatalError()
  }
}
