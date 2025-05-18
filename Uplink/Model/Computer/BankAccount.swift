//
//  BankAccount.swift
//  Upload
//
//  Stores info about user bank accounts
//  (credentials, balance, etc)
//
//  Created by Chris Slowik on 4/23/25.
//

import Foundation

struct BankAccount {
    var name: String
    var password: String
    var security: Int
    var accountNumber: Int
    var balance: Int
    var loan: Int
    var log = Logbank()

    func hasTransferOccurred(sourceIP: String, targetIP: String, targetAccountNumber: Int, amount: Int) -> Bool {
        for (index, entry) in log.logs.enumerated() {
            var current = entry

            if current.type == .deleted {
                if index < log.internalLogs.count {
                    current = log.internalLogs[index]
                }
            } else if log.logModified(at: index) {
                if index < log.internalLogs.count {
                    current = log.internalLogs[index]
                }
            }

            guard current.fromIP == sourceIP else { continue }
            guard let info = current.data, info.count >= 3 else { continue }

            let loggedIP = info[0]
            let loggedAccount = Int(info[1]) ?? -1
            let loggedAmount = Int(info[2]) ?? -1

            if loggedIP == targetIP && loggedAccount == targetAccountNumber && loggedAmount == amount {
                if current.type == .transferTo || current.type == .transferFrom {
                    return true
                }
            }
        }
        return false
    }

    func hasTransferOccurred(fromPerson person: String, amount: Int) -> Bool {
        for (index, entry) in log.logs.enumerated() {
            var current = entry

            if current.type == .deleted {
                if index < log.internalLogs.count {
                    current = log.internalLogs[index]
                }
            } else if log.logModified(at: index) {
                if index < log.internalLogs.count {
                    current = log.internalLogs[index]
                }
            }

            guard current.fromName == person else { continue }
            guard let info = current.data, info.count >= 3 else { continue }

            let loggedAmount = Int(info[2]) ?? -1

            if loggedAmount == amount && (current.type == .transferTo || current.type == .transferFrom) {
                return true
            }
        }
        return false
    }
}
