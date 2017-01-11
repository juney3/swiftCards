//
//  ViewController.swift
//  cardGame
//
//  Created by June Yoshii on 1/11/17.
//  Copyright © 2017 june&grace. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentDeck: Deck = Deck()
    var playerOne: Player = Player(name: "Sam")
    var cardCount: Int = 1

    @IBOutlet weak var card1: UIImageView!
    @IBOutlet weak var card2: UIImageView!
    @IBOutlet weak var card3: UIImageView!
    @IBOutlet weak var card4: UIImageView!
    @IBOutlet weak var card5: UIImageView!
    @IBOutlet weak var card6: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func drawButtonPressed(_ sender: UIButton) {
        if cardCount < 7 {
            if let drawnCard = playerOne.draw(deck: currentDeck) {
                showCard(card: drawnCard)
            }
        }
        else {
            print("Hand full")
        }
    }
    
    // retrieve player hand array and base cards off of that
    
    func showCard(card: Card) {
        let result = card.suit + card.value + ".png"
        
//        let cardImageName: String = "card" + String(cardCount)
        
        if cardCount == 1 {
            card1.image = UIImage(named: "\(result)")
        }
        
        if cardCount == 2 {
            card2.image = UIImage(named: "\(result)")
        }
        
        if cardCount == 3 {
            card3.image = UIImage(named: "\(result)")
        }
        
        if cardCount == 4 {
            card4.image = UIImage(named: "\(result)")
        }
        
        if cardCount == 5 {
            card5.image = UIImage(named: "\(result)")
        }
        
        if cardCount == 6 {
            card6.image = UIImage(named: "\(result)")
        }
        
        cardCount += 1
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        currentDeck.reset()
        cardCount = 0
        card1.image = UIImage(named: "")
        card2.image = UIImage(named: "")
        card3.image = UIImage(named: "")
        card4.image = UIImage(named: "")
        card5.image = UIImage(named: "")
        card6.image = UIImage(named: "")

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

