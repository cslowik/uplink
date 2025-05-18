//
//  Person.swift
//  Uplink
//
//  Created by Chris Slowik on 4/18/25.
//
// represents a digital entity in the game world

import Foundation

class Person: Identifiable {
    let id: UUID
    var name: String
    var localhost: String
    var rating: Int
    var messages: [Message]
    var bankAccounts: [BankAccount]

    init(name: String, localhost: String, rating: Int = 0) {
        self.id = UUID()
        self.name = name
        self.localhost = localhost
        self.rating = rating
        self.messages = []
        self.bankAccounts = []
    }

    func giveMessage(_ message: Message) {
        messages.append(message)
    }
/*
    func createBankAccount(bankIP: String, username: String, password: String, balance: Int) {
        let account = BankAccount(bankIP: bankIP, username: username, password: password, balance: balance)
        bankAccounts.append(account)
    }

    func changeBalance(for bankIP: String, amount: Int) {
        if let index = bankAccounts.firstIndex(where: { $0.bankIP == bankIP }) {
            bankAccounts[index].balance += amount
        }
    }

    func getBalance(for bankIP: String) -> Int? {
        return bankAccounts.first(where: { $0.bankIP == bankIP })?.balance
    }
 */
}
