//
//  TerminalButton.swift
//  Uplink
//
//  Created by Chris Slowik on 3/30/25.
//

import SwiftUI

enum TerminalButtonType {
    case outline
    case text
}

struct TerminalButton: View {
    var text: String = "OK"
    var type: TerminalButtonType = .text
    var disabled: Bool = false
    var action: () -> Void = {}

    var body: some View {
        switch type {
        case .outline:
            if disabled {
                Text(text)
                    .buttonText()
                    .padding(.horizontal, 32)
                    .padding(.vertical, 12)
                    .background(Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.sapphire, lineWidth: 1)
                    )
                    .opacity(0.5)
            } else {
                Button(action: action) {
                    Text(text)
                        .buttonText()
                        .padding(.horizontal, 32)
                        .padding(.vertical, 12)
                        .background(Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.sapphire, lineWidth: 1)
                        )
                }
            }
        case .text:
            if disabled {
                Text(text)
                    .buttonText()
                    .background(Color.clear)
                    .opacity(0.5)
            } else {
                Button(action: action) {
                    Text(text)
                        .buttonText()
                        .background(Color.clear)
                }
            }
        }
    }
}

#Preview {
    TerminalButton()
}
