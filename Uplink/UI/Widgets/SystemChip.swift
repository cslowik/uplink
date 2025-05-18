//
//  SystemChip.swift
//  Uplink
//
//  Created by Chris Slowik on 3/30/25.
//

import SwiftUI

struct SystemChip: View {
    var system: System
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text("[ \(system.ipAddress) ]")
                .font(.micro)
                .foregroundColor(.white)
                .frame(width: 160)
            VStack(spacing: 2) {
                Image(systemName: "desktopcomputer")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.sapphire)
                Text(system.name)
                    .font(.micro)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .frame(width: 108)
                    .padding(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
        }
    }
}

#Preview {
    SystemChip(system:
        System(
            name: "Test Server",
            ipAddress: "123.456.789.000",
            introMessage: "Welcome to the test system. This is only a test.",
            services: []
        )
    )
}
