//
//  Mission.swift
//  Uplink
//
//  Created by Chris Slowik on 3/28/25.
//

import Foundation

struct Mission: Identifiable, Codable {
    var id: UUID = UUID()
    var type: MissionType
    var status: MissionStatus
    var title: String
    var description: String     // after acceptance
    var snippet: String         // on boards
    var deadline: Date?
    var completionMessages: [String] = []
    var payment: Int
    var maxPayment: Int         // can negotiate with high rating
    var paymentMethod: PaymentMethod
    var employer: String
    var contact: String
    var createDate: Date
    var difficulty: Int
    var minUplinkRating: Int    // can view mission
    var acceptRating: Int       // can accept mission
    var npcPriority: Bool = false
    // whySoMuchMoney
    // howSecure
    // whoIsTarget
    var links: [String] = []
    var codes: [String: String] = [:] // IP address -> code
    
    var debugDescription: String {
        var output = ""
        output += title + "\n"
        output += snippet + "\n"
        output += "Mission type: \(type)\n"
        output += "Employer: \(employer), Payment: \(payment), Difficulty: \(difficulty), MinRating: \(minUplinkRating), AcceptRating: \(acceptRating), Description: \(description)\n"
        output += "NPC priority: \(npcPriority)\n"
        output += "Create date: \(createDate)\n"
        
        for (i, msg) in completionMessages.enumerated() {
            output += "\tCompletion \(Character(UnicodeScalar(65 + i)!)): \(msg)\n"
        }
        output += "\tContact: \(contact)\n"
        output += "\tSnippet: \(snippet)\n"
        output += "\tDeadline: \(deadline?.description ?? "None")\n"

        output += "\tLinks:\n"
        for link in links {
            output += "\t - \(link)\n"
        }

        output += "\tAccess Codes:\n"
        for (ip, code) in codes {
            output += "\t - \(ip): \(code)\n"
        }

        return output
    }
    
    mutating func setCompletionMessages(_ messages: [String]) {
        self.completionMessages = messages
    }
    
    mutating func giveLink(_ link: String) {
        links.append(link)
    }
    
    mutating func giveCode(ip: String, code: String) {
        codes[ip] = code
    }
    
}


enum PaymentMethod: Codable {
    case allNow
    case halfNow
    case completion
}

enum MissionStatus: Codable {
    case created
    case active
    case completed
    case failed
}

enum MissionType: String, Codable {
    case stealFile
    case destroyFile
    case changeData
    case findData
    case removeComputer
    case changeAccount
    case removeUser
    case frameUser
    case removeCompany
    case special
    case traceUser
}

enum MissionSubtype: String {
    case stealFile, stealAllFiles
    case destroyFile, destroyAllFiles
    case findData, findDataFinancial
    case changeData, changeDataAcademic, changeDataSocial, changeDataCriminal
    case frameUser, traceUser, traceUserBankFraud
    case changeAccount, removeComputer, removeCompany, removeUser
    case specialBackfire, specialTracer, specialTakeMeToYourLeader
    case specialARCInfiltration, specialCounterAttack
    case specialMaidenFlight, specialDarwin, specialSaveItForTheJury
    case specialShinyHammer, specialGrandTour, specialMole
}
