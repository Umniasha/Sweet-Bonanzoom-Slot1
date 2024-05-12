//
//  PausePage.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 30.04.2024.
//

import SwiftUI

struct PausePage: View {
    var continueAction: ()->Void
    var infoAction: ()->Void
    var menuAction: ()->Void
    var body: some View {
        VStack{
            Image("logo")
            Button {
                continueAction()
            } label: {
                ZStack{
                    
                    Image( "continue")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 75)
                        .shadow(color: .black, radius: 2, x: 0, y: 2)
                   
                }
            }
            
            Button {
                infoAction()
            } label: {
                ZStack{
                    
                    Image( "info")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 60)
                        .shadow(color: .black, radius: 2, x: 0, y: 2)
                   
                }
            }
            Button {
                menuAction()
            } label: {
                ZStack{
                    
                    Image( "menu")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 60)
                        .shadow(color: .black, radius: 2, x: 0, y: 2)
                   
                }
            }
            Spacer()
        }
        .background(Image("PauseBG")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .aspectRatio(contentMode: .fill)
            .frame(width: ContentView().frameWidth, height: ContentView().frameHeight))
        
    }
}

struct PausePage_Previews: PreviewProvider {
    static var previews: some View {
        PausePage(continueAction: {}, infoAction: {}, menuAction: {})
    }
}
