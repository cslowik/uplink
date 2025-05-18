//
//  Message.swift
//  Uplink
//
//  Created by Chris Slowik on 4/18/25.
//

import Foundation

enum MessageType: String, Codable {
    case system
    case mission
    case personal
    case warning
    case unknown
}

struct Message: Identifiable, Codable {
    let id: UUID
    let from: String
    let to: String
    var subject: String
    var body: String
    var date: Date
    var type: MessageType
    var delivered: Bool
    var read: Bool
    var priority: Int           // 0 = low, 1 = normal, 2 = urgent
    var attachments: [String]?  // e.g. filenames, system IPs, file IDs
    var replyToID: UUID?        // parent message ID
    var tags: [String]?         // e.g. ["mission", "bank", "urgent"]
    var expiresAt: Date?
    var isArchived: Bool
    var isDeleted: Bool

    init(
        from: String,
        to: String,
        subject: String,
        body: String,
        type: MessageType = .unknown,
        date: Date = Date(),
        delivered: Bool = false,
        read: Bool = false,
        priority: Int = 1,
        attachments: [String]? = nil,
        replyToID: UUID? = nil,
        tags: [String]? = nil,
        expiresAt: Date? = nil,
        isArchived: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = UUID()
        self.from = from
        self.to = to
        self.subject = subject
        self.body = body
        self.date = date
        self.type = type
        self.delivered = delivered
        self.read = read
        self.priority = priority
        self.attachments = attachments
        self.replyToID = replyToID
        self.tags = tags
        self.expiresAt = expiresAt
        self.isArchived = isArchived
        self.isDeleted = isDeleted
    }
}
