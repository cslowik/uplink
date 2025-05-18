//
//  Ext-Date.swift
//  Upload
//
//  Created by Chris Slowik on 4/24/25.
//

import Foundation

extension Date {
    var day: Int {
        Calendar.current.component(.day, from: self)
    }
    
    var month: Int {
        Calendar.current.component(.month, from: self)
    }

    var year: Int {
        Calendar.current.component(.year, from: self)
    }
}
