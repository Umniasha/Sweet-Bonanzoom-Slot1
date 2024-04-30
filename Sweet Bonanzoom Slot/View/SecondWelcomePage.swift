//
//  SecondWelcomePage.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 24.04.2024.
//

import SwiftUI

struct SecondWelcomePage: View {
    
    @Binding var showMenuPage: Bool
    
    
    var body: some View {
            VStack(alignment: .center){
                
                Image("PleaseNoteIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ContentView().frameWidth/1.4)
                    .padding([.leading,.trailing])
                
                Text("This game is a purely virtual game designed for \n entertainment purposes only. This game does \n not involve or support real money gambling, \n betting, or any monetary transactions. All in-\n game currency, referred to as \"Zooms\" and any form of winnings or bonuses, are entirely fictional and have no real-world value.\n Our game is created to provide a fun and engaging experience for our players within a safe and responsible gaming environment. It is not intended for use as a gambling platform, nor does it offer opportunities for real money gambling or the chance to win real money or real prizes. \n Players are reminded to enjoy game responsibly and within the limits of entertainment. We encourage all players to be aware of their gaming habits and to play sensibly, keeping in mind that the game is meant as a form of virtual entertainment. ")
                    .font(.custom("Maven Pro", size: 15))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2, x: 0, y: 2)
                    .multilineTextAlignment(.center)
                    .lineSpacing(3)
                    .padding([.leading, .trailing])
                    .padding(.top, -30)
                    .minimumScaleFactor(0.5)
                
                Button(action: {
                    withAnimation(.spring()){
                        showMenuPage.toggle()
                    }
                        }) {
                            Image("StartBTN")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 160 )
                                .padding()
                        }
                
                Spacer()
                
            }
            .background(Image("SecondWelcomSceneBG")
                            .resizable()
                            .frame(width: ContentView().frameWidth, height: ContentView().frameHeight)
                            .edgesIgnoringSafeArea(.all))
    }
}

//struct SecondWelcomePage_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondWelcomePage()
//    }
//}
