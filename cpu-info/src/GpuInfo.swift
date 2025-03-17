//
//  GpuInfo.swift
//  cpu-info
//
//  Created by Thomas Wolfis on 17/03/2025.
//

import Foundation
import Metal

func getGPUInfo() {
    if let device = MTLCreateSystemDefaultDevice() {
        print("GPU Name: \(device.name)")
        print("Is Low Power: \(device.isLowPower ? "Yes" : "No")")
        print("Max Threads Per Threadgroup: \(device.maxThreadsPerThreadgroup)")
        print("Max Buffer Length: \(device.maxBufferLength) bytes")
        print("Has Unified Memory: \(device.hasUnifiedMemory ? "Yes" : "No")")
    } else {
        print("No Metal-compatible GPU found.")
    }
}
