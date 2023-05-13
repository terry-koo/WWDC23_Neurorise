//
//  SwiftUIView.swift
//  
//
//  Created by Terry Koo on 2023/04/13.
//

import SwiftUI

struct MemorizeView: View {
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var gameStatus: GameStatus
    @ObservedObject var cardGenerator: CardGenerator
    
    var height = UIScreen.main.bounds.size.height
    var width = UIScreen.main.bounds.size.width
    
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                ForEach(0..<cardGenerator.cards.count + 1) { index in
                    VStack {
                        if index == cardGenerator.cards.count {
                            Text("Tab the cards in the order you remember them.")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 36))
                                .padding(.bottom, 36)
                                .offset(x: -size.width * CGFloat(cardGenerator.currentCardIndex - 1 - index))
                                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5), value: cardGenerator.currentCardIndex)
                            
                            Text("Tab to START")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 32))
                            
                                .offset(x: -size.width * CGFloat(cardGenerator.currentCardIndex - 1 - index))
                                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5), value: cardGenerator.currentCardIndex)
                        } else {
                            AnimalCardView(background: cardGenerator.cards[index].background, animal: cardGenerator.cards[index].animal, name: cardGenerator.cards[index].name, bigTitle: true)
                                .frame(width: width / 2, height: height / 2)
                                .offset(x: -size.width * CGFloat(cardGenerator.currentCardIndex - 1 - index))
                                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5), value: cardGenerator.currentCardIndex)
                            
                            Text("\(cardGenerator.currentCardIndex) / \(gameStatus.currentStage)")
                                .fontWeight(.medium)
                                .font(.system(size: 64))
                                .foregroundColor(.white)
                                .opacity(cardGenerator.currentCardIndex == gameStatus.currentStage + 1 ? 0 : 1)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .onTapGesture {
                if cardGenerator.currentCardIndex <= gameStatus.currentStage {
                    cardGenerator.currentCardIndex += 1
                } else {
                    viewRouter.goTo(.ExamView)
                }
            }
        }
    }
}
