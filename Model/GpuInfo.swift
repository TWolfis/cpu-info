//
//  GpuInfo.swift
//  cpu-info
//
//  Created by Thomas Wolfis on 17/03/2025.
//

#if canImport(metal)
import Foundation
import Metal

func getGPUInfo() {
    if let device = MTLCreateSystemDefaultDevice() {
        print("GPU Name: \(device.name)")
        
#if os(macOS)
print("Is Low Power: \(device.isLowPower ? "Yes" : "No")")
#endif
        print("Max Threads Per Threadgroup: \(device.maxThreadsPerThreadgroup)")
        print("Max Buffer Length: \(device.maxBufferLength) bytes")
        print("Has Unified Memory: \(device.hasUnifiedMemory ? "Yes" : "No")")
    } else {
        print("No Metal-compatible GPU found.")
    }
}

func stringGPUInfo() -> String {
    var info = ""
    
    if let device = MTLCreateSystemDefaultDevice() {
        info += "GPU Name: \(device.name)\n"
        
        #if os(macOS)
        info += "Is Low Power: \(device.isLowPower ? "Yes" : "No")\n"
        #endif
        
        info += "Max Threads Per Threadgroup: \(device.maxThreadsPerThreadgroup)\n"
        info += "Max Buffer Length: \(device.maxBufferLength) bytes\n"
        info += "Has Unified Memory: \(device.hasUnifiedMemory ? "Yes" : "No")\n"
    } else {
        info += "No Metal-compatible GPU found.\n"
    }
    
    return info
}

#endif
