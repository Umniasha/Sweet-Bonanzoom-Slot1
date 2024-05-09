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
    
    func isBought(bgName: String)->Bool{
        var isBought = false
        for name in userData.boughtBG{
            if bgName == name {
                isBought = true
            }
        }
        print(isBought)
        return isBought
    }
    
   
    
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
                xPriceFrame(active: userData.coins >= 500, xValue: "x2", price: 500) {
                    userData.coins -= 500
                    userData.x2Bonus += 1
                }
                xPriceFrame(active: userData.coins >= 1000, xValue: "x5", price: 1000) {
                    userData.coins -= 1000
                    userData.x5Bonus += 1
                }
                xPriceFrame(active: userData.coins >= 3000, xValue: "x10", price: 3000) {
                    userData.coins -= 3000
                    userData.x10Bonus += 1
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

                        if i<=2 {
                            BackgroundShop(bgName: bgName, active: userData.coins >= 500, price: 500, action: {
                                if !isBought(bgName: bgName) {
                                    userData.coins -= 500
                                    userData.boughtBG.append(bgName)
                                } else {
                                    userData.enabledBG = bgName
                                }
                            },used: bgName == userData.enabledBG, bought : isBought(bgName: bgName))
                            
                        } else if i<=5{
                            BackgroundShop(bgName: bgName, active: userData.coins >= 700, price: 700, action: {
                                if !isBought(bgName: bgName) {
                                    userData.coins -= 700
                                    userData.boughtBG.append(bgName)
                                } else {
                                    userData.enabledBG = bgName
                                }
                            },used: bgName == userData.enabledBG, bought : isBought(bgName: bgName))
                            
                        } else{
                            BackgroundShop(bgName: bgName, active: userData.coins >= 900, price: 900, action: {
                                if !isBought(bgName: bgName) {
                                    userData.coins -= 900
                                    userData.boughtBG.append(bgName)
                                } else {
                                    userData.enabledBG = bgName
                                }
                            },used: bgName == userData.enabledBG, bought : isBought(bgName: bgName))
                            
                        }
                        
                    }
                    Spacer()
                    Spacer()
                    
                }
            }
            
            Spacer()
        }
        .background(alignment: .bottom) {
            Image("\(userData.enabledBG)true")
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
