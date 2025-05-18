//
//  System.swift
//  Uplink
//
//  Created by Chris Slowik on 5/10/25.
//

import Foundation

struct System: Identifiable, Codable {
    let id: UUID
    let name: String
    let ipAddress: String
    let introMessage: String
    let services: [SystemService]
    var securityLevel: Int
    var knownUsers: [String]
    var savedUsernames: [String]
    
    init(name: String,
         ipAddress: String,
         introMessage: String,
         services: [SystemService] = [.terminal],
         securityLevel: Int = 1,
         knownUsers: [String] = [],
         savedUsernames: [String] = []) {
        self.id = UUID()
        self.name = name
        self.ipAddress = ipAddress
        self.introMessage = introMessage
        self.services = services
        self.securityLevel = securityLevel
        self.knownUsers = knownUsers
        self.savedUsernames = savedUsernames
    }
    init(from computer: Computer) {
        self.id = UUID()
        self.name = computer.name
        self.ipAddress = computer.ipAddress
        self.introMessage = "Welcome to \(computer.name)."
        self.services = Computer.defaultServices(for: computer)
        self.securityLevel = 1
        self.knownUsers = []
        self.savedUsernames = []
    }
}

enum SystemStep {
    case intro
    case authPrompt
    case login
    case register
    case services
}

enum SystemService: Codable, Identifiable {
    case login
    case terminal
    case fileBrowser
    case logs
    case email
    case missionBoard

    var id: String {
        switch self {
        case .login: return "login"
        case .terminal: return "terminal"
        case .fileBrowser: return "fileBrowser"
        case .logs: return "logs"
        case .email: return "email"
        case .missionBoard: return "missionBoard"
        }
    }

    var displayName: String {
        switch self {
        case .login: return "Login"
        case .terminal: return "Terminal"
        case .fileBrowser: return "File Browser"
        case .logs: return "Logs"
        case .email: return "Email"
        case .missionBoard: return "Mission Board"
        }
    }
}
