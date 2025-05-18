//
//  LogBank.swift
//  Upload
//
//  Log history for a Computer (used for tracing, cover tracks etc)
//
//  Created by Chris Slowik on 4/23/25.
//

import Foundation

struct AccessLog: Equatable{
    var type: LogType
    var date: Date          // time of access
    var fromIP: String      // the IP the access came from
    var fromName: String    // the person who created the log
    var quality: LogQuality
    var data: [String]?
    
    var description: String {
        switch type {
        case .deleted:
            return "[Log Deleted]"
        case .connectionOpened:
            return "Connection established from \(fromIP)"
        case .connectionClosed:
            return "Connection from \(fromIP) closed"
        case .bounceBegin:
            guard let destination = data?.first else {
                fatalError("Missing bounce destination data in AccessLog")
            }
            return "Connection opened to \(destination)"
        case .bounce:
            guard let destination = data?.first else {
                fatalError("Missing bounce destination data in AccessLog")
            }
            return "Connection from \(fromIP) routed to \(destination)"
        case .transferTo:
            guard let info = data, info.count >= 3 else {
                return "Invalid Transfer log"
            }
            let ip = info[0]
            let acctNumber = info[1]
            let amount = info[2]
            return "\(amount) transferred to \(ip):\(acctNumber)"
        case .transferFrom:
            guard let info = data, info.count >= 3 else {
                return "Invalid Transfer log"
            }
            let ip = info[0]
            let acctNumber = info[1]
            let amount = info[2]
            return "\(amount) deposited from \(ip):\(acctNumber)"
        default:
            return "From: \(fromIP), Type: \(type), Data: \(String(describing: data))"
        }
    }
    
    static func == (lhs: AccessLog, rhs: AccessLog) -> Bool {
        return lhs.date == rhs.date &&
        lhs.type == rhs.type &&
        lhs.fromIP == rhs.fromIP &&
        lhs.fromName == rhs.fromName &&
        lhs.quality == rhs.quality &&
        lhs.data == rhs.data
    }
}

class Logbank {
    var logs: [AccessLog] = []
    var internalLogs: [AccessLog] = []
    
    func empty() {
        logs = []
        internalLogs = []
    }
    
    func addLog(_ log: AccessLog, index: Int?) {
        guard let insertIndex = index else { return }
        let resolvedIndex = insertIndex == -1 ? logs.count : insertIndex
        logs.insert(log, at: resolvedIndex)
        internalLogs.insert(log, at: resolvedIndex)
    }
    
    func logModified(at index: Int) -> Bool {
        guard index >= 0 && index < logs.count else { return false }
        let log = logs[index]
        let internalLog = internalLogs[index]
        return log != internalLog
    }
    /*
    func traceLog(toIP: String, logbankIP: String, date: Date, uplinkRating: Int) -> String? {
        // ensure required information is present
        guard !toIP.isEmpty, !logbankIP.isEmpty else { return nil }
        
        // TODO: Get the computer and company name from the IP using world/network system
        // placeholder for now
        
        let compLocal: Computer? = GameState.shared.findComputer(byIP: logbankIP)
        let companyLocal: Company? = GameState.shared.findCompany(byName: compLocal?.companyName ?? "")
        guard let computer = compLocal else { return nil }
        guard let company = companyLocal else { return nil }
        
        // Search logs
        for (index, log) in logs.enumerated() {
            var currentLog = log
            
            // Try to recover if deleted
            if currentLog.type == .deleted && uplinkRating >= minRequiredRatingUndeleteLogLevel1 {
                if index < internalLogs.count {
                    currentLog = internalLogs[index]
                }
            } else if logModified(at: index) && uplinkRating >= minRequiredRatingUndeleteLogLevel3 {
                // this one wasn't deleted but was overwritten. restore original if rating high enough
                if index < internalLogs.count {
                    currentLog = internalLogs[index]
                }
            }
            
            // Only look at teh log if it is within a few seconds of connection date
            var interval: TimeInterval = 10
            if abs(currentLog.date.timeIntervalSince(date)) <= interval {
                switch currentLog.type {
                case .bounceBegin:
                    // this computer is the origina of the bounced call
                    // and represents the soultion to this trace
                    if let destination = currentLog.data?.first, destination == toIP {
                        return logbankIP
                    }
                case .bounce:
                    // look up the source computer that created this log
                    if let destination = currentLog.data?.first, destination == toIP {
                        if let nextComputer = GameState.shared.findComputer(byIP: currentLog.fromIP) {
                            let isBank = computer.type == .publicBankServer
                            let isGov = computer.type == .government
                            
                            // if its not a bank or gov OR if you have the min rating required
                            if (!isBank || (isBank && uplinkRating >= minRequiredRatingHackBankServer)) && (!isGov || (isGov && uplinkRating >= minRequiredRatingHackGovernmentComputer)) {
                                return nextComputer.logbank.traceLog(toIP: toIP, logbankIP: logbankIP, date: date, uplinkRating: uplinkRating)
                            }
                        }
                    }
                }
            }
        }
    }*/
}

enum LogType: Int, Codable {
    case deleted = -1           // undeleted version may exist in internalLogs
    case none = 0
    case text = 1               // caption included in 'data1'
    case connectionOpened = 2   // connection received from 'fromIP'
    case connectionClosed = 3   // connection closed from 'fromIP'
    case bounceBegin = 4        // start point for a bounced call to IP in 'data[0]'
    case bounce = 5             // user bounces to IP in 'data[0]'
    case transferTo = 6         // transfer money to data[IP, amount, person]
    case transferFrom = 7       // transfer from data[IP, amount, person]
}

    /*
    Most logs are not suspicious.
    If a suspicious activity occurs, it becomes .suspicious
    Every [few] hours, these logs are changed to .suspiciousAndNoticed
    [A few] hours later, they become .underSupervision and are dealt with
    They are then changed back to .notSuspicious by the agent
     
    This means you have between [few] and [few+few] hours before you are traced.
     */

enum LogQuality: Codable {
    case notSuspicious
    case suspicious
    case suspiciousAndNoticed
    case underInvestigation
}
