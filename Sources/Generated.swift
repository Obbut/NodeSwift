// Generated using Sourcery 0.5.8 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Cheetah

func callStatic(typeName: String, methodName: String, arguments: JSONObject?, client: JavascriptClient) throws {
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
              containing: try TextContainingFromJavascript(unpacking: arguments!["containing"] as! JSONObject, client: client)
        )
      case ("SwiftLogger", "logUsingRecursiveProtocol"):
        SwiftLogger.logUsingRecursiveProtocol(
              object: try LogTypeFromJavascript(unpacking: arguments!["object"] as! JSONObject, client: client)
        )

  default:
    fatalError()
  }
}


class LogTypeFromJavascript : LogType {

    private var jsIdentifier: Int
    private var client: JavascriptClient

    var text1: TextContaining
    var text2: TextContaining

    init(unpacking json: JSONObject, client: JavascriptClient) throws {
        guard
          let jsIdentifier = Int(json["oid"])
          ,
                let text1JSONObject = json["text1"] as? JSONObject,
                let text1 = try? TextContainingFromJavascript(unpacking: text1JSONObject, client: client)
              ,
                let text2JSONObject = json["text2"] as? JSONObject,
                let text2 = try? TextContainingFromJavascript(unpacking: text2JSONObject, client: client)
        else {
            fatalError("JavaScript object does not conform to protocol 'LogType'")
        }

        self.jsIdentifier = jsIdentifier
        self.client = client
          self.text1 = text1
          self.text2 = text2
    }

      func sayHello() {
          try! client.callMethod("sayHello", on: self.jsIdentifier)
      }
}


class TextContainingFromJavascript : TextContaining {

    private var jsIdentifier: Int
    private var client: JavascriptClient

    var text: String

    init(unpacking json: JSONObject, client: JavascriptClient) throws {
        guard
          let jsIdentifier = Int(json["oid"])
          ,
                let text = String(json["text"])
        else {
            fatalError("JavaScript object does not conform to protocol 'TextContaining'")
        }

        self.jsIdentifier = jsIdentifier
        self.client = client
          self.text = text
    }

}

