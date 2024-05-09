//
//  ChooseElement.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 01.05.2024.
//

import SwiftUI

struct ChooseElement: View {
    let width = ContentView().frameWidth/5
    var elementName: String = "Apple"
    var select: Bool = false
    var common: String = "Common"
    var multiplier: String = "x2"
    var action: ()->Void
    var textSize : CGFloat {
        if ContentView().frameWidth >= 400 {
            return 15
        } else{
            return 13
        }
       
    }
    var body: some View {
        VStack(spacing: 0){
            Text(elementName)
                .font(.custom("Maven Pro", size: textSize+3))
                .bold()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .shadow(color: .black, radius: 2, x: 0, y: 2)
            
          
                
                Button {
                    action()
                } label: {
                    ZStack{
                        Image("ElementFrame")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: width)
                            .shadow(color: .black, radius: 2, x: 0, y: 2)
                        
                        Image(elementName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: width*0.75)
                          
                        
                        Image(select ? "Select" : "NoSelect")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: width/4)
                            .padding([.leading, .top], width*0.75)
                }
                
            }
            Text(common)
                .font(.custom("Maven Pro", size: textSize))
                .bold()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .shadow(color: .black, radius: 2, x: 0, y: 2)
                .padding(.top, -5)
                
            
            Text("Base Multiplier:")
                .font(.custom("Maven Pro", size: textSize))
                .bold()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .shadow(color: .black, radius: 2, x: 0, y: 2)
                //.minimumScaleFactor(0.5)
            Text(multiplier)
                .font(.custom("Maven Pro", size: textSize+5))
                .bold()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .shadow(color: .black, radius: 2, x: 0, y: 2)
        }
        .padding(.bottom, 10)
    }
}

struct ChooseElement_Previews: PreviewProvider {
    static var previews: some View {
        SelectElementPage( gameScene: GameScene(), isSelectAction: {}, closeButtonAction: {})
            .environmentObject(UserData())
    }
}
