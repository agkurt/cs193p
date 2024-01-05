//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Ahmet Göktürk Kurt on 1.01.2024.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel : EmojiMemoryGame
    
    let emojis : [String] = ["👻","😈","👾","🎃","🎃","🎃","🎃","🎃","🎃","🎃","🎃","🎃","🎃","🎃","🎃","🎃","🎃","🎃","🎃","🎃","🎃"] // alternative = Array<String>
    var body: some View {
        VStack {
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
    }
    
    var cards : some View {
        
        // MARK: - ForEach Identity
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85),spacing: 0)]) {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fill)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .padding()
    }
    
}

struct CardView:View {
    let card : MemorizeGame<String>.Card
    
    init(card: MemorizeGame<String>.Card) {
        self.card = card
    }
    var body: some View {
        ZStack(content: { // tupleView. Bir fonksiyon gibi çalışır. Bu listeyi tupleView'a döndüren şey @ViewBuilder
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        })
        .opacity(card.isFaceUp || !card.isMatched ? 1:0)
        .foregroundStyle(.orange)
        
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}


