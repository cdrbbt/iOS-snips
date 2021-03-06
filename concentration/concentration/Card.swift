//
//  Card.swift
//  concentration
//
//  Created by iosdev on 19.4.2018.
//  Copyright © 2018 cdrbbt. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceup = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier () -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
