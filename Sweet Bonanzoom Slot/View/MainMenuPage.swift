//
//  MainMenuPage.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 25.04.2024.
//

import SwiftUI

struct MainMenuPage: View {
    var body: some View {
       
            VStack{   //MARK: main vertical stack
                
                        HStack{ //MARK: top game menu
                            Button(action: {
                                
                                
                                    }) {
                                        Image("InfoIcon")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 60)
                                            .shadow(color: .black, radius: 2, x: 0, y: 2)
                                            
                                    }
                            Spacer()
                            
                            ZStack{ //MARK: score frame
                                Image("ScoreFrame")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150)
                                    .shadow(color: .black, radius: 2, x: 0, y: 2)
                                
                                Text("1000")
                                    .font(.custom("Maven Pro", size: 18))
                                    .bold()
                                    .foregroundColor(.white)
                                    .shadow(color: .black, radius: 2, x: 0, y: 2)
                                    .padding(.bottom, 5)
                                    .minimumScaleFactor(0.5)
                                
                                Image("ScoreItem")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50)
                                    .padding(.top , 25)
                                    .padding(.leading, 110)
                            }
                            
                            
                        }
                       
                
                ZStack{ //MARK: daily gifts
                    Image("GiftLine")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                    HStack{
                        
                        ForEach(0..<5) {i in
                            if i < 4 {
                            Image("ClosedBox\(i+1)")
                                .resizable()
                                .frame(width: 60, height: 60)
                            Spacer()
                            } else {
                                Image("ClosedBox\(i+1)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60)
                            }
                        }
                    }
                }
                
                HStack{  //MARK: Biggest menu
                    Button(action: {
                        
                            }) {
                                Image("LeftArrow")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40 )
                                    
                                    
                            }
                    
                    ZStack{
                        Image("BiggestFrame")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                        VStack{
                            Text("BIGEST WIN\n TODAY:")
                                .font(.custom("Maven Pro", size: 15))
                                .bold()
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 2, x: 0, y: 2)
                                .multilineTextAlignment(.center)
                                .minimumScaleFactor(0.5)
                            
                            Text("1000")
                                .font(.custom("Maven Pro", size: 25))
                                .bold()
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 2, x: 0, y: 2)
                                .multilineTextAlignment(.center)
                                .minimumScaleFactor(0.5)
                        }
                        .padding(.bottom, 5)
                        
                        HStack{
                            Image("LeftCup")
                            Spacer()
                            Image("RightCup")
                        }
                        .padding([.leading, .trailing], -25)
                            
                    }
                    
                    Button(action: {
                        
                            }) {
                                Image("RightArrow")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40 )
                                    
                                    
                            }
                }
                
                HStack(alignment: .top){
                    Image("CandyForPlayBTN")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: ContentView().frameWidth/1.7)
                        .padding(.top)

                    
                    Image("CandyForShopBTN")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: ContentView().frameWidth/5)

                }
                Spacer()
                
            }
            .padding([.leading, .trailing])
            .background(alignment: .bottom) {
                Image("MainMenuBG")
                                       .resizable()
                                       .edgesIgnoringSafeArea(.all)
                                       .aspectRatio(contentMode: .fill)
                                       .frame(height: ContentView().frameHeight)
            }
    }
}

struct MainMenuPage_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuPage()
    }
}
