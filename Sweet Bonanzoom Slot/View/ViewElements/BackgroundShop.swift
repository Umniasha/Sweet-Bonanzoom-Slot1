//
//  BackgroundShop.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 30.04.2024.
//

import SwiftUI

struct BackgroundShop: View {
    let width = ContentView().frameWidth*0.6
    var bgName: String = "bg1"
    var active: Bool = true
    var price: Int = 1000
    var action : ()->Void
    var body: some View {
        ZStack{
            Image(bgName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width)
            
            Image("frame")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width)
            
            Button {
                action()
            } label: {
                ZStack{
                    Image(active ? "framePrice": "framePriceNo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: width*0.7)
                    
                    Text(String(price))
                        .font(.custom("Maven Pro", size: 18))
                        .bold()
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2, x: 0, y: 2)
                        .padding(.bottom, 12)
                        .frame(width: 50)
                        .lineLimit(1)
                }
            }
            .padding(.top, width*1.35)
            .disabled(!active)
            
            Image("ScoreItem")
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: width*0.2)
                .padding(.leading, width*0.5)
                .padding(.top, width*1.45)
                
        }
    }
}

struct BackgroundShop_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundShop(action: {})
    }
}
