//
//  GameState.swift
//  Uplink
//
//  Created by Chris Slowik on 5/9/25.
//

import Foundation

enum GameSpeed: TimeInterval, CaseIterable {
    case paused = 0
    case normal = 1.0
    case fast = 0.25
    case ultra = 0.1
}


class GameState: ObservableObject {
    static var shared = GameState()
    var ticker: GameTicker?
    
    @Published var gameSpeed: GameSpeed = .normal
    @Published var player: Player
    @Published var uplinkCompany: CompanyUplink
    @Published var currentGameTime: Date = Date()
    
    @Published var availableSystems: [System] = []

    @Published var connectedSystem: System? = nil
    

    init(playerName: String = "Test Player") {
        self.player = Player(name: playerName)
        self.uplinkCompany = CompanyUplink()
        self.ticker = GameTicker(gameState: self)

        setupInitialWorld()

        ticker?.start()
        printSummary()
    }

    private func setupInitialWorld() {
        let home = System(
            name: SystemInfo.localHost.rawValue,
            ipAddress: SystemInfo.localHost.ipAddress,
            introMessage: SystemInfo.localHost.welcomeMessage,
            services: [.terminal, .fileBrowser])

        let uplink = System(
            name: SystemInfo.uplinkPublicAccessMachine.rawValue,
            ipAddress: SystemInfo.uplinkPublicAccessMachine.ipAddress,
            introMessage: SystemInfo.uplinkPublicAccessMachine.welcomeMessage,
            services: [.login, .missionBoard])

        availableSystems = [home, uplink]
    }

    func printSummary() {
        print("=== Game State ===")
        print("Player: \(player.name) | Credits: \(player.credits)")
        print("Available Systems:")
        for sys in availableSystems {
            print(" - \(sys.name) (\(sys.ipAddress))")
        }
        print("Company: \(uplinkCompany.name)")
        print("Current Game Time: \(currentGameTime)")
    }
    
    func setGameSpeed(_ speed: GameSpeed) {
        gameSpeed = speed
        ticker?.updateSpeed()
    }
}
