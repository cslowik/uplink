import SwiftUI

struct TerminalView: View {
    @StateObject private var session: TerminalSession
    @State private var log: [String] = []
    @State private var command: String = ""

    init(system: System) {
        _session = StateObject(wrappedValue: TerminalSession(system: system))
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(Array(log.enumerated()), id: \.offset) { index, line in
                            Text(line)
                                .bodyText()
                                .id(index)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .background(Color.black)
                .onChange(of: log.count) { _ in
                    proxy.scrollTo(log.count - 1, anchor: .bottom)
                }
            }
            HStack {
                TerminalTextField(placeholder: "command", text: $command)
                TerminalButton(text: "Send") { handleCommand() }
            }
        }
        .padding()
        .onAppear {
            log.append("Welcome to \(session.currentSystem.name)")
            log.append(session.currentSystem.introMessage)
            log.append("Type 'help' for commands.")
        }
    }

    private func handleCommand() {
        let trimmed = command.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        log.append("> \(trimmed)")
        command = ""

        switch trimmed.lowercased() {
        case "help":
            log.append("Available commands: scan, connect [ip], help")
        case "scan":
            let list = GameState.shared.availableSystems
                .map { "\($0.ipAddress) (\($0.name))" }
                .joined(separator: "\n")
            log.append(list)
        case let cmd where cmd.starts(with: "connect"):
            let parts = cmd.split(separator: " ")
            guard parts.count > 1 else {
                log.append("Usage: connect [ip]")
                return
            }
            let ip = String(parts[1])
            if let target = GameState.shared.availableSystems.first(where: { $0.ipAddress == ip }) {
                GameState.shared.connectedSystem = target
                session.currentSystem = target
                log.append("Connected to \(target.name)")
                log.append(target.introMessage)
            } else {
                log.append("Host not found")
            }
        default:
            log.append("Unknown command")
        }
    }
}

#Preview {
    TerminalView(system: GameState().availableSystems.first!)
}
