//
//  File.swift
//  
//
//  Created by Terry Koo on 2023/04/13.
//

import SwiftUI

class Card: Identifiable, Equatable {
    let id = UUID()
    let background: String
    let animal: String
    var order: Int
    var name: String
    
    init(background: String, animal: String, order: Int, name: String) {
        self.background = background
        self.animal = animal
        self.order = order
        self.name = name
    }
    
    enum CardColor: CaseIterable {
        case red
        case green
        case blue
        
        var backgroundImage: String {
            switch self {
            case .red: return "RedCard"
            case .blue: return "BlueCard"
            case .green: return "GreenCard"
            }
        }
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.animal == rhs.animal && lhs.background == rhs.background
    }
}

