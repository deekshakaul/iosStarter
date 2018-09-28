//
//  ViewController.swift
//  Concentration
//
//  Created by Deeksha Kaul on 25/09/18.
//  Copyright © 2018 Deeksha Kaul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var game = Concentration(noOfPairsOfCards: (cardButtons.count+1) / 2)// will be initialized only when used
    // lazy var cannot have didSet()
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!

    private(set) var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
                game.chooseCard(at: cardNumber)
                updateViewFromModel()
        }
    }
    
    private func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for : card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.6166251898, blue: 0.2177057266, alpha: 0) : #colorLiteral(red: 1, green: 0.6166251898, blue: 0.2177057266, alpha: 1)
            }
        }
    }
    
    private var emojiChoices = ["🎃","👻","😱","😈","👹","👽","☠️","🤖"]
    
    private var emoji = [Card:String]()
    
    private func emoji(for card : Card) -> String{
        
        if emoji[card] == nil, emojiChoices.count > 0 {
                print("in if...")
                emoji[card] = emojiChoices.remove(at: emojiChoices.count.arc4random)
            }
        
        return emoji[card] ?? "?"
        
//        same as the following snippet
//        if emoji[card.identifier] != nil
//        {return emoji[card.identifier]!}
//        else{
//            return "?"
//        }
    }
    
    
}

extension Int {
    var arc4random: Int {
        if self > 0{
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self<0{
            return Int(arc4random_uniform(UInt32(abs(self))))
        }
        else {return 0}
    }
}
