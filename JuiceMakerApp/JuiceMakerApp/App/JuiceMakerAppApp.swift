//
//  JuiceMakerAppApp.swift
//  JuiceMakerApp
//
//  Created by yun on 2022/04/07.
//

import SwiftUI

@main
struct JuiceMakerAppApp: App {
    let service: Service = JuiceMakerService()
    var body: some Scene {
        WindowGroup {
            ContentView(service: service)
        }
    }
}
