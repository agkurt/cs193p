//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Ahmet Göktürk Kurt on 1.01.2024.
//View

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
}
