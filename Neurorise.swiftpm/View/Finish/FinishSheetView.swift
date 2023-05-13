//
//  File.swift
//  
//
//  Created by Terry Koo on 2023/04/14.
//

import SwiftUI

struct FinishSheetView: View {
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var gameStatus: GameStatus
    
    var clear: Bool = false
    var action: () -> ()
    var successBackgroundColor: some View = {
        let color = Color(uiColor: UIColor(red: 0.93, green: 1.00, blue: 0.84, alpha: 1.00))
        return color.ignoresSafeArea()
    }()
    var failBackgroundColor: some View = {
        let color = Color.init(uiColor: UIColor(red: 1.00, green: 0.93, blue: 0.84, alpha: 1.00))
        return color.ignoresSafeArea()
    }()

    
    var body: some View {
        ZStack {
            if clear {
                successBackgroundColor
            } else {
                failBackgroundColor
            }
            
            VStack {
                if clear {
                    LargeText("STAGE CLEAR")
                    ClearImage("Happy")
                } else {
                    LargeText("TRY AGAIN")
                    ClearImage("Sad")
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        if clear {
                            gameStatus.stageClear()
                        }
                        viewRouter.goTo(.HomeView)
                    } label: {
                        ButtonText("Home")
                    }
                    
                    Spacer()
                    
                    Button {
                        action()
                    } label: {
                        if clear {
                            ButtonText("Next")
                        } else {
                            ButtonText("Retry")
                        }
                    }
                    
                    Spacer()
                }
                .padding(.bottom, 60)
            }
        }
        .interactiveDismissDisabled()
    }
    
    
    @ViewBuilder
    func ButtonText(_ title: String) -> some View {
        Text(title)
            .font(.system(size: 64))
            .fontWeight(.semibold)
            .padding(.horizontal, 40)
            .padding(.vertical, 14)
            .foregroundColor(.black)
    }
    
    @ViewBuilder
    func LargeText(_ title: String) -> some View {
        Text(title)
            .foregroundColor(.black)
            .font(.system(size: 96))
            .fontWeight(.bold)
            .padding(.top, 60)
    }
    
    @ViewBuilder
    func ClearImage(_ imageName: String) -> some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .padding(.bottom, 60)
    }
}

struct FinishSheetView_Previews: PreviewProvider {
    static var previews: some View {
        FinishSheetView(viewRouter: ViewRouter(), gameStatus: GameStatus(), action: {})
    }
}
