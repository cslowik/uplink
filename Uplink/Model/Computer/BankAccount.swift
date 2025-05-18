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
        // Placeholder logic
        return false
    }

    func hasTransferOccurred(fromPerson person: String, amount: Int) -> Bool {
        // Placeholder logic
        return false
    }
}
