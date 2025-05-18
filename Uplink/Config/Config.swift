//
//  Config.swift
//  Uplink
//
//  Created by Chris Slowik on 3/29/25.
//

import Foundation

// MARK: NPC Skills
let agentRatingAverage = 7
let agentRatingVariance = 7

let minRequiredRatingDeleteLogLevel1 = 2
let minRequiredRatingDeleteLogLevel2 = 3
let minRequiredRatingDeleteLogLevel3 = 4

let minRequiredRatingUndeleteLogLevel1 = 7
let minRequiredRatingUndeleteLogLevel2 = 7
let minRequiredRatingUndeleteLogLevel3 = 9

let minRequiredRatingHackBankServer = 8
let minRequiredRatingHackGovernmentComputer = 9

// MARK: Finance
let costUplinkPerMonth: Double = 300
let costUplinkNewGateway: Double = 1000
let gatewayPartExchangeValue: Double = 0.75

enum LoanType: String {
    case small
    case medium
    case large
    
    var max: Double {
        switch self {
        case .small: 3000
        case .medium: 7000
        case .large: 10000
        }
    }
    
    var interest: Double {
        switch self {
        case .small: 0.2
        case .medium: 0.4
        case .large: 0.7
        }
    }
}

// MARK: Physical Locations
struct PhysicalGatewayLocation {
    let city: String
    let country: String
    let x: Int
    let y: Int
}

let physicalGatewayLocations: [PhysicalGatewayLocation] = [
    .init(city: "London", country: "United Kingdom", x: 282, y: 69),
    .init(city: "Tokyo", country: "Japan", x: 514, y: 104),
    .init(city: "Los Angeles", country: "USA", x: 91, y: 125),
    .init(city: "New York", country: "USA", x: 171, y: 98),
    .init(city: "Chicago", country: "USA", x: 138, y: 88),
    .init(city: "Moscow", country: "Russia", x: 331, y: 70),
    .init(city: "Sydney", country: "Australia", x: 547, y: 244)
]

// MARK: Random, other
let lanSubnetRange: Int = 1024
let lanLinkPortRange: Int = 1024
let radioTransmitterMinRange: Double = 140
let radioTransmitterMaxRange: Double = 180
