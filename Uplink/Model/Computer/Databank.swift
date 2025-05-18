//
//  Databank.swift
//  Upload
//
//  File storage data storage of a person, computer, message etc.
//
//  Created by Chris Slowik on 4/23/25.
//

import Foundation

struct DataFile: Identifiable, Codable {
    let id: UUID
    var title: String
    var type: DataType
    var size: Int
    var encrypted: Bool
    var compressed: Bool
    var version: Float?
    var softwareType: SoftwareType?
    var description: String {
        return
            """
            Data:
                Type: \(type)
                Encrypted: \(encrypted)
                Compressed: \(compressed)
                Version: \(version ?? 0)
                Software Type: \(softwareType ?? .none)
            """
    }
}
enum DataType: Codable {
    case none
    case data
    case software
}

class Databank: Codable {
    var memory: [Int] = []
    var files: [DataFile] = []
    var formatted: Bool = false

    init() {}

    /// Wipe everything
    func format() {
        files = []
        memory = []
        formatted = true
    }

    func putFile(_ file: DataFile) {
        
    }
    
    /// Overwrites
    func putFile(_ file: DataFile, atMemoryIndex index: Int) {
        
    }

    /// Inserts file at a random position
    func insertFile(_ file: DataFile) {
        
    }

    /// Remove file from data and memory
    func removeFile(at index: Int) {
        
    }
    
    /// Check if a specific placement is valid
    /// 0 = yes, 1 = overwrite, 2 = no
    func isValidPlacement(_ file: DataFile, atMemoryIndex index: Int) -> Int {
        if index < 0 { return 2 }

        for i in index..<(index + file.size) {
            if i >= memory.count || i < 0 {
                return 2 // Not valid
            } else if i < memory.count, memory[i] != 0 {
                return 1 // Will overwrite
            }
        }

        return 0 // No conflicts
    }
    
    /// Find any valid placement for the file
    /// true = success, false = failure
    func findValidPlacement(_ file: DataFile) -> Bool? {
        for i in 0..<memory.count {
            if isValidPlacement(file, atMemoryIndex: i) == 0 {
                return true
            }
        }
        return false
    }
}
