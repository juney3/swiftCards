//
//  deck.swift
//  cardGame
//
//  Created by June Yoshii and Grace Shieh on 1/11/17.
//  Copyright © 2017 june&grace. All rights reserved.
//

import UIKit

struct Card {
    var suit: String
    var value: String
    var numerical_value: Int
    
    func show() {
        print(value, "of ", suit, ": ", numerical_value)
    }
}

class Deck {
    var cards: [Card] = []
    
    init() {
        self.reset()
    }
    
    func reset() {
        self.cards = []
        let suits = ["c", "d", "h", "s"]
        let values = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "j", "q", "k"]
        
        for suit in suits {
            for j in 0...12 {
                let newCard = Card(suit: suit, value: values[j], numerical_value: j+1)
                self.cards.append(newCard)
            }
        }
        
        shuffle()
    }
    
    func shuffle() {
        for _ in 0...51{
            let random1 = Int(arc4random_uniform(52))
            let random2 = Int(arc4random_uniform(52))
            
            let temp2 = cards[random1]
            
            cards[random1] = cards[random2]
            
            cards[random2] = temp2
        }
    }
    
    func deal() -> Card? {
        if self.cards.count > 0 {
            let topCard = cards.remove(at: cards.count - 1)
            return topCard
        }
        return nil
    }
    
    func show() {
        for card in self.cards {
            card.show()
        }
    }
}

class Player {
    var name: String
    var hand: [Card] = []
    
    init(name: String) {
        self.name = name
        self.hand = []
    }
    
    func draw(deck: Deck) -> Card? {
        if let topCard = deck.deal() {
            self.hand.append(topCard)
            return topCard
        }
        return nil
    }
    
    func discard(suit: String, value: String) -> Bool {
        if self.hand.count > 0 {
            for i in 0...self.hand.count - 1 {
                if self.hand[i].suit == suit && self.hand[i].value == value {
                    self.hand.remove(at: i)
                    return true
                }
            }
        }
        return false
    }
    
    func show() {
        for card in self.hand {
            card.show()
        }
    }
}
