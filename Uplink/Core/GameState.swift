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
    @Published var currentGameTime: Date = Date()
    
    @Published var availableSystems: [System] = [
        System(
            name: SystemInfo.localHost.rawValue,
            ipAddress: SystemInfo.localHost.ipAddress,
            introMessage: SystemInfo.localHost.welcomeMessage),
        System(
            name: SystemInfo.uplinkPublicAccessMachine.rawValue,
            ipAddress: SystemInfo.uplinkPublicAccessMachine.ipAddress,
            introMessage: SystemInfo.uplinkPublicAccessMachine.welcomeMessage)
    ]

    @Published var connectedSystem: System? = nil
    

    init() {
        self.player = Player(name: "Test Player")
        self.ticker = GameTicker(gameState: self)
        ticker?.start()
        print("Player: \(player.name), Credits: \(player.credits)")
    }
    
    func setGameSpeed(_ speed: GameSpeed) {
        gameSpeed = speed
        ticker?.updateSpeed()
    }
}
