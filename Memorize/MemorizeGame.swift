//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Ahmet Göktürk Kurt on 2.01.2024.
//

import Foundation

struct MemorizeGame<CardContent> {
    
    var cards : Array<CardContent>
    
    func choose(card : Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched : Bool
        var content : CardContent
    }
    
    
}
