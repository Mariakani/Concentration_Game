//
//  Card.swift
//  Concentration Game
//
//  Created by Mariak Achuoth on 2019-03-14.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import Foundation


struct Card {
    var isFacedUp = false
    var isMatched = false
    var identifier: Int
    
    static var uniqueid = 0
    
    static func getUniqueIdentifier()->Int
    
    {
        uniqueid += 1
        
        return uniqueid
    }
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
