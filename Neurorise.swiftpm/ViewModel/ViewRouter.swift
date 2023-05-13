//
//  File.swift
//  
//
//  Created by Terry Koo on 2023/04/13.
//

import Foundation

class ViewRouter: ObservableObject {
    @Published var currentView: MyView = UserDefaults.standard.bool(forKey: "hasSeenOnboarding") ? MyView.HomeView : MyView.IntroView
    
    
    func goTo(_ view: MyView) {
        currentView = view
    }
    
    enum MyView {
        case HomeView
        case MemorizeView
        case IntroView
        case ExamView
    }
}
