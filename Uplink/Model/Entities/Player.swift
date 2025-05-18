//
//  Player.swift
//  Uplink
//
//  Created by Chris Slowik on 5/9/25.
//

import Foundation

class Player {
    var name: String
    var credits: Int
    var rating: Int
    
    init(name: String, credits: Int = 2500, rating: Int = 1) {
        self.name = name
        self.credits = credits
        self.rating = rating
    }
}
