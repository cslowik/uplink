//
//  Sale.swift
//  Upload
//
//  Represents a sellable item like
//  software, hardware, or information.
//
//  Created by Chris Slowik on 4/23/25.
//

import Foundation

struct Sale: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var saleType: SaleType
    var versions: [SaleVersion]
    
    init(from software: SoftwareTool) {
            self.id = UUID()
            self.title = software.name
            self.saleType = .software
            self.versions = software.versions.map {
                SaleVersion(
                    details: $0.description,
                    cost: $0.cost,
                    size: $0.size,
                    data: 0 //add versioning or tool power later if needed
                )
            }
        }

        init(from hardware: HardwareTool) {
            self.id = UUID()
            self.title = hardware.name
            self.saleType = .hardware
            self.versions = hardware.versions.map {
                SaleVersion(
                    details: $0.description,
                    cost: $0.cost,
                    size: $0.capacity,
                    data: 0 //store MHz, slots, or upgrade level here
                )
            }
        }
}

struct SaleVersion: Identifiable, Codable {
    var id: UUID = UUID()
    var details: String
    var cost: Int
    var size: Int
    var data: Int
}

enum SaleType: Int, Codable {
    case none = 0
    case software = 1
    case hardware = 2
}
