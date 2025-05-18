//
//  MissionGenerator.swift
//  Uplink
//
//  Created by Chris Slowik on 4/16/25.
//

import Foundation
/*
struct MissionGenerator {
    static func generateMission(for systems: [System]) -> Mission {
        let id = UUID()
        let type: MissionType = [
            .stealFile,
            .destroyFile,
            .changeData,
            .traceUser,
            .findData,
            .frameUser,
            .changeAccount,
            .removeComputer,
            .removeCompany,
            .removeUser,
            .special
        ].randomElement() ?? .stealFile
        let status: MissionStatus = .active
        let employer = "GlobalSec"
        let contact = "Mr. Smith"
        let reward = Int.random(in: 1000...5000)
        let deadline = Calendar.current.date(byAdding: .day, value: 3, to: Date()) ?? Date()
        let system = systems.randomElement()
        let targetIP = system?.ipAddress

        let title = "Mission: \(type.rawValue.capitalized)"
        let description = "You are required to perform a \(type.rawValue) operation on system \(targetIP ?? "unknown")."

        return Mission(
            id: id,
            title: title,
            description: description,
            deadline: deadline,
            status: status,
            employer: employer,
            contact: contact
        )
    }
}
*/
