//
//  SystemMessage.swift
//  Uplink
//
//  Created by Codex.
//

import Foundation

struct SystemMessage: Identifiable, Codable {
    let id: UUID
    let fromSystem: System
    let toPlayer: String
    var subject: String
    var body: String
    var date: Date
    var delivered: Bool
    var read: Bool

    init(
        from system: System,
        to player: String,
        subject: String,
        body: String,
        date: Date = Date(),
        delivered: Bool = false,
        read: Bool = false
    ) {
        self.id = UUID()
        self.fromSystem = system
        self.toPlayer = player
        self.subject = subject
        self.body = body
        self.date = date
        self.delivered = delivered
        self.read = read
    }
}

