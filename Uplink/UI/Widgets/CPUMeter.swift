//
//  CPUMeter.swift
//  Uplink
//
//  Created by Chris Slowik on 3/28/25.
//

import SwiftUI

struct CPUMeter: View {
    var usage: Double // 0.0 to 1.0
    private var fillColor: Color {
        switch usage {
        case 0..<0.5: return .sapphire
        case 0.5..<0.75: return .amber
        case 0.75...1.0: return .ruby
        default: return .sapphire
        }
    }

    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("CPU Usage")
                .font(.micro)
                .foregroundColor(.secondary)

            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 2)
                        .frame(height: 12)
                        .foregroundColor(Color.gray.opacity(0.2))

                    ForEach([0.25, 0.5, 0.75], id: \.self) { percent in
                        Rectangle()
                            .fill(Color.black.opacity(0.25))
                            .frame(width: 1, height: 4)
                            .offset(x: geometry.size.width * percent)
                    }

                    RoundedRectangle(cornerRadius: 2)
                        .frame(width: CGFloat(usage) * geometry.size.width, height: 8)
                        .foregroundColor(fillColor)
                        .animation(.easeInOut(duration: 0.2), value: usage)
                }
            }
            .frame(height: 12)
        }
    }
}


#Preview {
    CPUMeter(usage: 0.5)
}
