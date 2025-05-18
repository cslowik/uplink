//
//  StartingConditions.swift
//  Uplink
//
//  Created by Chris Slowik on 3/29/25.
//

import Foundation

//MARK: Starting Conditions - World

let worldStartDate = DateComponents(year: 2010, month: 2, day: 24, hour: 0, minute: 0, second: 0)
let gameStartDate = DateComponents(year: 2010, month: 3, day: 24, hour: 0, minute: 0, second: 0)
let companySizeAverage: Double = 20
let companySizeRange: Double = 20
let companyGrowthAverage: Double = 0.1
let companyGrowthRange: Double = 0.2
let companyAlignmentAverage: Double = 0
let companyAlignmentRange: Double = 50


//MARK: Starting Conditions - Player

let playerStartBalance = 3000
let playerStartCreditRating = 10
let playerStartUplinkRating = 0
let playerStartNeuromancerRating = 5
let playerStartGatewayType = 0
let playerStartCPUType = "CPU (60 Ghz)"
let playerStartModemSpeed = 1
let playerStartMemorySize = 24


//MARK: Starting Counts

let numStartingCompanies = 30
let numStartingBanks = 7
let numStartingPeople = 50
let numStartingAgents = 30
let numStartingMissions = 20
let numStartingPhotos = 20
let numStartingVoices = 4
