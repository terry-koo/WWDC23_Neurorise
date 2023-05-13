//
//  File.swift
//  
//
//  Created by Terry Koo on 2023/04/13.
//

import SwiftUI

class GameStatus: ObservableObject {
    @Published var currentStage: Int = 3
    
    var maxStage = UserDefaults.standard.integer(forKey: "stage") == 0 ? 3 : UserDefaults.standard.integer(forKey: "stage")
    
    
    func nextStage() {
        if currentStage < maxStage {
            currentStage += 1
        }
    }
    
    func previousStage() {
        if currentStage > 3 {
            currentStage -= 1
        }
    }
    
    func stageClear() {
        if maxStage < 9 && maxStage == currentStage {
            maxStage += 1
            UserDefaults.standard.set(maxStage, forKey: "stage")
        }
    }
}
