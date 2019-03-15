//
//  Concentration.swift
//  Concentration Game
//
//  Created by Mariak Achuoth on 2019-03-14.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import Foundation


class Concentration
{
    var cards = [Card]()
    var indexOfOneAndOnlyFacedUpCard: Int?

    func chooseCard(at index: Int)
    {
        if !cards[index].isMatched{
            if let matchedIndex = indexOfOneAndOnlyFacedUpCard, matchedIndex != index{
                if cards[matchedIndex].identifier == cards[index].identifier{
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFacedUpCard = nil
            }else{
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFacedUp = false
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFacedUpCard = index
            }
        }

    }
    init(numberOfPairedOfCards: Int)
    {
        //countable range for loop
        for _ in 0..<numberOfPairedOfCards
        {
            //improve later
            let card = Card()
            cards += [card, card]
        }
    }
    
    // TODO: shuffle the cards methods implementation
}
