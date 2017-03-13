//
//  Server.swift
//  SwiftJS
//
//  Created by Robbert Brandsma on 13-03-17.
//
//

import Socks
import Cheetah

public func fromBytes<T, S : Collection>(_ bytes: S) throws -> T where S.Iterator.Element == UInt8, S.IndexDistance == Int {
    guard bytes.count >= MemoryLayout<T>.size else {
        fatalError()
    }
    
    return UnsafeRawPointer([UInt8](bytes)).assumingMemoryBound(to: T.self).pointee
}

internal class JavascriptClient {
    
}

class SwiftJS {
    static func run() throws {
        let server = try SynchronousTCPServer(port: 8403)
        
        try server.startWithHandler { client in
            do {
                var buffer = [UInt8]()
                
                func bufferHasMessage() throws -> Bool {
                    guard buffer.count >= 4 else { return false }
                    let length: Int32 = try fromBytes(buffer[0..<4])
                    guard buffer.count >= Int(length)+4 else { return false }
                    return true
                }
                
                while true {
                    // receive data
                    if !(try bufferHasMessage()) {
                        let data = try client.receiveAll()
                        buffer += data
                    }
                    
                    guard try bufferHasMessage() else { continue }
                    
                    let length: Int32 = try fromBytes(buffer[0..<4])
                    
                    let messageData = Array(buffer[4..<Int(length+4)])
                    buffer.removeSubrange(0..<Int(length)+4)
                    
                    let json = try JSON.parse(from: messageData, allowingComments: false) as! JSONObject
                    
                    callStatic(typeName: String(json["t"])!, methodName: String(json["m"])!, arguments: json["args"] as? JSONObject)
                }
            } catch {
                print("error: \(error)")
            }
        }
    }
}
