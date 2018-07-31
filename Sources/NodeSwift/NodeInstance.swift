import Foundation

public class NodeInstance {
    private var process: Process?
    private var standardInput = Pipe()
    private let encoder = JSONEncoder()
    
    public init() throws {
        try self.launch()
    }
    
    private func launch() throws {
        guard self.process == nil || self.process?.isRunning == false else {
            return // Not needed
        }
        
        let process = Process()
        
        var environment = ProcessInfo.processInfo.environment
        var path = environment["PATH"] ?? ""
        if !path.contains("/usr/local/bin") {
            path.append(":/usr/local/bin")
        }
        environment["PATH"] = path
        
        process.environment = environment
        process.launchPath = "/bin/sh"
        process.arguments = ["-c", "node NodeSupport/app.js"]
        process.standardInput = self.standardInput
        
        process.launch()
        
        self.process = process
    }
    
    private func write<T: Encodable>(_ data: T) throws {
        let json = try encoder.encode(data)
        standardInput.fileHandleForWriting.write(json)
    }
    
    func eval(_ string: String) throws {
        try write(["eval": string])
    }
    
    var globals: JavascriptObject {
        return JavascriptObject(instance: self, path: "")
    }
}

public typealias JavascriptFunction = (String...) throws -> Void

@dynamicMemberLookup
public class JavascriptObject {
    
    var instance: NodeInstance
    var path: String
    
    init(instance: NodeInstance, path: String) {
        self.instance = instance
        self.path = path
    }
    
    public subscript(dynamicMember member: String) -> JavascriptObject {
        return JavascriptObject(instance: self.instance, path: self.path.count == 0 ? member : "\(self.path).\(member)")
    }
    
    public subscript(dynamicMember member: String) -> JavascriptFunction {
        return { (args: String...) -> Void in
            try self.instance.eval("\(self.path).\(member)(\"\(args.joined(separator: ","))\")")
        }
    }
    
}
