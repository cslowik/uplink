//
//  News.swift
//  Upload
//
//  Created by Chris Slowik on 4/23/25.
//

import Foundation

struct News: Identifiable, Codable {
    var id: UUID = UUID()
    var date: Date
    var headline: String
    var details: String
    var type: NewsType
    var data1: String?
    var data2: String?
    
    var description: String {
        var output = ""
        output += "News: \(headline)\n"
        output += details + "\n"
        output += "Type: \(type)\n"
        output += "Data 1: \(data1 ?? "") \n"
        output += "Data 2: \(data2 ?? "") \n"
        return output
    }
}

enum NewsType: Int, Codable {
    case none = 0
    case hacked = 1
    case arrest = 2
    case deleted = 3
    case stolen = 4
    case shutdown = 5
    case destroyed = 6
}
