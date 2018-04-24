//
//  ViewController.swift
//  concentration
//
//  Created by iosdev on 20.3.2018.
//  Copyright © 2018 cdrbbt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCard: (cardButtons.count + 1) / 2)
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLable: UILabel!
    
    var flipCount = 0 {
        didSet {
           flipCountLable.text = "Flips: \(flipCount)"
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            print("card numer = \(cardNumber)")
            game.choseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("card missing")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceup {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
    
    
    var emojiChoice = ["👻","🎃"]
    
    var emoji = [Int:String]()
    
    func emoji (for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoice.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoice.count)))
            emoji[card.identifier] = emojiChoice.remove(at: randomIndex)
        }
         return emoji[card.identifier] ?? "?"
    }
}

