//
//  GameWin.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 07.05.2024.
//

import SwiftUI

struct GameWin: View {
  var textSize : CGFloat {
    if ContentView().frameWidth >= 400 {
        return 25
    } else{
        return 20
    }
}
    
    var winCoins = 100000
    var winBonus = false
    var freeSpeens = false
    var menuButtonAction : ()->Void
    var againOrBonusAction: ()->Void
    
    var body: some View {
        VStack{
           
            Image("won")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: ContentView().frameWidth-20)
                .padding([.leading,.trailing, .top])
            
            Spacer()
            HStack(spacing: 0){
                    VStack(spacing: ContentView().frameWidth*0.06){
                        if winBonus  {
                            Text("\(1)")
                                .font(.custom("Maven Pro", size: textSize-3))
                                .bold()
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 2, x: 0, y: 2)
                                .padding(.bottom, 3)
                        }
                        
                        if winCoins > 0 {
                            Text("\(winCoins)")
                                .font(.custom("Maven Pro", size: textSize-3))
                                .bold()
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 2, x: 0, y: 2)
                                .padding(.bottom, 3)
                        }
                        
                        
                    }
                
                    VStack(spacing: 0){
                        if winBonus {
                            Image("bonusGame")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: ContentView().frameWidth*0.13)
                        }
                        if winCoins > 0 {
                            Image("ScoreItem")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: ContentView().frameWidth*0.15)
                        }
                        
                   
                    
                }
            }
            
            Button {
                againOrBonusAction()
            } label: {
                ZStack{
                    
                    Image( "Speen")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: ContentView().frameWidth*0.6)
                        .shadow(color: .black, radius: 2, x: 0, y: 2)
                    Text(winBonus ? "BONUS GAME" : "PLAY AGAIN")
                        .font(.custom("Maven Pro", size: textSize))
                        .bold()
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2, x: 0, y: 2)
                        .padding(.bottom, 3)
                   
                }
            }
            
            Button {
                menuButtonAction()
            } label: {
                ZStack{
                    
                    Image( "menuEmpty")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: ContentView().frameWidth*0.5)
                        .shadow(color: .black, radius: 2, x: 0, y: 2)
                    Text("MENU")
                        .font(.custom("Maven Pro", size: textSize))
                        .bold()
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2, x: 0, y: 2)
                        .padding(.bottom, 3)
                   
                }
            }
            
            Spacer()
            
        }
        .background(alignment: .bottom) {
            Image("GameWinBG")
                                   .resizable()
                                   .edgesIgnoringSafeArea(.all)
                                   .aspectRatio(contentMode: .fill)
                                   .frame(height: ContentView().frameHeight)
        }
    }
}

struct GameWin_Previews: PreviewProvider {
    static var previews: some View {
        GameWin(menuButtonAction: {}, againOrBonusAction: {})
    }
}
