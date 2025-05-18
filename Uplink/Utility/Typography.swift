//
//  Typography.swift
//  Uplink
//
//  Created by Chris Slowik on 3/28/25.
//

import Foundation
import SwiftUI

extension Font {
    public static let headline: Font = .custom("OperatorMonoSSm-Book", size: 21)
    public static let subheadline: Font = .custom("OperatorMonoSSm-Book", size: 15)
    public static let body: Font = .custom("OperatorMonoSSm-Book", size: 13)
    public static let buttonText: Font = .custom("OperatorMonoSSm-Bold", size: 13)
    public static let micro: Font = .custom("OperatorMonoSSm-Book", size: 11)
}

extension View {
    func uplinkHeadline(color: Color? = nil) -> some View {
        self
            .font(.headline)
            .foregroundColor(color ?? .primaryText)
    }
    func uplinkSubheadline(color: Color? = nil) -> some View {
        self
            .font(.subheadline)
            .foregroundColor(color ?? .secondaryText)
    }
    func buttonText(color: Color? = nil) -> some View {
        self
            .font(.buttonText)
            .foregroundColor(color ?? .sapphire)
    }
    func micro(color: Color? = nil) -> some View {
        self
            .font(.micro)
            .foregroundColor(color ?? .primaryText)
    }
    func bodyText(color: Color? = nil) -> some View {
        self
            .font(.body)
            .foregroundColor(color ?? .primaryText)
    }
}
