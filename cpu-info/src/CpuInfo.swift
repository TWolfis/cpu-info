//
//  CpuInfo.swift
//  cpu-info
//
//  Created by Thomas Wolfis on 17/03/2025.
//

import Foundation

/// Enum representing CPU-related sysctl variables
enum SysctlCPU: String {
    case activeCPU = "hw.activecpu"
    case logicalCPU = "hw.logicalcpu"
    case logicalCPUMax = "hw.logicalcpu_max"
    case physicalCPU = "hw.physicalcpu"
    case physicalCPUMax = "hw.physicalcpu_max"
    case cpuFamily = "hw.cpufamily"
    case cpuType = "hw.cputype"
    case cpuSubType = "hw.cpusubtype"
    case cpuThreadType = "hw.cputhreadtype"
    case cpu64BitCapable = "hw.cpu64bit_capable"
    case cpuFrequency = "hw.cpufrequency"
    case cpuFrequencyMax = "hw.cpufrequency_max"
    case cpuFrequencyMin = "hw.cpufrequency_min"
    case busFrequency = "hw.busfrequency"
    case busFrequencyMax = "hw.busfrequency_max"
    case busFrequencyMin = "hw.busfrequency_min"
    case l1DataCacheSize = "hw.l1dcachesize"
    case l1InstructionCacheSize = "hw.l1icachesize"
    case l2CacheSize = "hw.l2cachesize"
    case l3CacheSize = "hw.l3cachesize"
    case memSize = "hw.memsize"
    case processorBrand = "machdep.cpu.brand_string"
    case processorVendor = "machdep.cpu.vendor"
    case processorSignature = "machdep.cpu.signature"
    case processorModel = "machdep.cpu.model"
    case processorFamily = "machdep.cpu.family"
    case processorStepping = "machdep.cpu.stepping"
    case processorCoreCount = "machdep.cpu.core_count"
    case processorThreads = "machdep.cpu.thread_count"
}

/// Fetch a sysctl value as an `Int`
func sysctlInt(for key: SysctlCPU) -> Int? {
    var value: Int = 0
    var size = MemoryLayout<Int>.size
    let result = sysctlbyname(key.rawValue, &value, &size, nil, 0)
    return result == 0 ? value : nil
}

/// Fetch a sysctl value as a `String`
func sysctlString(for key: SysctlCPU) -> String? {
    var size = 0
    sysctlbyname(key.rawValue, nil, &size, nil, 0)
    var value = [CChar](repeating: 0, count: size)
    let result = sysctlbyname(key.rawValue, &value, &size, nil, 0)
    return result == 0 ? String(cString: value) : nil
}

/// Print CPU Information
func printCPUInfo() {
    print("Processor: \(sysctlString(for: .processorBrand) ?? "Unknown")")
    print("CPU Family: \(sysctlInt(for: .processorFamily) ?? -1)")
    print("CPU Model: \(sysctlInt(for: .processorModel) ?? -1)")
    print("CPU Stepping: \(sysctlInt(for: .processorStepping) ?? -1)")
    print("Physical CPU Cores: \(sysctlInt(for: .physicalCPU) ?? -1)")
    print("Logical CPU Cores: \(sysctlInt(for: .logicalCPU) ?? -1)")
    print("CPU Frequency: \(sysctlInt(for: .cpuFrequency) ?? -1) Hz")
    print("L1 Data Cache Size: \(sysctlInt(for: .l1DataCacheSize) ?? -1) Bytes")
    print("L2 Cache Size: \(sysctlInt(for: .l2CacheSize) ?? -1) Bytes")
    print("L3 Cache Size: \(sysctlInt(for: .l3CacheSize) ?? -1) Bytes")
    print("Memory Size: \(sysctlInt(for: .memSize) ?? -1) Bytes")
}
