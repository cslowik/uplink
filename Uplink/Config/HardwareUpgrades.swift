//
//  HardwareUpgrades.swift
//  Uplink
//
//  Created by Chris Slowik on 3/29/25.
//

import Foundation

let hardwareUpgrades: [HardwareTool] = [
    HardwareTool(name: "CPU", versions: [
        HardwareVersion(cost: 250, capacity: 20, description: "A slow and simple processor designed for use in parallel with many others, in large scale super-computers"),
        HardwareVersion(cost: 1000, capacity: 60, description: "An entry level processor, fitted as standard to all agent computers"),
        HardwareVersion(cost: 1500, capacity: 80, description: "A low budget, low speed processor"),
        HardwareVersion(cost: 3000, capacity: 100, description: "A reasonably fast processor, and a good upgrade choice for new agents"),
        HardwareVersion(cost: 5000, capacity: 120, description: "A faster processor with onboard MPU instruction handling for faster instruction execution"),
        HardwareVersion(cost: 8000, capacity: 150, description: "A very fast processor, ideal for cpu-intensive activity"),
        HardwareVersion(cost: 12000, capacity: 200, description: "A high-speed accelerated processor with unique pre-emptive instruction handling, for use in high-priority critical systems")
    ]),
    HardwareTool(name: "Modem", versions: [
        HardwareVersion(cost: 1000, capacity: 1, description: "An entry level modem with a low transfer rate, fitted as standard in all new Gateway systems"),
        HardwareVersion(cost: 2000, capacity: 2, description: "A low speed modem with a fairly low transfer rate"),
        HardwareVersion(cost: 4000, capacity: 4, description: "A reasonable speed modem at a good price"),
        HardwareVersion(cost: 6000, capacity: 6, description: "A fast modem, normally sufficient for all but the highest bandwidth requirements"),
        HardwareVersion(cost: 8000, capacity: 8, description: "A very fast modem for large files and fast access times"),
        HardwareVersion(cost: 10000, capacity: 10, description: "A blindingly fast modem which will take full advantage of the network bandwidth available")
    ]),
    HardwareTool(name: "Memory", versions: [
        HardwareVersion(cost: 3000, capacity: 8, description: "8 Gigaquads of storage space"),
        HardwareVersion(cost: 5500, capacity: 16, description: "16 Gigaquads of storage space"),
        HardwareVersion(cost: 8000, capacity: 24, description: "24 Gigaquads of storage space"),
        HardwareVersion(cost: 11000, capacity: 32, description: "32 Gigaquads of storage space")
    ]),
    HardwareTool(name: "Gateway Self Destruct", versions: [
        HardwareVersion(cost: 20000, capacity: 1, description: "Explosives attached to your computer to destroy any evidence. This is a doomsday device that has saved many agents from jail in the past.")
    ]),
    HardwareTool(name: "Gateway Motion Sensor", versions: [
        HardwareVersion(cost: 10000, capacity: 1, description: "Ultrasonic motion sensor, which can detect movement in your Gateway's room. Often used with self destruct.")
    ])
]
