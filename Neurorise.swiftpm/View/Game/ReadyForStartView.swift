//
//  SwiftUIView.swift
//  
//
//  Created by Terry Koo on 2023/04/13.
//

import SwiftUI

struct ReadyForStartView: View {
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var gameStatus: GameStatus
    
    
    var body: some View {
        ZStack {
            Color.black
            VStack {
                Text("Animal cards to remember")
                    .font(.system(size: 36))
                
                Text("\(gameStatus.currentStage)")
                    .font(.system(size: 64))
                    .padding(.top, 12)
                    .padding(.bottom, 256)
                
                Text("Tab to start")
                    .font(.system(size: 64))   
            }
            .foregroundColor(.white)
            .offset(y: 50)
        }
        .ignoresSafeArea()
    }
}

struct ReadyForStartView_Previews: PreviewProvider {
    static var previews: some View {
        ReadyForStartView(viewRouter: ViewRouter(), gameStatus: GameStatus())
    }
}
