//
//  main.swift
//  cpu-info
//
//  Created by Thomas Wolfis on 16/03/2025.
//

import Foundation
import ArgumentParser

@main
struct InfoParser: ParsableCommand {
   
    @Flag(name: .shortAndLong, help: "get cpu information")
    var cpu: Bool = false
    
    @Flag(name: .shortAndLong, help: "get gpu information")
    var gpu: Bool = false
    
    func run() {
        if cpu {
            getCPUInfo()
        }
        if gpu {
            getGPUInfo()
        }
        if !cpu && !gpu {
            getCPUInfo()
            print(String(repeating: "-", count: 30))
            getGPUInfo()
        }
    }
}
