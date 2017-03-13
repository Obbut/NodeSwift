//
//  main.swift
//  SwiftJS
//
//  Created by Robbert Brandsma on 13-03-17.
//
//

import Foundation

Thread {
    print("starting")
    try! SwiftJS.run()
}.start()

Process.launchedProcess(launchPath: "/usr/local/bin/node", arguments: ["js/main.js"])

while true {
    Thread.sleep(forTimeInterval: 10)
}
