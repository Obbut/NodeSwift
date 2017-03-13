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

extension Int32 {
    internal func makeBytes() -> [UInt8] {
        let integer = self.littleEndian
        
        return [
            UInt8(integer & 0xFF),
            UInt8((integer >> 8) & 0xFF),
            UInt8((integer >> 16) & 0xFF),
            UInt8((integer >> 24) & 0xFF),
        ]
    }
}

internal class JavascriptClient {
    
}

class SwiftJS {
    static func run() throws {
        let server = try SynchronousTCPServer(port: 8403)
        
        try server.startWithHandler { client in
            let js = JavascriptClient()
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
                    
                    try callStatic(typeName: String(json["t"])!, methodName: String(json["m"])!, arguments: json["args"] as? JSONObject)
                    
                    if let id = Int(json["id"]) {
                        let responseMessage: JSONObject = [
                            "id": id
                        ]
                        let responseMessageBytes = responseMessage.serialize()
                        try client.send(bytes: Int32(responseMessageBytes.count).makeBytes() + responseMessageBytes)
                    }
                }
            } catch {
                print("error: \(error)")
            }
        }
    }
}
