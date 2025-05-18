//
//  Company.swift
//  Uplink
//
// Represents a company in the game world.  The company could be
// a corporation, military, government, academic etc.
//
//  Created by Chris Slowik on 4/20/25.
//

import Foundation

enum CompanyType: Int, Codable {
    case unknown = 0
    case industrial = 1
    case commercial = 2
    case financial = 3
    case academic = 4
    case military = 5
    case government = 6
    
    var description: String {
            switch self {
            case .unknown: return "Unknown"
            case .industrial: return "Industrial"
            case .commercial: return "Commercial"
            case .financial: return "Financial"
            case .academic: return "Academic"
            case .military: return "Military"
            case .government: return "Government"
            }
        }
}

class Company: Codable {
    var name: String
    var admin: String
    var type: CompanyType
    //var boss: String
    //var size: Int
    //var growth: Int
    //var alignment: Int
    
}
