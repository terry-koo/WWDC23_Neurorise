//
//  SwiftUIView.swift
//  
//
//  Created by Terry Koo on 2023/04/15.
//

import SwiftUI

struct IntroView: View {
    @ObservedObject var viewRouter: ViewRouter
    @State var currentIndex = 0
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            ZStack {
                Color.black
                    .ignoresSafeArea()
                ForEach(0..<2) { index in
                    if index == 0 {
                        Color.black
                        VStack {
                            Text("You need to remember the order of the animal cards!")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 36))
                                .padding(.bottom, 120)
                                .offset(x: -size.width * CGFloat(currentIndex - index))
                                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
                            
                            Image("TutorialCardOrder")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .offset(x: -size.width * CGFloat(currentIndex - index))
                                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(0.1), value: currentIndex)
                        }
                        .padding(.horizontal, 28)
                    } else if index == 1 {
                        VStack {
                            Text("To match the animal cards, both the color and\nthe shape of the animal on the card must be the same")
                                .fontWeight(.bold)
                                .font(.system(size: 36))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .offset(x: -size.width * CGFloat(currentIndex - index))
                                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
                            
                            Image("TutorialDifferentCard")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.top, 120)
                                .padding(.bottom, 80)
                                .offset(x: -size.width * CGFloat(currentIndex - index))
                                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(0.1), value: currentIndex)
                            
                            Image("TutorialSameCard")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .offset(x: -size.width * CGFloat(currentIndex - index))
                                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(0.1), value: currentIndex)
                        }
                        .padding(.horizontal, 28)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .onTapGesture {
                if currentIndex < 1 {
                    currentIndex += 1
                } else {
                    viewRouter.goTo(.HomeView)
                }
            }
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView(viewRouter: ViewRouter())
    }
}
