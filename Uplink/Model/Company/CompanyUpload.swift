//
//  CompanyUplink.swift
//  Uplink
//
//  This is a specific version of the company class,
//  Modified to represent the company Uplink only.
//
//  Created by Chris Slowik on 4/20/25.
//

import Foundation

class CompanyUplink: Company {
    var missions: [Mission] = []
    var hwSales: [Sale] = []
    var swSales: [Sale] = []
    var news: [News] = []

    override init(name: String = "Uplink", admin: String = "Uplink Admin", type: CompanyType = .commercial) {
        super.init(name: name, admin: admin, type: type)
    }

    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
    func createMission(employer: Company, type: MissionType, title: String, payment: Int, description: String, snippet: String) {
        let newMission = Mission(
            type: type,
            status: .created,
            title: title,
            description: description,
            snippet: snippet,
            payment: payment,
            maxPayment: payment,
            paymentMethod: .completion,
            employer: employer.name,
            contact: employer.admin,
            createDate: GameState.shared.currentGameTime,
            difficulty: 0,
            minUplinkRating: -1,
            acceptRating: 0)

        // Insert mission in order based on createDate
        if let index = missions.firstIndex(where: { newMission.createDate < $0.createDate }) {
            missions.insert(newMission, at: index)
        } else {
            missions.append(newMission)
        }
    }
}
