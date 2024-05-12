//
//  Freespins.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 09.05.2024.
//

import SwiftUI

struct Freespins: View {
    var value = 0
    var action: ()->Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                TopBarIcon(imageName: "freespins")
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
                .padding(.leading, 25)
                .padding(.bottom, 30)
                
                
            }
            
        }
        .disabled(value<1)
        
    }
}

struct Freespins_Previews: PreviewProvider {
    static var previews: some View {
        Freespins( action: {})
    }
}
