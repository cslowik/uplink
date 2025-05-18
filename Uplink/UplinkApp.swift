//
//  UplinkApp.swift
//  Uplink
//
//  Created by Chris Slowik on 5/9/25.
//

import SwiftUI

@main
struct UplinkApp: App {
    @StateObject var appModel = AppModel()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(appModel)
                .onAppear {
                    //AppStartupService().runUplink(appModel: appModel)
                }
        }
    }
}
