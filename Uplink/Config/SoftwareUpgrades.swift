//
//  SoftwareUpgrades.swift
//  Uplink
//
//  Created by Chris Slowik on 3/29/25.
//

import Foundation

let softwareUpgrades: [SoftwareTool] = [
    SoftwareTool(name: "Decrypter", type: .cracker, versions: [
        SoftwareVersion(cost: 800, size: 2, description: "Decrypts any file encrypted with an Encrypter v1.0"),
        SoftwareVersion(cost: 1200, size: 2, description: "Decrypts any file encrypted with an Encrypter v2.0 or below"),
        SoftwareVersion(cost: 1600, size: 2, description: "Decrypts any file encrypted with an Encrypter v3.0 or below"),
        SoftwareVersion(cost: 2200, size: 2, description: "Decrypts any file encrypted with an Encrypter v4.0 or below"),
        SoftwareVersion(cost: 3000, size: 3, description: "Decrypts any file encrypted with an Encrypter v5.0 or below"),
        SoftwareVersion(cost: 7000, size: 4, description: "Decrypts any file encrypted with an Encrypter v6.0 or below"),
        SoftwareVersion(cost: 15000, size: 5, description: "Decrypts any file encrypted with an Encrypter v7.0 or below"),
    ]),
    SoftwareTool(name: "Decypher", type: .cracker, versions: [
        SoftwareVersion(cost: 3000, size: 2, description: "Breaks through Encryption Cyphers. Uses a Quadratic Decryption Algorithm to force crack an Elliptic-curve Encryption Cypher"),
        SoftwareVersion(cost: 5000, size: 2, description: "Breaks through Encryption Cyphers. This is a faster implementation of the Quadratic Decryption Algorithm"),
        SoftwareVersion(cost: 8000, size: 2, description: "Breaks through Encryption Cyphers. This is the fastest version of this item of Software")
    ]),
    SoftwareTool(name: "Dictionary Hacker", type: .cracker, versions: [
        SoftwareVersion(cost: 1000, size: 4, description: "A cheap and fast method of breaking passwords. This software tool tries every word in a ten-thousand word dictionary as a password. It is faster than a Password Breaker, but not guaranteed to find an answer.")
    ]),
    
    SoftwareTool(name: "File Copier", type: .fileUtil, versions: [
        SoftwareVersion(cost: 100, size: 1, description: "Copies programs and data from one databank to another Standard software tool given free to all Agents")
    ]),
    SoftwareTool(name: "File Deleter", type: .fileUtil, versions: [
        SoftwareVersion(cost: 100, size: 1, description: "Deletes programs and data from a databank Standard software tool given free to all Agents")
    ]),
    SoftwareTool(name: "Defrag", type: .fileUtil, versions: [
        SoftwareVersion(cost: 5000, size: 2, description: "Pushes all of your files together at the top of your memory banks and frees up large blocks of space for use")
    ]),
    SoftwareTool(name: "Firewall Bypass", type: .bypasser, versions: [
        SoftwareVersion(cost: 3000, size: 1, description: "Actively bypasses firewall systems with a security level of 1. All bypassers require a 'HUD:ConnectionAnalysis' upgrade first"),
        SoftwareVersion(cost: 4000, size: 1, description: "Actively bypasses firewall systems with a security level of 2. All bypassers require a 'HUD:ConnectionAnalysis' upgrade first"),
        SoftwareVersion(cost: 6000, size: 1, description: "Actively bypasses firewall systems with a security level of 3. All bypassers require a 'HUD:ConnectionAnalysis' upgrade first"),
        SoftwareVersion(cost: 8000, size: 1, description: "Actively bypasses firewall systems with a security level of 4. All bypassers require a 'HUD:ConnectionAnalysis' upgrade first"),
        SoftwareVersion(cost: 10000, size: 1, description: "Actively bypasses firewall systems with a security level of 5. All bypassers require a 'HUD:ConnectionAnalysis' upgrade first")
    ]),
    SoftwareTool(name: "Firewall Disable", type: .security, versions: [
        SoftwareVersion(cost: 2000, size: 1, description: "Disables a firewall with a security level of 1. This action will be detected immediately"),
        SoftwareVersion(cost: 3000, size: 1, description: "Disables a firewall with a security level of 2. This action will be detected immediately"),
        SoftwareVersion(cost: 4000, size: 1, description: "Disables a firewall with a security level of 3. This action will be detected immediately"),
        SoftwareVersion(cost: 6000, size: 2, description: "Disables a firewall with a security level of 4. This action will be detected immediately"),
        SoftwareVersion(cost: 8000, size: 3, description: "Disables a firewall with a security level of 5. This action will be detected immediately")
    ]),
    SoftwareTool(name: "Connection Analyser", type: .hudUpgrade, versions: [
        SoftwareVersion(cost: 20000, size: 3, description: "Upgrades your HUD so you can see the security systems installed on your target computer and launch bypass software at them")
    ]),
    SoftwareTool(name: "IRC Client", type: .hudUpgrade, versions: [
        SoftwareVersion(cost: 4000, size: 2, description: "Upgrades your HUD with a new screen, in which you can participate in Internet Relay Chat to other hackers.")
    ]),
    SoftwareTool(name: "Map Show Trace", type: .hudUpgrade, versions: [
        SoftwareVersion(cost: 5000, size: 1, description: "Upgrades your HUD so your map shows the progress of any trace on your connection. Replaces the Trace Tracker")
    ]),
    SoftwareTool(name: "LAN View", type: .hudUpgrade, versions: [
        SoftwareVersion(cost: 50000, size: 5, description: "Upgrades your HUD so you can analyze and connect to LAN systems. This upgrade is required before you can install and run any LAN software.")
    ]),
    SoftwareTool(name: "IP Lookup", type: .other, versions: [
        SoftwareVersion(cost: 500, size: 1, description: "Converts a raw IP number into an Internet address and adds it to your links")
    ]),
    SoftwareTool(name: "IP Probe", type: .other, versions: [
        SoftwareVersion(cost: 2000, size: 3, description: "Scans a given IP address for security systems and reports the types in use"),
        SoftwareVersion(cost: 4000, size: 3, description: "Scans a given IP address for security systems and reports the types and version information"),
        SoftwareVersion(cost: 5000, size: 3, description: "Scans a given IP address for security systems and reports the types, versions, and status")
    ]),
    SoftwareTool(name: "LAN Probe", type: .lanTool, versions: [
        SoftwareVersion(cost: 15000, size: 3, description: "Scans a single system on a LAN, and the links running from it"),
        SoftwareVersion(cost: 20000, size: 3, description: "Scans a single system on a LAN, and the links running from it"),
        SoftwareVersion(cost: 30000, size: 4, description: "Scans a single system on a LAN, and the links running from it")
    ]),
    SoftwareTool(name: "LAN Scan", type: .lanTool, versions: [
        SoftwareVersion(cost: 10000, size: 2, description: "Scans an entire LAN, looking for systems"),
        SoftwareVersion(cost: 15000, size: 2, description: "Scans an entire LAN, looking for systems"),
        SoftwareVersion(cost: 25000, size: 2, description: "Scans an entire LAN, looking for systems")
    ]),
    SoftwareTool(name: "LAN Spoof", type: .lanTool, versions: [
        SoftwareVersion(cost: 20000, size: 2, description: "Spoofs a system on the network, fooling the network into believing you are that system. Works on level 1 systems only."),
        SoftwareVersion(cost: 30000, size: 2, description: "Spoofs a system on the network, fooling the network into believing you are that system. Works on level 1 and 2 systems only."),
        SoftwareVersion(cost: 45000, size: 2, description: "Spoofs a system on the network, fooling the network into believing you are that system. Works on all systems."),
    ]),
    SoftwareTool(name: "LAN Force", type: .lanTool, versions: [
        SoftwareVersion(cost: 15000, size: 2, description: "This tool will force open any lock system you might encounter. The sysadmin will probably notice this"),
        SoftwareVersion(cost: 20000, size: 3, description: "This tool will force open any lock system you might encounter. The sysadmin will probably notice this"),
        SoftwareVersion(cost: 25000, size: 4, description: "This tool will force open any lock system you might encounter. The sysadmin will probably notice this"),
    ]),
    SoftwareTool(name: "Log Deleter", type: .security, versions: [
        SoftwareVersion(cost: 500, size: 1, description: "Deletes the contents of an access log from a computer. Leaves behind an empty log."),
        SoftwareVersion(cost: 1000, size: 1, description: "Deletes an access log from a computer. Leaves a distinctive blank space behind."),
        SoftwareVersion(cost: 2000, size: 1, description: "Copies another user's legitimate access log over your own. Very difficult to detect"),
        SoftwareVersion(cost: 4000, size: 1, description: "Deletes an access log from a computer. Moves other logs up to cover empty space. Undetectable")
    ]),
    SoftwareTool(name: "Log Modifier", type: .security, versions: [
        SoftwareVersion(cost: 4000, size: 2, description: "Allows you to make modifications on an existing log"),
        SoftwareVersion(cost: 6000, size: 2, description: "Allows you to make modifications on an existing log, and create new logs in blank spaces")
    ]),
    SoftwareTool(name: "Log Undeleter", type: .security, versions: [
        SoftwareVersion(cost: 5000, size: 1, description: "Recovers previously deleted logs")
    ]),
    SoftwareTool(name: "Monitor Bypass", type: .bypasser, versions: [
        SoftwareVersion(cost: 10000, size: 1, description: "Actively bypasses a monitor with a security level of 1. Requires Connection Analyzer upgrade"),
        SoftwareVersion(cost: 12000, size: 1, description: "Actively bypasses a monitor with a security level of 2. Requires Connection Analyzer upgrade"),
        SoftwareVersion(cost: 16000, size: 1, description: "Actively bypasses a monitor with a security level of 3. Requires Connection Analyzer upgrade"),
        SoftwareVersion(cost: 20000, size: 1, description: "Actively bypasses a monitor with a security level of 4. Requires Connection Analyzer upgrade"),
        SoftwareVersion(cost: 25000, size: 1, description: "Actively bypasses a monitor with a security level of 5. Requires Connection Analyzer upgrade"),
    ]),
    SoftwareTool(name: "Password Breaker", type: .cracker, versions: [
        SoftwareVersion(cost: 1500, size: 2, description: "Hacks most password protection. Not as fast as a Dictionary Hacker but is guaranteed to work eventually")
    ]),
    SoftwareTool(name: "Proxy Bypass", type: .bypasser, versions: [
        SoftwareVersion(cost: 6000, size: 1, description: "Actively bypasses a proxy server with a security level of 1. Requires Connection Analyzer upgrade"),
        SoftwareVersion(cost: 8000, size: 1, description: "Actively bypasses a proxy server with a security level of 2. Requires Connection Analyzer upgrade"),
        SoftwareVersion(cost: 12000, size: 1, description: "Actively bypasses a proxy server with a security level of 3. Requires Connection Analyzer upgrade"),
        SoftwareVersion(cost: 16000, size: 1, description: "Actively bypasses a proxy server with a security level of 4. Requires Connection Analyzer upgrade"),
        SoftwareVersion(cost: 20000, size: 1, description: "Actively bypasses a proxy server with a security level of 5. Requires Connection Analyzer upgrade"),
    ]),
    SoftwareTool(name: "Proxy Disable", type: .bypasser, versions: [
        SoftwareVersion(cost: 6000, size: 1, description: "Disables a proxy server with a security level of 1. This action will be detected immediately"),
        SoftwareVersion(cost: 8000, size: 1, description: "Disables a proxy server with a security level of 2. This action will be detected immediately"),
        SoftwareVersion(cost: 12000, size: 1, description: "Disables a proxy server with a security level of 3. This action will be detected immediately"),
        SoftwareVersion(cost: 16000, size: 1, description: "Disables a proxy server with a security level of 4. This action will be detected immediately"),
        SoftwareVersion(cost: 20000, size: 1, description: "Disables a proxy server with a security level of 5. This action will be detected immediately"),
    ]),
    SoftwareTool(name: "Trace Tracker", type: .security, versions: [
        SoftwareVersion(cost: 300, size: 1, description: "Informs you on the status of any traces on your connection."),
        SoftwareVersion(cost: 600, size: 1, description: "Informs you on the progress (percentage) of any traces on your connection."),
        SoftwareVersion(cost: 1400, size: 2, description: "Informs you on the approximate time remaining of any traces on your connection."),
        SoftwareVersion(cost: 2500, size: 3, description: "Informs you on the exact time remaining of any traces on your connection."),
    ]),
    SoftwareTool(name: "Voice Analyzer", type: .other, versions: [
        SoftwareVersion(cost: 5000, size: 4, description: "Records and analyzes voice patterns for reproduction. Can be used to overcome voice authorizations")
    ])
]
