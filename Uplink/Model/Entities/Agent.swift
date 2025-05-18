//
//  Agent.swift
//  Uplink
//
//  Created by Chris Slowik on 4/18/25.
//
//  Receives and completes missions
//  Stores links to systems
//  Stores access codes to computers/accounts
//  Can create accounts, be paid, and act autonomously

import Foundation

class Agent: Person {
    // missions, systemLinks, accessCodes, mission execution logic
    var missions: [Mission]
    var systemLinks: Set<String>
    var accessCodes: [String: String]

    override init(name: String, localhost: String, rating: Int = 0) {
        self.missions = []
        self.systemLinks = []
        self.accessCodes = [:]
        super.init(name: name, localhost: localhost, rating: rating)
    }

    func giveLink(_ ip: String) {
        systemLinks.insert(ip)
    }

    func hasLink(_ ip: String) -> Bool {
        return systemLinks.contains(ip)
    }

    func removeLink(_ ip: String) {
        systemLinks.remove(ip)
    }

    func giveCode(ip: String, code: String) {
        if let existingCode = accessCodes[ip] {
            if existingCode != code {
                let existingParts = existingCode.split(separator: "'")
                let newParts = code.split(separator: "'")
                if existingParts.count >= 3, newParts.count >= 3,
                   existingParts[1] == newParts[1] {
                    accessCodes[ip] = code
                }
            }
        } else {
            accessCodes[ip] = code
        }
    }

    func giveMission(_ mission: Mission) {
        missions.append(mission)
    }

    func checkMissionDueDates(currentDate: Date) {
        missions.removeAll {
            if let due = $0.deadline, currentDate > due {
                // You can hook this into your consequence or alert system
                print("Mission failed due to timeout: \($0.title)")
                return true
            }
            return false
        }
    }
}
