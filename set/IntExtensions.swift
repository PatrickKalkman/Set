//
//  IntExtensions.swift
//  set
//
//  Created by Patrick Kalkman on 19/01/2018.
//  Copyright © 2018 SimpleTechture. All rights reserved.
//

import Foundation

extension Int {
    func arc4Random() -> Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
