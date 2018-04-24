//
//  Concentration.swift
//  concentration
//
//  Created by iosdev on 19.4.2018.
//  Copyright © 2018 cdrbbt. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func choseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                cards[matchIndex].isMatched = true
                cards[index].isMatched = true
            }
            cards[index].isFaceup = true
            indexOfOneAndOnlyFaceUpCard = nil
        } else {
            for flipDownIndex in cards.indices {
                cards[flipDownIndex].isFaceup = false
            }
            cards[index].isFaceup = true
            indexOfOneAndOnlyFaceUpCard = index
        }
    }
    }

    
    init(numberOfPairsOfCard: Int){
        for _ in 0..<numberOfPairsOfCard{
            let card = Card()
            cards += [card, card]
        }
        
        // TODO: Shuffle the cards
    }
}
