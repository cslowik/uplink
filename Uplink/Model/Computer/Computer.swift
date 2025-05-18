//
//  Computer.swift
//  Uplink
//
//  Core class for in-game computer systems:
//  IP, services, logs, etc
//
//  Created by Chris Slowik on 3/30/25.
//

import Foundation

enum ComputerType: Codable {
    case unknown
    case government
    case publicAccessServer
    case internalServicesMachine
    case centralMainframe
    case publicBankServer
    case personalComputer
    case voicePhoneSystem
    case lan
}

enum TraceAction:Codable {
    case none
    case disconnect
    case warningMail
    case fine
    case legal
    case tactical
    case covert
}

class Computer: Identifiable {
    var id = UUID()
    
    var name: String
    var companyName: String
    var ipAddress: String

    var type: ComputerType
    var traceSpeed: Int
    var traceAction: TraceAction

    var isTargetable: Bool
    var isExternallyOpen: Bool
    var isRunning: Bool

    var recentHacks: Int
    var hacksThisMonth: Int
    var hacksLastMonth: Int

    var infectedRevelationVersion: Float?
    var infectionDate: Date?
    
    var screens: [SystemService] = []

    // Subsystems
    var databank: Databank
    var logbank: Logbank
    //var recordbank: Recordbank
    //var security: Security
    
    init() {
        self.type = .unknown
        self.name = ""
        self.companyName = ""
        self.ipAddress = ""
        self.traceSpeed = 0
        self.traceAction = .none
        self.isTargetable = true
        self.isExternallyOpen = true
        self.isRunning = true
        self.recentHacks = 0
        self.hacksThisMonth = 0
        self.hacksLastMonth = 0
    }
    
    static func defaultServices(for computer: Computer) -> [SystemService] {
        switch computer.type {
        case .publicBankServer:
            return [.login, .terminal, .logs]
        case .centralMainframe:
            return [.terminal, .logs, .fileBrowser]
        case .publicAccessServer:
            return [.missionBoard, .email]
        default:
            return [.terminal]
        }
    }

    // Infect this computer with Revelation virus
    func infectWithRevelation(version: Float) {
        self.infectedRevelationVersion = version
        self.infectionDate = GameState.shared.currentGameTime

        if version <= 1.0 {
            self.isRunning = false
            self.databank.format()
            // TODO: self.logbank.empty()
        }
    }

    // Disinfect this computer from Revelation virus
    func disinfectRevelation() {
        if let version = infectedRevelationVersion, version > 0.0 {
            // TODO: Add plot logic here if needed (see C++: plotgenerator.Disinfected(ip))
        }
        infectedRevelationVersion = nil
        infectionDate = nil
    }

    func addComputerScreen(_ service: SystemService, at index: Int? = nil) {
        if screens.contains(service) { return }

        if let i = index, i < screens.count {
            screens.insert(service, at: i)
        } else {
            screens.append(service)
        }
    }

    /// Revelation cleanup, log detection, file deletion, and security resets.
    func checkForSecurityBreaches() {
        var shouldResetSecurity = false //time to change underwear

        // are we fucked
        if !isRunning {
            if infectedRevelationVersion == nil {
                // TODO: generate news story about destruction (e.g. NewsGenerator.computerDestroyed)
            }
            isRunning = true
            disinfectRevelation()
            // TODO: clear formatted flag on databank when implemented
            return
        }

        // TODO: Check for suspicious logs in logbank

        // TODO: Check if all files have been wiped (e.g. databank.formatted)

        // Reset defenses if compromised
        if shouldResetSecurity {    // TODO: security.isAnythingDisabled
            changeSecurityCodes()
        }
    }
    
    /// Resets security codes and re-enables security systems.
    @discardableResult
    func changeSecurityCodes() -> Bool {
        var changed = false

        switch type {
        case .internalServicesMachine, .centralMainframe:
            // TODO: Change admin password in recordbank
            changed = true

        case .unknown:
            if ipAddress == "SOCIALSECURITYDATABASE" ||
               ipAddress == "GLOBALCRIMINALDATABASE" ||
               ipAddress == "ACADEMICDATABASE" {
                // TODO: Change all levels of user passwords
                changed = true
            }

        default:
            break
        }

        // TODO: Re-enable all security systems
        return changed
    }
    
    /// Deletes logs older than expiration time and re-packs logs to fill any gaps.
    /// This would operate on logbank.logs and logbank.internallogs.
    func manageOldLogs() {
        // TODO: Delete logs older than expiration time
        // TODO: Re-pack logs to fill any gaps
        // This would operate on logbank.logs and logbank.internallogs
    }
    
    /// Adds Computer to lists of recent hacks and increments monthly count
    func addToRecentHacks(_ count: Int) {
        recentHacks += count
        hacksThisMonth += count
    }
    
    /// Shifts and decays hack counts each month
    func updateRecentHacks() {
        // This is called 4 times a month.
        // Reduce the number of recent hacks by the number last month / 4
        // (removing all of last month's hacks from the count by the end of the month)
        // If it is the end of the month, process the changeover to a new month
        // Also schedule the next check
        let day = GameState.shared.currentGameTime.day

        if day == 1 {
            // New month: shift this month's hacks to last month and reset
            hacksLastMonth = hacksThisMonth
            hacksThisMonth = 0
        } else {
            // Reduce recent hacks by a quarter of last month
            let numToRemove = hacksLastMonth / 4
            recentHacks -= numToRemove
        }

        // Clamp values to non-negative
        recentHacks = max(recentHacks, 0)
        hacksLastMonth = max(hacksLastMonth, 0)
    }
}

    
