//
//  ShopPage.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 30.04.2024.
//

import SwiftUI

struct ShopPage: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var userData: UserData
    let width = ContentView().frameWidth
    
    var body: some View {
        
        VStack(spacing:0){
            HStack{
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    TopBarIcon(imageName: "BackBTN")
                }

                Spacer()
                
                ScoreFrame()
            }
            .padding([.leading,.trailing])
            
            
            Image("shopIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width/1.4)
                .padding([.leading,.trailing])
            
            HStack(spacing:0){
                xPriceFrame(active: true, xValue: "x2", price: 500) {
                    //
                }
                xPriceFrame(active: true, xValue: "x5", price: 500) {
                    //
                }
                xPriceFrame(active: true, xValue: "x10", price: 500) {
                    //
                }
            }
            
            Image("gameBackground")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width/1.3)
                .padding([.leading,.trailing])
            
           
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    
                    Spacer()
                    Spacer()
                    
                    ForEach(0..<9){i in
                        let bgName = "bg\(i+1)"
//                        ForEach(0..<userData.myBackgrounds.count){name in
//                            if name == bgName {
//
//                            }
//                        }
                        if i<=2 {
                            BackgroundShop(bgName: bgName, active: true, price: 500, action: {
                                userData.myBackgrounds.append(bgName)
                            })
                        } else if i<=5{
                            BackgroundShop(bgName: bgName, active: true, price: 700, action: {})
                        } else{
                            BackgroundShop(bgName: bgName, active: true, price: 900, action: {})
                        }
                        
                    }
                    Spacer()
                    Spacer()
                    
                }
            }
            
            Spacer()
        }
        .background(alignment: .bottom) {
            Image("Background 0")
                   .resizable()
                   .edgesIgnoringSafeArea(.all)
                   .aspectRatio(contentMode: .fill)
                   .frame(width: width)
        }
        .navigationBarHidden(true)
    }
}

struct ShopPage_Previews: PreviewProvider {
    static var previews: some View {
        ShopPage()
            .environmentObject(UserData())
    }
}
