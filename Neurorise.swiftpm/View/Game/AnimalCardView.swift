//
//  AnimalCardView.swift
//  
//
//  Created by Terry Koo on 2023/04/11.
//

import SwiftUI

struct AnimalCardView: View {
    @State var offset: CGSize = .zero
    var background: String
    var animal: String
    var name: String
    var bigTitle: Bool = false
    
    var body: some View {
        ZStack {
            Image(background)
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack {
                Image(animal)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 12)
                    .padding(.top, 24)
                    .offset(x: offsetToAngle().degrees * 7, y: offsetToAngle(true).degrees * 7)
                Text(name)
                    .font(.system(size: bigTitle ? 52 : 32))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Spacer(minLength: 20)
            }
        }
        .rotation3DEffect(offsetToAngle(true), axis: (x: -1, y: 0, z: 0))
        .rotation3DEffect(offsetToAngle(), axis: (x: 0, y: 1 , z: 0))
        .rotation3DEffect(offsetToAngle(true) * 0.1 , axis: (x: 0, y: 0 , z: 1))
        .contentShape(Rectangle())
        .gesture(
            DragGesture()
                .onChanged({ value in
                    offset = value.translation
                })
                .onEnded({ _ in
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.32, blendDuration: 0.32)){
                        offset = .zero
                    }
                })
        )
    }
    
    func offsetToAngle(_ isVertical: Bool = false) -> Angle {
        let progress = (isVertical ? offset.height : offset.width) / (isVertical ? screenSize.height : screenSize.width)
        return .init(degrees: progress * 10)
    }
    
    var screenSize: CGSize = {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        return window.screen.bounds.size
    }()
    
}

struct AnimalCardView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalCardView(background: "RedCard", animal: "Elephant", name: "Elephant")
    }
}
