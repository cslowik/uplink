//
//  SystemConstants.swift
//  Uplink
//
//  Created by Chris Slowik on 5/10/25.
//

import Foundation

let traceSpeedVariance = 0.1

enum TraceSpeedModifier: Double {
    case noAccount = 0.1
    case hasAccount = 0.7
    case adminAccess = 1.0
    case centralMainframe = 1.3
    case publicBankServerAdmin = 1.6
}

// Represents average number of ticks required to decrypt one letter

let hackDifficultyVariance = 0.15

let hackDifficulties: [String: Int] = [
    "PublicAccessServer": 6,
    "InternalServicesMachine": 45,
    "CentralMainframe": 80,
    "PublicBankServer": 100,
    "PublicBankServerAdmin": 300,
    "LocalMachine": 20,
    "LANTerminal": 75,
    "LANAuthenticationServer": 150,
    "LANLogServer": 300,
    "LANModem": 200,
    "LANMainServer": 500,
    "UplinkInternalServicesMachine": 300,
    "UplinkTestMachine": 30,
    "UplinkPublicAccessServer": 30,
    "ARCCentralMainframe": 600,
    "ArunmorCentralMainframe": 600,
    "GlobalCriminalDatabase": 180,
    "InternationalSocialSecurityDatabase": 120,
    "CentralMedicalDatabase": 120,
    "GlobalIntelligenceAgency": 450,
    "InternationalAcademicDatabase": 90,
    "Internic": 70,
    "StockMarket": 120,
    "Protovision": -1 // Unhackable
]

// MARK: System Info

enum SystemInfo: String {
    case localHost = "localhost"
    case internic = "Internic"
    case academicDatabase = "Academic Database"
    case globalCriminalDatabase = "Global Criminal Database"
    case socialSecurityDatabase = "Social Security Database"
    case centralMedicalDatabase = "Central Medical Database"
    case stockMarketSystem = "Stock Market System"
    case uplinkPublicAccessMachine = "Uplink Public Access Machine"
    case uplinkCreditsMachine = "Uplink Credits Machine"
    case uplinkInternalServices = "Uplink Internal Services"
    case uplinkTestingMachine = "Uplink Testing Machine"
    
    var ipAddress: String {
        switch self {
        case .localHost:
            return "127.0.0.1"
        case .internic:
            return "458.615.48.651"
        case .academicDatabase:
            return "443.65.765.2"
        case .globalCriminalDatabase:
            return "785.234.87.124"
        case .socialSecurityDatabase:
            return "653.76.235.432"
        case .centralMedicalDatabase:
            return "432.543.12.544"
        case .stockMarketSystem:
            return "456.789.159.459"
        case .uplinkPublicAccessMachine:
            return "234.773.0.666"
        case .uplinkCreditsMachine:
            return "192.168.1.2"
        case .uplinkInternalServices:
            return "192.168.1.3"
        case .uplinkTestingMachine:
            return "192.168.1.4"
        }
    }
    
    var title: String {
        switch self {
        case .localHost:
            return ""
        case .internic:
            return ""
        case .academicDatabase:
            return "International Academic Database"
        case .globalCriminalDatabase:
            return ""
        case .socialSecurityDatabase:
            return ""
        case .centralMedicalDatabase:
            return ""
        case .stockMarketSystem:
            return ""
        case .uplinkPublicAccessMachine:
            return "Uplink Public Access"
        case .uplinkCreditsMachine:
            return ""
        case .uplinkInternalServices:
            return ""
        case .uplinkTestingMachine:
            return ""
        }
    }
    
    var welcomeMessage: String {
        switch self {
        case .localHost:
            return ""
        case .internic:
            return ""
        case .academicDatabase:
            return "Welcome to the academic network database. Authorized access only."
        case .globalCriminalDatabase:
            return ""
        case .socialSecurityDatabase:
            return ""
        case .centralMedicalDatabase:
            return ""
        case .stockMarketSystem:
            return ""
        case .uplinkPublicAccessMachine:
            return
                """
                Welcome to the Uplink Public Access Machine.

                Uplink Corporation maintains the largest list of freelance agents in the world, and we have operated for the last decade with a flawless record of satisfied customers and successful agents. Our company acts as an anonymous job centre, bringing corporations together with agents who can work for them. Our company also provides rental of essential gateway computers to all agents, which allow unparalleled security in a high risk environment.

                You are here because you wish to join this company.
                """
        case .uplinkCreditsMachine:
            return ""
        case .uplinkInternalServices:
            return ""
        case .uplinkTestingMachine:
            return ""
        }
    }
    
    var registrationMessage: String {
        switch self {
        case .localHost:
            return ""
        case .internic:
            return ""
        case .academicDatabase:
            return "Welcome to the academic network database. Authorized access only."
        case .globalCriminalDatabase:
            return ""
        case .socialSecurityDatabase:
            return ""
        case .centralMedicalDatabase:
            return ""
        case .stockMarketSystem:
            return ""
        case .uplinkPublicAccessMachine:
            return
                """
                Your Uplink membership package includes:
                • A Gateway computer at a secure location. You will connect to \
                this machine from your home computer when you are working for \
                Uplink. You can have it upgraded at a later stage if necessary.

                • A low interest loan of 3000 credits with Uplink International \
                Bank, to get you started.

                • Access to our Bulletin Board system – the usual place for \
                Uplink Agents to find work.

                • You will be officially rated as an Uplink Agent, and we will \
                monitor your progress. As your rating increases you will find \
                new avenues of work become available.
                """
        case .uplinkCreditsMachine:
            return ""
        case .uplinkInternalServices:
            return ""
        case .uplinkTestingMachine:
            return ""
        }
    }
    
    var traceSpeed: Double {
        // average time to trace one link in a connection, in Seconds
        switch self {
        case .localHost:
            return 0
        case .internic:
            return 15
        case .academicDatabase:
            return 35
        case .globalCriminalDatabase:
            return 10
        case .socialSecurityDatabase:
            return 15
        case .centralMedicalDatabase:
            return 25
        case .stockMarketSystem:
            return 20
        case .uplinkPublicAccessMachine:
            return -1
        case .uplinkCreditsMachine:
            return 5
        case .uplinkInternalServices:
            return 15
        case .uplinkTestingMachine:
            return 30
        }
    }
}
