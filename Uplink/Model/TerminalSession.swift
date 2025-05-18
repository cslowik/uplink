//
//  TerminalSession.swift
//  Uplink
//
//  Created by Chris Slowik on 4/7/25.
//

import SwiftUI

final class TerminalSession: ObservableObject {
    @Published var currentSystem: System
    @Published var activeService: SystemService?
    @Published var step: SystemStep = .intro
    @Published var isAuthenticated = false
    @Published var username: String = ""
    @Published var password: String = ""
    
    init(system: System) {
        self.currentSystem = system
    }
}
