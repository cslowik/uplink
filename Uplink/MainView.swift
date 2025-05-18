//
//  MainView.swift
//  Uplink
//
//  Created by Chris Slowik on 5/9/25.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var gameState: GameState

    var body: some View {
        ZStack(alignment: .top) {
            Color.black.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                DateTime(gameState: gameState)
//                if let system = gameState.connectedSystem {
//                    TerminalView(system: system)
//                } else {
//                    Text("No system connected")
//                        .foregroundColor(.gray)
//                        .padding()
//                }
            }
        }
    }
}

#Preview {
    MainView().environmentObject(GameState.shared)
}
