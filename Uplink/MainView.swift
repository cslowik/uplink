//
//  MainView.swift
//  Uplink
//
//  Created by Chris Slowik on 5/9/25.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appModel: AppModel

    var body: some View {
        ZStack(alignment: .top) {
            Color.black.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                DateTime(gameState: appModel.gameState)
                if let system = appModel.gameState.connectedSystem {
                    TerminalView(system: system)
                } else {
                    SystemListView(gameState: appModel.gameState)
                }
            }
        }
    }
}

#Preview {
    MainView().environmentObject(AppModel())
}
