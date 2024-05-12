//
//  Biggest.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 11.05.2024.
//

import SwiftUI

struct Biggest: View {
    var pages : [(Int, String, Int)] = [(0, "BIGGEST WIN\n OF ALL TIME:", UserDataManager.shared.allTimeBest ),
                                        (1, "BIGGEST WIN\n TODAY:", UserDataManager.shared.todayBest ),
                                        (2, "NUMBER\nOF SPINS:", UserDataManager.shared.numberOfSpeens ),]
    @State private var page = 0
    var images : [(String, String)] = [("LeftCup","RightCup"),
                                       ("leftCoin", "rightCoin"),
                                       ("leftCrown", "rightCrown")]
    
    var body: some View {
        HStack{  //MARK: Biggest menu
            Button(action: {
                if page >= 1 {
                    page -= 1
                } else {
                    page = 2
                }
                    }) {
                        Image("LeftArrow")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40 )
                            
                            
                    }
            //
            ZStack{
                Image("BiggestFrame")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                VStack{
                    Text(pages[page].1)
                        .font(.custom("Maven Pro", size: 15))
                        .bold()
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2, x: 0, y: 2)
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.5)
                    
                    Text(String(pages[page].2))
                        .font(.custom("Maven Pro", size: 25))
                        .bold()
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2, x: 0, y: 2)
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.5)
                }
                .padding(.bottom, 5)
                
                HStack{
                    Image(images[page].0)
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(height: ContentView().frameWidth/3)
                    Spacer()
                    Image(images[page].1)
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(height: ContentView().frameWidth/3)
                }
                .padding([.leading, .trailing], -25)
                .padding(.bottom, 10)
                    
            }
            
            //
            Button(action: {
                if page < 2 {
                    page += 1
                } else {
                    page = 0
                }

                    }) {
                        Image("RightArrow")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40 )
                            
                            
                    }
        }
        .padding(.bottom, -20)

    }
}

struct Biggest_Previews: PreviewProvider {
    static var previews: some View {
        Biggest()
    }
}
