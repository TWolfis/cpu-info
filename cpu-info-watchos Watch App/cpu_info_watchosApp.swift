//
//  cpu_info_watchosApp.swift
//  cpu-info-watchos Watch App
//
//  Created by Thomas Wolfis on 23/03/2025.
//

import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                CPUInfoView()
            }
        }
    }
}
