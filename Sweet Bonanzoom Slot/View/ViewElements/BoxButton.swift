//
//  BoxButton.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 11.05.2024.
//

import SwiftUI

struct BoxButton: View {
    var openBox = false
    var boxAction : ()->Void
    var readyToActive : Bool = true
    var imageOpenBox : String = "OpenBox1"
    var imageCloseBox : String = "ClosedBox1"
    var body: some View {
        ZStack{
            Button {
                boxAction()
            } label: {
                ZStack{
                    Image(openBox ? imageOpenBox : imageCloseBox)
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: ContentView().frameWidth*0.15)
                    if readyToActive {
                        Image("Stars")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: ContentView().frameWidth*0.15)
                        
                    }
                }
                
            }
            .disabled(!readyToActive)

        }
    }
}

struct BoxButton_Previews: PreviewProvider {
    static var previews: some View {
        BoxButton(boxAction: {})
    }
}
