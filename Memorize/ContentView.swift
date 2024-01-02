//
//  ContentView.swift
//  Memorize
//
//  Created by Ahmet Göktürk Kurt on 1.01.2024.
//

import SwiftUI

struct ContentView: View {
    let emojis : [String] = ["👻","😈","👾","🎃","🎃","🎃","🎃","🎃","🎃","🎃","🎃","🎃","🎃","🎃","🎃","🎃","🎃","🎃","🎃","🎃","🎃"] // alternative = Array<String>
    @State var cardCount : Int = 1
    var body: some View {
        VStack  {
            ScrollView {
                cards
            }
        }
        Spacer()
        cardProcess
            .padding()
            .font(.largeTitle)
    }
    

    var cardProcess : some View { // viewbuilder
        return HStack { // not viewbuilder
            addButtonView
            Spacer(minLength: 20)
            deleteButtonView
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var addButtonView : some View {
        return cardProcesss(by: 1, label: "plus")
    }
    
    
    var deleteButtonView : some View {
        return cardProcesss(by: -1, label: "minus.circle")
    }
    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(CGSize(width: 9, height: 9), contentMode: .fill)
            }
        }
    }
    
    func cardProcesss(by offset : Int , label: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: label)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
        
}

struct CardView:View {
    @State var isFaceUp : Bool = true // state geçici olarak durumu çözer
    let content : String
    var body: some View {
        ZStack(content: { // tupleView. Bir fonksiyon gibi çalışır. Bu listeyi tupleView'a döndüren şey @ViewBuilder
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        })
        .foregroundColor(Color.orange) // bu verileri dışarı koysak bile vstack içerisinde sadece onunla ilişkisi olan değerlere değişiklik sağlıyacağı için burada bize büyük bir esneklik sağlar.
        .padding()
        .onTapGesture {
            isFaceUp.toggle() // true-false bool ifadelerde kullanılabilir
        }
    }
}

#Preview {
    ContentView()
}


