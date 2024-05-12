//
//  GuidePage.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 09.05.2024.
//

import SwiftUI
import _SpriteKit_SwiftUI

struct GuidePage: View {
    
    let gameScene : GameScene
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var userData: UserData
    @State private var guideFrame = 1
    @State private var bet = 0
    var firstBtnAction : ()->Void
    var secondButtonAction : ()->Void
    var textSize : CGFloat {
      if ContentView().frameWidth >= 400 {
          return 25
      } else{
          return 20
      }
  }
    @State private var imageName = "Guide1"
    
    
    var body: some View {
        ZStack{
            
            VStack{
                Spacer()
                Image(imageName)
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: ContentView().frameWidth)
                    
                
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack{   //MARK: main vertical stack
                
                HStack(spacing: 0){ //MARK: top bar
                    
                    
                    
                    Spacer()
                    
                    
                    
                    
                    
                    ScoreFrame()
                        .opacity(0)
                    
                }
                .padding(.bottom)
                
                
                ZStack{
                    
                    SpriteView(scene: gameScene, options: [.allowsTransparency])
                    
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .onTapGesture(perform: {
                            guideFrame = 4
                            imageName = "Guide4"
                        })
                    
                    
                    Button {
                        
                    } label: {
                        Image( "Update" )
                        
                    }
                    .padding(.leading,  GameViewPage(gameScene: GameScene()).sceneWidth*0.85)
                    .padding(.bottom, GameViewPage(gameScene: GameScene()).sceneWidth*1.05)
                    .opacity(0)
                    .disabled(true)
                    
                    
                    
                }
                .padding(.all,0)
                .frame(height: ContentView().frameWidth)
                .opacity(guideFrame != 3 ? 0 : 1)
                
                HStack(spacing:0){
                    if guideFrame == 1  || guideFrame == 7{
                        VStack{
                            Button {
                                if guideFrame == 1{
                                    guideFrame = 2
                                    imageName = "Guide2"
                                } else {
                                    firstBtnAction()
                                }
                                
                            
                        } label: {
                            ZStack{
                                
                                Image( "Speen")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: ContentView().frameWidth*0.4)
                                    .shadow(color: .black, radius: 2, x: 0, y: 2)
                                Text(guideFrame == 1 ? "CONTINUE" : "START")
                                    .font(.custom("Maven Pro", size: textSize))
                                    .bold()
                                    .foregroundColor(.white)
                                    .shadow(color: .black, radius: 2, x: 0, y: 2)
                                    .padding(.bottom, 3)
                               
                            }
                        }
                        
                        Button {
                            if guideFrame != 1 {
                                self.presentationMode.wrappedValue.dismiss()
                            } else {
                                secondButtonAction()
                            }
                            
                        } label: {
                            ZStack{
                                
                                Image( "menuEmpty")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: ContentView().frameWidth*0.3)
                                    .shadow(color: .black, radius: 2, x: 0, y: 2)
                                Text(guideFrame == 1 ? "SKIP" : "MENU")
                                    .font(.custom("Maven Pro", size: textSize))
                                    .bold()
                                    .foregroundColor(.white)
                                    .shadow(color: .black, radius: 2, x: 0, y: 2)
                                    .padding(.bottom, 3)
                               
                            }
                        }
                        }
                            .padding(.leading, 25)
                    } else {
                        VStack(spacing: 5){
                            HStack(alignment: .center, spacing: 0){
                                X2Button(isActive : true , text: "x2", action: {
                                    guideFrame = 6
                                    imageName = "Guide6"
                                }, value: 1, bonus: false )
                                X2Button(isActive: true, text: "x5", action: {
                                    imageName = "Guide6"
                                    guideFrame = 6
                                },value: 1, bonus: false)
                                X2Button(isActive: true, text: "x10", action: {
                                    guideFrame = 6
                                    imageName = "Guide6"
                                    
                                },value: 1, bonus: false)
                            }
                            .opacity(guideFrame != 5 ? 0 : 1)
                            .onTapGesture(perform: {
                                guideFrame = 6
                                imageName = "Guide6"
                            })
                            
                            
                            ChooseElementButton(isActive: true, action: {
                                guideFrame = 3
                                imageName = "Guide3"
                                gameScene.createFrameElements()
                                
                            })
                            .opacity(guideFrame != 2 ? 0 : 1)
                        }
                        .frame(width: (ContentView().frameWidth-20)/2)
                    }

                    
                    Spacer()
                    
                    VStack{
                        BetView(isActive: true, bet: bet, activeMinus: {
                            guideFrame = 5
                            imageName = "Guide5"
                            
                        }, activePlus: {
                            bet += 10
                            guideFrame = 5
                            imageName = "Guide5"
                        })
                        .opacity(guideFrame != 4 ? 0 : 1)
                        .onTapGesture(perform: {
                            guideFrame = 5
                            imageName = "Guide5"
                        })
                        
                        ZStack{
                            
                            
                            SpeenButton(action: {
                                guideFrame = 7
                                imageName = "Guide7"
                            }, isActive: true, text: "SPEEN", imageName: "Speen")
                        }
                        .opacity(guideFrame != 6 ? 0 : 1)
                        
                        
                        
                        SpeenButton(action: {
                            
                        }, isActive: true , text: "AUTO SPEEN", imageName: "AutoSpin")
                        .opacity(0)
                        
                    }
                    
                    
                    
                }
                .aspectRatio(contentMode: .fit)
                .minimumScaleFactor(0.5)
                .padding(.all, 0)
                
                
                
                Spacer()
                    .navigationBarHidden(true)
                
            }
            .padding([.leading, .trailing])
           
           
            
        }
        .background(alignment: .bottom) {
            Image("SelectBG")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fill)
                .frame(width: ContentView().frameWidth)

    }
        
    }
        

    }


struct GuidePage_Previews: PreviewProvider {
    static var previews: some View {
        GuidePage(gameScene: GameScene(), firstBtnAction: {}, secondButtonAction: {})
            .environmentObject(UserData())
    }
}
