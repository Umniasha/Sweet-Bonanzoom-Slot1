//
//  X2Button.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 29.04.2024.
//

import SwiftUI

struct X2Button: View {
    var isActive: Bool = true
    var text: String = "x2"
    var value: Int = 5
    var action: ()->Void
    
    var body: some View {
        ZStack{
            Button {
                action()
            } label: {
               
                TopBarIcon(imageName: !isActive ? "xBTN" : "xBTNActive")
                
               
            }
            .disabled(!isActive)
            
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
        .minimumScaleFactor(0.5)
    }
}

struct X2Button_Previews: PreviewProvider {
    static var previews: some View {
        X2Button( action: {print("")})
    }
}