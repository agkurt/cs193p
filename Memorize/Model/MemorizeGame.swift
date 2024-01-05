//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Ahmet Göktürk Kurt on 2.01.2024.
// Model

import Foundation

struct MemorizeGame<CardContent> where CardContent : Equatable {
    
    private(set) var cards : Array<Card>
    
    init(numberOfPairsOfCards : Int, cardContentFactory: (Int) -> CardContent ) {
        cards = []
        // sakdjasşkd
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: "\(pairIndex+1)a", content: content))
            cards.append(Card(id: "\(pairIndex+1)b", content: content))
            
        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCard : Int? {
        get { cards.indices.filter {index in cards[index].isFaceUp}.only}
        set { cards.indices.forEach {cards[$0].isFaceUp = (newValue == $0)}}
    }
    
    mutating func choose(_ card : Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                }else {
                    for index in cards.indices {
                        cards[index].isFaceUp = false
                    }
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    
    struct Card:Equatable,Identifiable,CustomDebugStringConvertible {
        
        var id : String
        var isFaceUp = false
        var isMatched = false
        var content : CardContent
        
        
        var debugDescription: String {
            "\(id):\(content), \(isFaceUp ? "up":"down"), \(isMatched ? "Matchable" : "")"
        }
    
    }
    
}

extension Array {
    var only : Element? {
        count == 1 ? first : nil
    }
}
