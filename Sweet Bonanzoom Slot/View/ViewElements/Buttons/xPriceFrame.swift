//
//  xPriceFrame.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 30.04.2024.
//

import SwiftUI

struct xPriceFrame: View {
    let width = ContentView().frameWidth/3.5
    var active: Bool = false
    var xValue: String = "x2"
    var price: Int = 1000
    var action : ()->Void
    var body: some View {
        ZStack{
            Image("Group 43")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width)
            ZStack{
                Image("xBTNActive")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width/2)
                    
                Text(xValue)
                    .font(.custom("Maven Pro", size: 18))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2, x: 0, y: 2)
                    .padding(.leading, 1)
            }
            .padding(.bottom, width*0.7)
            
            Button {
                action()
            } label: {
                ZStack{
                    Image(active ? "smallPrice": "smallPriceNo")
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
            .padding(.top, width*0.3)
            .disabled(!active)
            
            Image("ScoreItem")
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: width*0.4)
                .padding([.leading,.top], width*0.6)
                

            
        }
    }
}

struct xPriceFrame_Previews: PreviewProvider {
    static var previews: some View {
        xPriceFrame(action: {})
    }
}
