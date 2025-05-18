//
//  Tools.swift
//  Uplink
//
//  Created by Chris Slowik on 3/28/25.
//

import Foundation

struct SoftwareTool: Codable {
    let name: String
    let type: SoftwareType
    let versions: [SoftwareVersion]
}
struct SoftwareVersion: Codable {
    let cost: Int
    let size: Int
    let description: String
}
enum SoftwareType: String, Codable {
    case none = ""
    case fileUtil = "File Utility"
    case hwDriver = "Hardware Driver"
    case security = "Security"
    case cracker = "Cracker"
    case bypasser = "Bypasser"
    case lanTool = "LAN Tool"
    case hudUpgrade = "HUD Upgrade"
    case other = "Other"
}

struct HardwareTool: Codable {
    let name: String
    let versions: [HardwareVersion]
}
enum HardwareType: String, Codable {
    case cpu = "CPU"
    case modem = "Modem"
    case cooling = "Cooling"
    case memory = "Memory"
    case security = "Security"
    case power = "Power"
}
struct HardwareVersion: Codable {
    let cost: Int
    let capacity: Int
    let description: String
}
