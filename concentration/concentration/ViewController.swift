//
//  ViewController.swift
//  concentration
//
//  Created by iosdev on 20.3.2018.
//  Copyright © 2018 cdrbbt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLable: UILabel!
    
    var flipCount = 0 {
        didSet {
           flipCountLable.text = "Flips: \(flipCount)"
        }
    }
    
    var emojiChoice = ["👻","🎃","👻", "🎃"]

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
            flipCard(withEmoji: emojiChoice[cardNumber], on: sender)
        } else {
            print("card missing")
        }
    }
    
    func flipCard(withEmoji emoji:String, on button: UIButton){
        print("flipCard(withEmoji: \(emoji)")
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
}

