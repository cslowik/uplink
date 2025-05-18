//
//  TerminalTextField.swift
//  Uplink
//
//  Created by Chris Slowik on 3/31/25.
//

import SwiftUI

struct TerminalTextField: View {
    var placeholder: String
    @Binding var text: String
    
    private var displayedText: String {
        secure ? String(repeating: "*", count: text.count) : text
    }

    var secure: Bool = false
    @State private var showCursor = true
    @FocusState private var isFocused: Bool

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .bodyText(color: .secondaryText)
            }

            Text(displayedText + ((showCursor && isFocused) ? "█" : ""))
                .bodyText(color: .white)

            TextField("", text: $text)
                .focused($isFocused)
                .opacity(0.01)
                .blendMode(.screen)
        }
        .bodyText()
        .frame(minHeight: 22) // Ensure whole field has a touch target
        .onTapGesture {
            isFocused = true
        }
        .onAppear {
            Task {
                Timer.scheduledTimer(withTimeInterval: 0.65, repeats: true) { _ in
                    showCursor.toggle()
                }
            }
        }
    }
}


#Preview {
    TerminalTextField(placeholder: "", text: .constant("test"))
}
