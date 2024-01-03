//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Ahmet Göktürk Kurt on 2.01.2024.
// Model

import Foundation

struct MemorizeGame<CardContent> {
    
    private(set) var cards : Array<Card>
    
    init(numberOfPairsOfCards : Int, cardContentFactory: (Int) -> CardContent ) {
        cards = []
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ cards : Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()        
    }
    
    struct Card {
        var isFaceUp = true
        var isMatched = false
        var content : CardContent
    }
    
}
