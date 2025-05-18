//
//  Colors.swift
//  Uplink
//
//  Created by Chris Slowik on 3/28/25.
//

import SwiftUI

extension Color {
    public static let UplinkBlue = Color(red: 0.239, green: 0.518, blue: 0.902)
    public static let ruby = Color(red: 0.878, green: 0.126, blue: 0.126)         // #E02020
    public static let amber = Color(red: 0.980, green: 0.392, blue: 0.000)        // #FA6400
    public static let citrine = Color(red: 0.969, green: 0.710, blue: 0.000)      // #F7B500
    public static let emerald = Color(red: 0.427, green: 0.831, blue: 0.000)      // #6DD400
    public static let amazonite = Color(red: 0.267, green: 0.843, blue: 0.714)    // #44D7B6
    public static let apatite = Color(red: 0.196, green: 0.773, blue: 1.000)      // #32C5FF
    public static let sapphire = Color(red: 0.000, green: 0.569, blue: 1.000)     // #0091FF
    public static let iolite = Color(red: 0.384, green: 0.212, blue: 1.000)       // #6236FF
    public static let amethyst = Color(red: 0.710, green: 0.125, blue: 0.878)     // #B620E0
    public static let graphite = Color(red: 0.427, green: 0.447, blue: 0.471)     // #6D7278
    public static let obsidian10 = Color.black.opacity(0.10)
    public static let obsidian25 = Color.black.opacity(0.25)
    public static let obsidian50 = Color.black.opacity(0.50)
    public static let obsidian85 = Color.black.opacity(0.85)
    public static let obsidian = Color.black
    public static let calcite = Color.white
    public static let calcite15 = Color.white.opacity(0.15)
    public static let calcite30 = Color.white.opacity(0.30)
    public static let calcite60 = Color.white.opacity(0.60)
    public static let calcite85 = Color.white.opacity(0.85)
    
    public static let primaryText = Color.calcite
    public static let secondaryText = Color.calcite85
}
