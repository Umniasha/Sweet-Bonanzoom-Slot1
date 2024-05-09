//
//  X2Button.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 29.04.2024.
//

import SwiftUI

struct X2Button: View {
    
    
    var isActive: Bool = true
    var activBtn: Bool {
        if (isActive || bonus) || bonus {
            return false
        }else {
            return true
        }
    }
    var text: String = "x2"
    var action: ()->Void
    var value: Int = 0
    var bonus = true
    var enableBonus = false
    
    var body: some View {
        
        ZStack{
            Button {
                action()
            } label: {
               
                TopBarIcon(imageName: activBtn  ? "xBTN" : "xBTNActive")
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 4)
                                .opacity(bonus ? 1 : 0)
                                )
                
                    
                
               
            }
            .disabled(!isActive || value < 1)
            
            
            Text(text)
                .font(.custom("Maven Pro", size: 18))
                .bold()
                .foregroundColor(.white)
                .shadow(color: .black, radius: 2, x: 0, y: 2)
                .padding(.leading, 1)
                
            ZStack{
                Image("xBTNValueframe")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15)
                   
                
                Text(String(value))
                    .font(.custom("Maven Pro", size: 10))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2, x: 0, y: 2)
                    .padding([.bottom,.trailing], 1)
                    .frame(width: 12)
                    .lineLimit(1)
                    
            }
            .padding(.bottom , 40)
            .padding(.leading, 40)
            


        }
    }
}

struct X2Button_Previews: PreviewProvider {
    static var previews: some View {
        X2Button( action: {print("")})
    }
}
