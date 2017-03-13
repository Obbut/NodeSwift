/// sourcery: jsAvailable
class SwiftLogger {
    
    /// sourcery: jsAvailable
    static func testFunc() {
        print("Hello there, from Swift")
    }
    
    /// sourcery: jsAvailable
    static func testFuncWithArgument(text: String) {
        print("Javascript says: \(text)")
    }
    
    /// sourcery: jsAvailable
    static func logTextContaining(containing: TextContaining) {
        print("TextContaining with text: \(containing.text)")
    }
    
    /// sourcery: jsAvailable
    static func logUsingRecursiveProtocol(object: LogType) {
        print("text1: \(object.text1.text)")
        print("text2: \(object.text2.text)")
    }
    
}

/// sourcery: jsAvailable
protocol TextContaining {
    
    var text: String { get }
    
}

/// sourcery: jsAvailable
protocol LogType {
    
    var text1: TextContaining { get }
    var text2: TextContaining { get }
    
}
