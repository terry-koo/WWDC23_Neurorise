//
//  SwiftUIView.swift
//  
//
//  Created by Terry Koo on 2023/04/13.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var cardGenerator: CardGenerator
    @ObservedObject var viewRouter: ViewRouter
    @StateObject var gameStatus: GameStatus = GameStatus()
    
    
    var body: some View {
        ZStack {
            Color.black
            
            Image("StartBackGround")
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        viewRouter.goTo(.IntroView)
                    } label: {
                        Image("QuestionMark")
                            .padding(.top, 32)
                            .padding(.trailing, 32)
                    }
                }
                
                Spacer()
            }
            
            VStack {
                HStack {
                    Button {
                        if gameStatus.currentStage != 3 {
                            gameStatus.previousStage()
                        }
                    } label: {
                        Image(gameStatus.currentStage == 3 ? "DisableDecrease" : "Decrease")
                    }
                    
                    Text("\(gameStatus.currentStage)")
                        .foregroundColor(.white)
                        .font(.system(size: 128))
                        .padding(.horizontal, 60)

                    Button {
                        gameStatus.nextStage()
                    } label: {
                        Image(gameStatus.currentStage < gameStatus.maxStage ? "Increase" : "DisableIncrease")
                    }
                }
                
                Text("START")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .font(.system(size: 64))
                    .onTapGesture {
                        cardGenerator.generateCards(gameStatus.currentStage)
                        viewRouter.goTo(.MemorizeView)
                    }
            }
        }
        .ignoresSafeArea()
        .onAppear {
            UserDefaults.standard.set(true, forKey: "hasSeenOnboarding")
        }
        
    }
}
