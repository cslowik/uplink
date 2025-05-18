//
//  MissionGenerator.swift
//  Uplink
//
//  Created by Chris Slowik on 4/16/25.
//

import Foundation

/// Generates placeholder missions for the bulletin board.
///
/// The original source had a basic version of this logic commented out.
/// This implementation adapts that code to the current `Mission` model.
struct MissionGenerator {
    /// Returns a randomly generated `Mission` using the provided systems list
    /// to pick potential targets.
    static func generateMission(for systems: [System]) -> Mission {
        // Choose a random mission type. This list mirrors the old implementation
        // and covers all currently defined mission cases.
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

        // Simple placeholder employer/contact information
        let employer = "GlobalSec"
        let contact = "Mr. Smith"

        // Pick a random target system for flavour text
        let targetSystem = systems.randomElement()
        let targetIP = targetSystem?.ipAddress ?? "unknown"

        // Construct some very simple text for use on the board and when
        // the mission is accepted.
        let title = "Mission: \(type.rawValue.capitalized)"
        let snippet = "Looking for an agent to \(type.rawValue) at \(targetIP)."
        let description = "You are required to perform a \(type.rawValue) operation on system \(targetIP)."

        // Payment and deadline are intentionally basic. These values can be
        // refined later using MissionConstants.
        let payment = Int.random(in: 1000...5000)
        let deadline = Calendar.current.date(byAdding: .day, value: 3, to: Date())

        // Create the mission with sane defaults for the remaining fields.
        return Mission(
            type: type,
            status: .active,
            title: title,
            description: description,
            snippet: snippet,
            deadline: deadline,
            payment: payment,
            maxPayment: payment,
            paymentMethod: .completion,
            employer: employer,
            contact: contact,
            createDate: Date(),
            difficulty: 1,
            minUplinkRating: 0,
            acceptRating: 0
        )
    }
}
