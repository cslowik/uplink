//
//  DateTime.swift
//  Uplink
//
//  Created by Chris Slowik on 5/9/25.
//

import SwiftUI

struct DateTime: View {
    @ObservedObject var gameState: GameState
    var width: CGFloat = 100
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Date")
                    .micro(color: .primaryText)

                Text(currentTimeFormatted)
                    .micro(color: .secondaryText)
            }
            Spacer()
            HStack(spacing: 12) {
                Button(action: { gameState.setGameSpeed(.paused) }) {
                    Image(systemName: "pause")
                }
                Button(action: { gameState.setGameSpeed(.normal) }) {
                    Image(systemName: "play")
                }
                Button(action: { gameState.setGameSpeed(.fast) }) {
                    Image(systemName: "forward")
                }
                Button(action: { gameState.setGameSpeed(.ultra) }) {
                    Image(systemName: "forward.end.alt")
                }
            }
            .font(.system(size: 14))
        }
        .background(Color.black)
        .padding(.leading)
        .padding(.trailing)
        .padding(.bottom, 12)
    }
    
    var currentTimeFormatted: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: gameState.currentGameTime)
    }
}
