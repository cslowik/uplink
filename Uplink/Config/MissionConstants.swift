//
//  MissionConstants.swift
//  Uplink
//
//  Created by Chris Slowik on 3/29/25.
//

import Foundation

//MARK: Mission Probabilities
// Index corresponds to agent rating

let missionProbabilities: [MissionType: [Int]] = [
    .stealFile: [30, 40, 30, 15, 5, 30, 15, 10, 0, 0, 0, 5, 5, 5, 5, 5, 5],
    .destroyFile: [30, 40, 30, 15, 40, 10, 15, 5, 0, 0, 0, 5, 5, 5, 5, 5, 5],
    .changeData:[25, 15, 25, 60, 40, 30, 20, 15, 15, 5, 0, 5, 5, 5, 5, 5, 5],
    .findData:[15, 5, 15, 10, 15, 30, 15, 15, 5, 0, 0, 5, 5, 5, 5, 5, 5],
    .removeComputer:[0, 0, 0, 0, 0, 0, 35, 25, 20, 5, 10, 20, 20, 20, 20, 20, 20],
    .changeAccount:[0, 0, 0, 0, 0, 0, 0, 30, 20, 25, 30, 20, 20, 20, 20, 20, 20],
    .removeUser:[0, 0, 0, 0, 0, 0, 0, 0, 40, 25, 30, 20, 20, 20, 20, 20, 20],
    .frameUser:[0, 0, 0, 0, 0, 0, 0, 0, 0, 40, 30, 20, 20, 20, 20, 20, 20],
    .removeCompany:[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    .special:[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    .traceUser:[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
]

// MARK: Payments
// Average payments are multiplied by the difficulty

let paymentVariance = 0.3

let missionPayments: [MissionSubtype: Int] = [
    .stealFile: 900,
    .stealAllFiles: 1500,
    .destroyFile: 800,
    .destroyAllFiles: 1400,
    .findData: 1000,
    .findDataFinancial: 1200,
    .changeData: 1000,
    .changeDataAcademic: 1000,
    .changeDataSocial: 1200,
    .changeDataCriminal: 1500,
    .frameUser: 2200,
    .traceUser: 1800,
    .changeAccount: 1700,
    .removeComputer: 1600,
    .removeCompany: 2000,
    .removeUser: 1900,
    .specialBackfire: 15000,
    .specialTracer: 10000,
    .specialTakeMeToYourLeader: 30000,
    .specialARCInfiltration: 30000,
    .specialCounterAttack: 50000,
    .specialMaidenFlight: 10000,
    .specialDarwin: 15000,
    .specialSaveItForTheJury: 20000,
    .specialShinyHammer: 30000,
    .specialGrandTour: 50000,
    .specialMole: 50000
]

// MARK: Mission Minimum Ratings

let difficultyVariance = 2

let missionMinimumRatings: [MissionSubtype: Int] = [
    .stealFile: 2,
    .stealAllFiles: 5,
    .destroyFile: 2,
    .destroyAllFiles: 5,
    .findData: 2,
    .findDataFinancial: 5,
    .changeData: 3,
    .changeDataAcademic: 3,
    .changeDataSocial: 4,
    .changeDataCriminal: 5,
    .frameUser: 9,
    .traceUser: 7,
    .traceUserBankFraud: 8,
    .changeAccount: 7,
    .removeComputer: 6,
    .removeCompany: 8,
    .removeUser: 8
]
