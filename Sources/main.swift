//
//  main.swift
//  SwiftJS
//
//  Created by Robbert Brandsma on 13-03-17.
//
//

import Foundation

Process.launchedProcess(launchPath: "/usr/local/bin/node", arguments: ["js/main.js"])

try! SwiftJS.run()
