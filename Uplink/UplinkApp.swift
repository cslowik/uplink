//
//  UplinkApp.swift
//  Uplink
//
//  Created by Chris Slowik on 5/9/25.
//

import SwiftUI

@main
struct UplinkApp: App {
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(GameState.shared)
        }
    }
}
