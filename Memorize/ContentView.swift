//
//  ContentView.swift
//  Memorize
//
//  Created by Ahmet Göktürk Kurt on 1.01.2024.
//

import SwiftUI

struct ContentView: View {
    let emojis : [String] = ["👻","😈","👾","🎃"] // alternative = Array<String>
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])

            }
        }
        
        .foregroundStyle(.orange)
        .padding()
    }
}


struct CardView:View {
    @State var isFaceUp : Bool = false // state geçici olarak durumu çözer
    let content : String
    var body: some View {
        ZStack(content: { // tupleView. Bir fonksiyon gibi çalışır. Bu listeyi tupleView'a döndüren şey @ViewBuilder
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp  {
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
            
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


