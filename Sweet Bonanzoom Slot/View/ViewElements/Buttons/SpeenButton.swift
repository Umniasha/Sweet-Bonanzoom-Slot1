//
//  SpeenButton.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 29.04.2024.
//

import SwiftUI

struct SpeenButton: View {
    var isActive: Bool = false
    var text: String = "SPEEN"
    var imageName: String = "speenNotActive"
    var body: some View {
        Button {
            //
        } label: {
            ZStack{
                
                Image(isActive ? imageName : "speenNotActive")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: (ContentView().frameWidth-20)/2)
                    .shadow(color: .black, radius: 2, x: 0, y: 2)
                Text(text)
                    .font(.custom("Maven Pro", size: 18))
                    .bold()
                    .lineSpacing(-100)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2, x: 0, y: 2)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 5)
                    .frame(width: 80)
            }
        }
        .disabled(!isActive)

        
    }
}

struct SpeenButton_Previews: PreviewProvider {
    static var previews: some View {
        SpeenButton()
    }
}
