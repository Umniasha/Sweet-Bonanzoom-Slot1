//
//  InfoPage.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 26.04.2024.
//

import SwiftUI

struct HeaderText:View{
    var text: String
    var body: some View{
        Text(text)
            .font(.custom("Maven Pro", size: 20))
            .bold()
            .foregroundColor(.white)
            .shadow(color: .black, radius: 2, x: 0, y: 2)
            .padding(.bottom, 5)
    }
}

struct MultyLineText:View{
    var text: String
    var body: some View{
        Text(text)
            .font(.custom("Maven Pro", size: 15))
            .bold()
            .foregroundColor(.white)
            .shadow(color: .black, radius: 2, x: 0, y: 2)
            .multilineTextAlignment(.leading)
            .padding(.bottom, 5)

    }
}

struct InfoPage: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var score: String = "100000"

    var body: some View {
        
        ZStack{
            
            
            ScrollView(showsIndicators: false){
                VStack{
                Image("InfoIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ContentView().frameWidth/3)
                    .padding([.leading,.trailing])
                    
                
                HeaderText(text: "Overview:" )
                
                MultyLineText(text: "Dive into the delightful world of our app, a vibrant and engaging mobile game that combines classic slot mechanics with a whimsical candy theme. Designed for players who enjoy a mix of strategy and luck, this game offers a unique twist on traditional slots by allowing players to select specific tiles and elements to increase their chances of winning. Play for fun, enhance your strategic thinking, and immerse yourself in a colorful candy universe—all within your mobile device!")
                
                HeaderText(text: "How to play:")
                
                MultyLineText(text: "Step 1: Select Your Key Element\nYou will be given 9 items to choose from. You can select one of them to play. Each element has its own base multiplier. This multiplier varies depending on the rarity of the chosen element.")
                
                Image("Info1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: ContentView().frameWidth/3)
                    .padding(.bottom, 5)
                
                MultyLineText(text: "Step 2: Select Your Tiles\nAdjustment of multiplier based on number of cells selected:\n- 1 Cell Selected: No reduction, multiplier remains as per the key element rarity.\n- Each Additional Cell: A fixed amount is subtracted from the multiplier. For instance, if the reduction rate is 0.2x per cell:\n- 2 Cells: Original multiplier - 0.2x\n- 3 Cells: Original multiplier - 0.4x\n- and so on...")
                
                Image("Info2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ContentView().frameWidth/3)
                    .padding(.bottom, 5)
                
                MultyLineText(text: "Step 3: Set Your Bet\nDecide how many Zooms you want to wager on the spin.")
                
                Image("Info3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ContentView().frameWidth/3)
                    .padding(.bottom, 5)
                }
                .padding(.top, 100)
                
                VStack{
                    
                    MultyLineText(text: "Step 4: Optional Bonus Selection\nBefore spinning, you have the option to purchase special bonuses for extra Zooms. These bonuses can increase your winnings with additional multipliers. You can buy these bonuses in the \"Shop\" section.")
                    
                    Image("Info4")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: ContentView().frameWidth/3)
                        .padding(.bottom, 5)
                    
                    MultyLineText(text: "Step 5: Spin the Grid\nHit the spin button. The tiles on the grid will shuffle, landing on various fruit, berry and candy symbols.\n\nStep 6: Check for Wins\nIf your selected element appears in the tiles you chose, you win!\n\nSummary:\nThe core logic of this game revolves around balancing risk and reward. By choosing fewer cells, you increase the potential multiplier but reduce your chances of a hit. Choosing a rarer fruit increases the potential payout but decreases the likelihood of that fruit appearing. The addition of optional bonuses adds another layer of strategy, allowing players to potentially increase their winnings at the cost of a higher initial investment. Good luck!")
                    
                    HeaderText(text: "Special elements:")
                    
                    MultyLineText(text: "Bonus game:\nIf the \"Bonus Game\" icon lands on your pre-selected cell, you'll have the chance to participate in a bonus round after the current game ends. During this bonus round, you can win a free multiplier for your next game!")
                    
                    Image("Info5")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: ContentView().frameWidth/5)
                        .padding(.bottom, 5)
                    
                    MultyLineText(text: "Bomb:\nOccasionally, a “Bomb” icon might appear. If it lands on your chosen tile, it will trigger, eliminating all instances of that item on the grid. This action could potentially increase your winnings, depending on the number of items removed.")
                    
                    Image("Info6")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: ContentView().frameWidth/5)
                        .padding(.bottom, 5)
                    
                    MultyLineText(text: "Free spins:\nIf the “Free Spin” symbol lands on your selected cell, you'll win 10 free spins, allowing you to play the next game without any cost. Your remaining free spins are displayed at the top of the game interface.")
                    
                    Image("Info7")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: ContentView().frameWidth/5)
                        .padding(.bottom, 5)
                    
                }
                VStack{
                    MultyLineText(text: "This game is a purely virtual experience designed solely for entertainment purposes. It does not involve or support real money gambling, betting, or any monetary transactions. All in-game currency, referred to as \"Zooms,\" and any form of winnings or bonuses, are entirely fictional and have no real-world value.\n\nOur game is created to provide a fun and engaging experience for our players within a safe and responsible gaming environment. It is not intended for use as a gambling platform, nor does it offer opportunities for real money gambling or the chance to win real money or real prizes.\n\nPlayers are reminded to enjoy this game responsibly and within the bounds of entertainment. We encourage all players to be aware of their gaming habits and to play sensibly, keeping in mind that the game is intended as a form of virtual entertainment.")
                    
                    HeaderText(text: "Bonus game:")
                    
                    MultyLineText(text: "If the \"Bonus Game\" icon lands on your pre-selected cell, you'll have the chance to participate in a bonus round after the current game ends. During this bonus round, you can win a free multiplier for your next game! ")
                    
                    Image("Info8")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: ContentView().frameWidth/3)
                        .padding(.bottom, 5)
                    
                    HeaderText(text: "Shop:")
                    
                    MultyLineText(text: "In the “Shop” section, you have the option to purchase game multipliers or acquire new wallpapers for the game mode. Select the ones that appeal to you!")
                    
                    HeaderText(text: "Daily Login Rewards:")
                    
                    MultyLineText(text: "Day 1: 500 Zooms\nDay 2: 1000 Zooms\nDay 3: 2000 Zooms\nDay 4: 3000 Zooms\nDay 5: 5000 Zooms\nIf a day is missed, the reward counter resets and starts again from Day 1.")
                    
                    Image("Info9")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: ContentView().frameWidth*0.8)
                        .padding(.bottom, 5)
                    
                    HeaderText(text: "Good luck in the game! May every move bring you joy and success!")
                }
                
               
                
            }
            VStack{
                HStack{
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        TopBarIcon(imageName: "BackBTN")
                    }

                    Spacer()
                    
                    ScoreFrame()
                }
                
                
                Spacer()
            }
            
        }
        .padding([.leading, .trailing])
        .background(Image("InfoPageBG")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: ContentView().frameWidth))
        .navigationBarHidden(true)
    }
}

struct InfoPage_Previews: PreviewProvider {
    static var previews: some View {
        InfoPage()
            .environmentObject(UserData())
    }
}
