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
        flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
        
        flipCount += 1
    }
   
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji{
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        }else
        {
           button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

