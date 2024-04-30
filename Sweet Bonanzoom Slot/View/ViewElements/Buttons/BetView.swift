//
//  betView.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 29.04.2024.
//

import SwiftUI

struct BetView: View {
    var isActive: Bool = false
    var text: String = "100"
    var activeMinus: ()->Void
    var activePlus: ()->Void
    
    
    var body: some View {
        ZStack{ //MARK: score frame
            Image("ScoreFrame")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 55)
                .shadow(color: .black, radius: 2, x: 0, y: 2)
            
            Text("YOUR BET\n\(text)")
                .font(.custom("Maven Pro", size: 16))
                .bold()
                .lineSpacing(-100)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 2, x: 0, y: 2)
                .multilineTextAlignment(.center)
                .padding(.bottom, 5)
                .frame(width: 80)
                .lineLimit(2)
            HStack{
                Button {
                    activeMinus()
                } label: {
                    Image(isActive ? "btn-" : "Not-")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30)
                        .padding(.leading, 0  )
                }
                .disabled(!isActive)
                
                Spacer()
                
                Button {
                    activePlus()
                } label: {
                    Image(isActive ? "btn+" : "Not+")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30)
                        .padding(.leading, 0)
                }
                .disabled(!isActive)
            }
            .frame(width: 180)
            

            
        }
        .frame(minWidth: (ContentView().frameWidth-20)/2)

    }
}

struct BetView_Previews: PreviewProvider {
    static var previews: some View {
        BetView(activeMinus: {}, activePlus: {})
    }
}
