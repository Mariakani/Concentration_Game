//
//  ViewController.swift
//  Concentration Game
//
//  Created by Mariak Achuoth on 2019-03-10.
//  Copyright © 2019 The Future I Dream. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
   lazy var  game = Concentration(numberOfPairedOfCards: (cardButtons.count + 1)/2)
    
    var flipCount: Int = 0{
        didSet{
             flipCountLabl.text = "Flips: \(flipCount)"
        }
    }
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabl: UILabel!
    var emojiChoices = ["🍎", "👻", "🍎", "👻","🎃", "🦒", "🦒", "🎃"]
    
    @IBAction func flipCardOnTouch(_ sender: UIButton)
    {
        //flipCard(withEmoji: "👻", on: sender)
        if let cardNumber = cardButtons.index(of: sender){
        game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        
        flipCount += 1
    }
   
    func updateViewFromModel()
    {
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFacedUp{
                button.setTitle(emoji(for:card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ?#colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0):#colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
    var emoji = [Int: String]()
    func emoji(for card: Card)->String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
    
        }
        return emoji[card.identifier] ?? "?"
    }
  
}

