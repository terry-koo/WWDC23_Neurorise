//
//  SwiftUIView.swift
//  
//
//  Created by Terry Koo on 2023/04/13.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewRouter: ViewRouter = ViewRouter()
    @StateObject var gameStatus: GameStatus = GameStatus()
    @StateObject var cardGenerator: CardGenerator = CardGenerator()
    
    
    var body: some View {
        switch viewRouter.currentView {
        case .IntroView:
            IntroView(viewRouter: viewRouter)
        case .HomeView:
            HomeView(cardGenerator: cardGenerator, viewRouter: viewRouter, gameStatus: gameStatus)
        case .MemorizeView:
            MemorizeView(viewRouter: viewRouter, gameStatus: gameStatus, cardGenerator: cardGenerator)
                .transition(AnyTransition.scale.animation(.easeIn))
        case .ExamView:
            ExamView(viewRouter: viewRouter, gameStatus: gameStatus, cardGenerator: cardGenerator)
                .transition(AnyTransition.scale.animation(.easeIn))
        default:
            EmptyView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
