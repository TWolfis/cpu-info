//
//  ContentView.swift
//  cpu-info-ios
//
//  Created by Thomas Wolfis on 23/03/2025.
//

import SwiftUI

struct CPUInfoView: View {
    var body: some View {
        ScrollView {
            Text("CPU Info")
                .font(.title)
            Text(stringCPUInfo())
                .font(.system(.body, design: .monospaced))
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
#if canImport(Metal)
            Divider()
            Text("GPU Info")
                .font(.title)
            Text(stringGPUInfo())
                .font(.system(.body, design: .monospaced))
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            #endif
        }
        
    }
}

#Preview {
    CPUInfoView()
}
