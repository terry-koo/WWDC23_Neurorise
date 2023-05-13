//
//  SwiftUIView.swift
//  
//
//  Created by Terry Koo on 2023/04/13.
//

import SwiftUI

struct ExamView: View {
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var gameStatus: GameStatus
    @ObservedObject var cardGenerator: CardGenerator
    @State var index = 1
    @State var select = Array(repeating: false, count: 9)
    @State var viewOpacity = Array(repeating: 0.0, count: 9)
    @State var sheet: Bool = false
    @State var answer = 0
    
    let generator = UINotificationFeedbackGenerator()
    var height = UIScreen.main.bounds.size.height
    var width = UIScreen.main.bounds.size.width

    
    var body: some View {
        let columns = [
            GridItem(.flexible(minimum: width / 5)),
            GridItem(.flexible(minimum: width / 5)),
            GridItem(.flexible(minimum: width / 5)),
        ]
        
        ZStack {
            Color.black
            VStack {
                HStack {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(cardGenerator.shuffledCards) { card in
                            ZStack {
                                AnimalCardView(background: card.background, animal: card.animal, name: card.name)
                                    .onTapGesture {
                                        if card.order == index {
                                            viewOpacity[card.order - 1] = viewOpacity[card.order - 1] == 0.0 ? 1.0 : 0.0
                                            index += 1
                                            answer += 1
                                            Player.playMusic("Correct")
                                            select[card.order - 1].toggle()
                                            if answer == gameStatus.currentStage {
                                                Player.playMusic("Clear")
                                                sheet.toggle()
                                            }
                                        } else {
                                            Player.playMusic("Wrong")
                                            self.generator.notificationOccurred(.success)
                                            sheet.toggle()
                                        }
                                    }
                                if select[card.order - 1] {
                                    selectedView(card)
                                        .opacity(viewOpacity[card.order - 1])
                                }
                            }
                        }
                    }
                    .frame(width: width * 3.2 / 5)
                }
            }
        }
        .sheet(isPresented: $sheet, content: {
            FinishSheetView(viewRouter: viewRouter,gameStatus: gameStatus, clear: answer == gameStatus.currentStage) {
                if answer == gameStatus.currentStage {
                    gameStatus.stageClear()
                    gameStatus.nextStage()
                    cardGenerator.generateCards(gameStatus.currentStage)
                } else {
                    cardGenerator.generateCards(gameStatus.currentStage)
                }
                viewRouter.goTo(.MemorizeView)
            }
        })
        .ignoresSafeArea()
    }
    
    
    @ViewBuilder
    func selectedView(_ card: Card) -> some View {
        switch card.order {
        case 1...9:
            ZStack {
                Color.black.opacity(0.5)
                Image(systemName: "\(card.order).circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)
                    .foregroundColor(.yellow)
            }
        default: fatalError("Invalid order: \(card.order)")
        }
    }
    
}

struct ExamView_Previews: PreviewProvider {
    static var previews: some View {
        ExamView(viewRouter: ViewRouter(), gameStatus: GameStatus(), cardGenerator: CardGenerator())
    }
}
