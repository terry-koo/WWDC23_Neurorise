//
//  File.swift
//  
//
//  Created by Terry Koo on 2023/04/13.
//

import Foundation

class CardGenerator: ObservableObject {
    @Published var currentCardIndex = 1
    @Published var cards: [Card] = []
    @Published var shuffledCards: [Card] = []
    
    
    func generateCards(_ count: Int) {
        cards.removeAll()
        shuffledCards.removeAll()
        currentCardIndex = 1
        var order = 1
        
        while order < count + 1 {
            let animal = Animal.allCases.randomElement()!
            let background = Card.CardColor.allCases.randomElement()!
            let card = Card(background: background.backgroundImage, animal: animal.name, order: order, name: animal.name)
            
            if cards.contains(card) {
                continue
            }
            
            cards.append(card)
            order += 1
        }
        
        shuffledCards = cards.shuffled()
    }
}
