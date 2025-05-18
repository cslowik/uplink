//
//  GameTicker.swift
//  Uplink
//
//  Created by Chris Slowik on 5/9/25.
//

import Foundation

class GameTicker {
    weak var gameState: GameState?
    var timer: Timer?
    
    init(gameState: GameState? = nil) {
        self.gameState = gameState
    }

    func start() {
        setupTimer()
    }

    func setupTimer() {
        timer?.invalidate()
        guard let game = gameState else { return }
        let interval = game.gameSpeed.rawValue

        guard interval > 0 else { return } // paused

        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
            game.currentGameTime = game.currentGameTime.addingTimeInterval(1)
            // Any other game tick logic
        }
    }

    func updateSpeed() {
        setupTimer()
    }

    func stop() {
        timer?.invalidate()
    }
}
