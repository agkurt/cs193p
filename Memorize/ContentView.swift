//
//  ContentView.swift
//  Memorize
//
//  Created by Ahmet Göktürk Kurt on 1.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
            CardView()
        }
        .foregroundStyle(.orange)
        .padding()
    }
}


struct CardView:View {
    var isFaceUp : Bool = false
    var body: some View {
        
        ZStack(content: { // tupleView. Bir fonksiyon gibi çalışır. Bu listeyi tupleView'a döndüren şey @ViewBuilder
            if isFaceUp  {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
           

        })
        .foregroundColor(Color.orange) // bu verileri dışarı koysak bile vstack içerisinde sadece onunla ilişkisi olan değerlere değişiklik sağlıyacağı için burada bize büyük bir esneklik sağlar.
        .padding()
    }
}



#Preview {
    ContentView()
}


