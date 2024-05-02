//
//  ChooseElementButton.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 29.04.2024.
//

import SwiftUI

struct ChooseElementButton: View {
        var isActive: Bool = false
        var text: String = "CHOSE YOUR\nELEMENT"
        var action: ()->Void
        var isChoosed: Bool = true
        var elementName : String? = "Info6"
        var frameWidth = ContentView().frameWidth*0.4
        
        var body: some View {
           
                    Button {
                        action()
                    } label: {
                        ZStack{
                            Image(isActive ? "ChooseElementBTN" : "NoChooseElementBTN" )
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(minWidth: frameWidth)
                                .shadow(color: .black, radius: 2, x: 0, y: 2)
                        
                            Text(isChoosed ? "CHOOSE YOUR\nELEMENT" : "CHANGE YOUR\nELEMENT")
                            .font(.custom("Maven Pro", size: 18))
                            .bold()
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .shadow(color: .black, radius: 2, x: 0, y: 2)
                            .minimumScaleFactor(0.5)
                    if let elementName = elementName{
                        ZStack{
                            Image(elementName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60)
                                
                        }
                        .padding(.top , 60)
                        .padding(.leading, 130)
                    }
                }
            }
                    .frame(width: 160)
                    .disabled(!isActive)
        }
    }


struct ChooseElementButton_Previews: PreviewProvider {
    static var previews: some View {
        ChooseElementButton( action: {print("")})
    }
}
