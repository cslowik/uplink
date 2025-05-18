//
//  System.swift
//  Uplink
//
//  Created by Chris Slowik on 5/10/25.
//

import Foundation

struct System: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let ipAddress: String
    let introMessage: String
    //let services: [SystemService]
    
    init(name: String, ipAddress: String, introMessage: String/*, services: [SystemService]*/) {
        self.name = name
        self.ipAddress = ipAddress
        self.introMessage = introMessage
        //self.services = services
    }
    init(with info: SystemInfo) {
        self.name = info.rawValue
        self.ipAddress = info.ipAddress
        self.introMessage = info.welcomeMessage
        //self.services = info.services
    }
}

enum SystemService: Identifiable {
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
