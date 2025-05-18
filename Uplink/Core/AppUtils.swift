//
//  AppUtils.swift
//  Uplink
//
//  Created by Chris Slowik on 3/30/25.
//

import Foundation

enum Screen {
    case login
    case mainMenu
    case inGame
    case settings
    case loading
    case startup
    case register
}

class AppModel: ObservableObject {
    @Published var currentScreen: Screen = .login
    @Published var isGameLoaded: Bool = false
    /// Shared game state accessible throughout the app
    @Published var gameState: GameState = GameState.shared
    /*
     static func loadSavedUsernames()->[String] {
     if let names = UserDefaults.standard.array(forKey: "SavedUsernames") as? [String] {
     return names
     }
     return []
     }
     
     static func saveUsername(_ name: String) {
     var savedUsernames = AppModel.loadSavedUsernames()
     if !savedUsernames.contains(name) {
     savedUsernames.append(name)
     UserDefaults.standard.set(savedUsernames, forKey: "SavedUsernames")
     }
     }
     
     func saveGame() {
     let encoder = JSONEncoder()
     do {
     if let data = GameState.shared.encoded() {
     let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("savedGame.json")
     try data.write(to: url)
     }
     } catch {
     print("Failed to save game: \(error)")
     }
     }
     
     func loadSavedGame() -> GameState? {
     let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("savedGame.json")
     guard let data = try? Data(contentsOf: url) else { return nil }
     return GameState.load(from: data)
     }
     }
     */
    
    /*
     class AppStartupService {
     func runUplink(appModel: AppModel) {
     loadData(appModel: appModel)
     initGame(appModel: appModel)
     
     
     if let uplinkSystem = GameState.shared.knownSystems.first(where: { $0.name == SystemInfo.uplinkPublicAccessMachine.rawValue }) {
     GameState.shared.connectedSystem = uplinkSystem
     appModel.currentScreen = .startup
     }
     }
     
     private func loadData(appModel: AppModel) {
     if let saved = appModel.loadSavedGame() {
     appModel.isGameLoaded = true
     }
     }
     
     private func initGame(appModel: AppModel) {
     GameState.reset()
     appModel.gameState = GameState.shared
     }
     }
     */
}
