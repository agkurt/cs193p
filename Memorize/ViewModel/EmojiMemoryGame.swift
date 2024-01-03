//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ahmet Göktürk Kurt on 2.01.2024.
//
// ViewModel

import Foundation
    
class EmojiMemoryGame:ObservableObject {
    
    private static var emojis = ["👻","😈","👾","🎃","🤖","👽","☠️","🫥","💩","👀","🪰","🐏"] // static ile global hale getiriyoruz.
    
    @Published private var model = EmojiMemoryGame.createModel()
    
    static func createModel() -> MemorizeGame<String> {
        return MemorizeGame(numberOfPairsOfCards: 10)  { index in
            return EmojiMemoryGame.emojis[index]
        }
    }
    
    var cards : Array<MemorizeGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
        objectWillChange.send()
    }
    
    func choose (_ card :MemorizeGame<String>.Card) {
        model.choose(card)
    }
    
}

