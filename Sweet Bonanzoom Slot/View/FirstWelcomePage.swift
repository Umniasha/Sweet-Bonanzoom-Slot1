//
//  FirstWelcomePage.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 24.04.2024.
//

import SwiftUI

struct FirstWelcomePage: View {
    
    @Binding var isFirstWelcomeViewShowing: Bool
    
    var body: some View {
        
        ZStack{
            
            
                
            VStack(alignment: .center){
                
                Image("WelcomIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ContentView().frameWidth-20)
                    .padding([.leading,.trailing])
                    .padding(.top, 40)
                
                Text("Embark on a magical journey through our \n colorful candy world, where strategic choices \n and random rewards await you.\n Collect fruits and berries, select tiles, and place \n bets to unlock special bonuses and multipliers.\n Enjoy the thrill of each spin and the excitement \n of potential wins in this captivating and fun- \n filled slot game.\n  Get ready to indulge in a deliciously \n entertaining experience that’s all about fun \n and strategy!")
                    .font(.custom("Maven Pro", size: 15))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2, x: 0, y: 2)
                    .multilineTextAlignment(.center)
                    .lineSpacing(3)
                    .padding([.leading, .trailing])
                    .minimumScaleFactor(0.5)
                
                Button(action: {
                    
                    withAnimation(.spring()){
                        isFirstWelcomeViewShowing.toggle()
                    }
                        }) {
                            Image("PlayBtn")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 75 )
                                .padding()
                        }
                        
                Spacer()
            }
            .background(alignment: .bottom) {
                Image("FirstWelcomSceneBG")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: ContentView().frameWidth, height: ContentView().frameHeight)
                    .aspectRatio(contentMode: .fill)
                    
            }
        }
    }
}

//struct FirstWelcomePage_Previews: PreviewProvider {
//    static var previews: some View {
//        FirstWelcomePage(isFirstViewShowing: $true)
//    }
//}
