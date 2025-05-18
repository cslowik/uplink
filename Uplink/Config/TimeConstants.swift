//
//  Time.swift
//  Uplink
//
//  Created by Chris Slowik on 3/29/25.
//

import Foundation

// MARK: Times

let secondsInMinute: TimeInterval = 60
let secondsInHour: TimeInterval = 60 * secondsInMinute
let secondsInDay: TimeInterval = 24 * secondsInHour

let timeToPayLegalFine: TimeInterval = 7 * secondsInDay
let timeLegalAction: TimeInterval = 3 * secondsInHour
let timeLegalActionWarning: TimeInterval = 2 * secondsInMinute

let timeTacticalAction: TimeInterval = 5 * secondsInMinute
let timeTacticalActionWarning: TimeInterval = 1 * secondsInMinute

let timeToInstallHardware: TimeInterval = 14 * secondsInHour
let timeToInstallHardwareWarning: TimeInterval = 30 * secondsInMinute
let timeToChangeGateway: TimeInterval = 24 * secondsInHour

let timeToExpireLogs: TimeInterval = 40 * secondsInDay
let timeToExpireNews: TimeInterval = 30 * secondsInDay
let timeToExpireMissions: TimeInterval = 30 * secondsInDay

let timeToDemoGameOver: TimeInterval = 0
let timeToCoverBankRobbery: TimeInterval = 2 * secondsInMinute

let timeRevelationReproduce: TimeInterval = 3 * secondsInMinute
let timeARCBustedWithPlayer: TimeInterval = 15 * secondsInMinute
let timeARCBustedWithoutPlayer: TimeInterval = 10 * secondsInMinute

let frequencyGenerateNewMission: TimeInterval = 12 * secondsInHour
let frequencyCheckForSecurityBreaches: TimeInterval = 8 * secondsInHour
let frequencyCheckMissionDueDates: TimeInterval = 1 * secondsInDay
let frequencyGiveMissionToNPC: TimeInterval = 8 * secondsInHour
let frequencyExpireOldStuff: TimeInterval = 7 * secondsInDay
let frequencyAddInterestOnLoans: TimeInterval = 30 * secondsInDay
let frequencyDemoGenerateNewMission: TimeInterval = 4 * secondsInHour

//MARK: Tick/Time Data
/*
    Ticks Value represents a scale factor to multiply by -
    eg data of size 10 would take 10*ticksRequiredToDelete ticks to delete)

    Time value is in ms

    Used in : TaskManager, ConsoleScreen
*/

struct TicksRequired {
    static let copy = 45.0
    static let delete = 9.0
    static let decrypt = 90.0
    static let defrag = 3.0
    static let dictionaryHacker = 0.2
    static let logDeleter = 60.0
    static let logUndeleter = 60.0
    static let logModifier = 50.0
    static let analyzeProxy = 50.0
    static let disableProxy = 100.0
    static let analyzeFirewall = 40.0
    static let disableFirewall = 80.0
    static let bypassCypher = 0.1
    static let scanLanSystem = 70.0
    static let scanLanLinks = 100.0
    static let spoofLanSystem = 100.0
    static let forceLanLock = 100.0
    static let lanScan = 300.0
    static let deleteOneLog = 300.0
    static let deleteOneGigaQuad = 150.0
}
