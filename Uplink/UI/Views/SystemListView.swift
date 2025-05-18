import SwiftUI

struct SystemListView: View {
    @ObservedObject var gameState: GameState

    var body: some View {
        VStack(alignment: .leading) {
            Text("Available Systems")
                .uplinkHeadline()
                .padding()
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(gameState.availableSystems) { system in
                        Button(action: { gameState.connectedSystem = system }) {
                            SystemChip(system: system)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    SystemListView(gameState: GameState())
}
