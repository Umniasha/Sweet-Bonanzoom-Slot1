//
//  MainMenuPage.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 25.04.2024.
//

import SwiftUI
import NavigationTransitions

struct MainMenuPage: View {
    
    
    @State private var rotationAnglePlay: Double = 0
    @State private var rotationAngleShop: Double = 0
    @State private var selectionView : String? = nil
    
    
    var body: some View {
        NavigationView{
            VStack{   //MARK: main vertical stack
                
                        HStack{ //MARK: top bar
                            
                            NavigationLink {
                                InfoPage()
                            } label: {
                                TopBarIcon(imageName: "InfoBTN")
                                
                            }
                            
                            Spacer()
                            
                            ScoreFrame()
                            
                        }
                DailyGifts()
                       

                
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
                .padding(.bottom, -20)
                
                HStack(alignment: .top, spacing: 0){  //MARK: Buttons play and shop
                    ZStack{
                        Image("CandyForPlayBTN")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: ContentView().frameWidth/1.7)
                            .rotationEffect(.degrees(rotationAnglePlay))
                        
                            Button(action: {
                                withAnimation(.spring()) {
                                    rotationAnglePlay -= 360
                                    self.selectionView = "Play"
                                }
                                    }) {
                                        Image("PlayBTN")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: ContentView().frameWidth/1.7 )
                                        }
                    }
                    .padding(.top)
                    .padding(.trailing, -45)
                    
                    ZStack{
                        Image("CandyForShopBTN")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: ContentView().frameWidth/4)
                            .rotationEffect(.degrees(rotationAngleShop))
                        
                        
                        Button(action: {
                            withAnimation(.spring()) {
                                rotationAngleShop -= 360
                                self.selectionView = "Shop"
                            }
                                }) {
                                    Image("ShopBTN")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: ContentView().frameWidth/5.5)

                                }
                    }
                    NavigationLink(tag: "Play", selection: $selectionView) {
                        GameViewPage(scene: GameScene())
                    } label: {
                        //
                    }
                    
                    
                    NavigationLink(tag: "Shop", selection: $selectionView) {
                        InfoPage()
                    } label: {
                        //
                    }
                }
                Spacer()
                
            } //MARK: end of main vertical stack
            .padding([.leading, .trailing])
            .background(alignment: .bottom) {
                Image("MainMenuBG")
                                       .resizable()
                                       .edgesIgnoringSafeArea(.all)
                                       .aspectRatio(contentMode: .fill)
                                       .frame(height: ContentView().frameHeight)
            }
            .navigationBarHidden(true)
            
        }
        .navigationViewStyle(.stack)
        .navigationTransition(
            .fade(.in).animation(.easeInOut(duration: 0.3))
        )
    }
}

struct MainMenuPage_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuPage()
            .environmentObject(UserData())
    }
}
