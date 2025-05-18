//
//  AnimatedTerminalText.swift
//  Uplink
//
//  Created by Chris Slowik on 3/30/25.
//

import SwiftUI

struct AnimatedTerminalText: View {
    let text: String
    let speed: Double // characters per second

    @State private var displayedText = ""
    @State private var showCursor = true
    @State private var skipAnimation = false
    @State private var animationCompleted = false
    var onComplete: (() -> Void)? = nil

    var body: some View {
        ZStack(alignment: .topLeading) {
            Text(text)
                .font(.body)
                .foregroundColor(.clear)
                .multilineTextAlignment(.leading)

            Text(displayedText + (showCursor ? " █" : ""))
                .font(.body)
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
        }
        .onTapGesture {
            skipAnimation = true
            displayedText = text
        }
        .onAppear {
            displayedText = ""
            Task {
                let words = text.split(separator: " ")
                for (i, word) in words.enumerated() {
                    if skipAnimation { break }
                    try? await Task.sleep(nanoseconds: UInt64(speed * 1_000_000_000))
                    displayedText += (i == 0 ? "" : " ") + word
                }
                displayedText = skipAnimation ? text : displayedText
                animationCompleted = true
                onComplete?()

                // Start cursor blinking
                Timer.scheduledTimer(withTimeInterval: 0.65, repeats: true) { _ in
                    showCursor.toggle()
                }
            }
        }
    }
}


#Preview {
    AnimatedTerminalText(text: "This is some test text", speed: 0.1)
}
