//
//  GameViewPage.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 28.04.2024.
//

import SwiftUI
import SpriteKit

struct GameViewPage: View {
    
    //var scene: SKScene
    let gameScene : GameScene

    let sceneWidth = UIScreen.main.bounds.width*0.9
    @State private var readyGame: Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var userData: UserData
    var setBet: Bool = true
    @State private var isPause = false
    @State private var isChoosed = false
    @State private var selectionView : String? = nil
    
    
    var body: some View {
        
        ZStack{
            VStack{   //MARK: main vertical stack
                
                HStack(spacing: 0){ //MARK: top bar
                    
                    Button {
                        self.isPause.toggle()
                        
                    } label: {
                        TopBarIcon(imageName: "PauseBTN")
                    }

                    Spacer()
                    
                    TopBarIcon(imageName: "Info7")
                    Button {
                        selectionView = "Shop"
                    } label: {
                        TopBarIcon(imageName: "TopShop")
                    }

                    NavigationLink(tag: "Shop", selection: $selectionView) {
                        ShopPage()
                    } label: {
                        //
                    }
                    
                    
                    ScoreFrame()
                    
                }
                if (ContentView().frameHeight / ContentView().frameWidth) > 1.8 {
                    HeaderText(text: "Set your bet")
                }
                
                
                ZStack{
                    
                   SpriteView(scene: gameScene, options: [.allowsTransparency])
                        .aspectRatio(contentMode: .fit)
                        //.aspectRatio(344/400, contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                    Button {
                        gameScene.play()
                    } label: {
                        Image(setBet ? "Update" : "UpdateNotActive")

                    }
                    .padding(.leading,  sceneWidth*0.85)
                    .padding(.bottom, sceneWidth*1.05)
                    .disabled(!setBet)
                    

                    
                    
                }
                
                HStack(spacing:0){
                    VStack(spacing: 10){
                        HStack(alignment: .center, spacing: 0){
                            X2Button(isActive: true, text: "x2", action: {print("")}, value: 1)
                            X2Button(isActive: true, text: "x5", action: {print("")}, value: 1)
                            X2Button(isActive: true, text: "x10", action: {print("")}, value: 1)
                        }
                        
                        
                        ChooseElementButton(isActive: true, action: {
                            isChoosed.toggle()
                        }, isChoosed: userData.selectedElement == nil, elementName: userData.selectedElement)
                    }
                    .frame(width: (ContentView().frameWidth-20)/2)
                    Spacer()
                    VStack{
                        BetView(isActive: true, activeMinus: {}, activePlus: {})
                        SpeenButton(action: {
                            gameScene.letSpeen()
                            gameScene.letSpeen()
                        }, isActive: true, text: "SPEEN", imageName: "Speen")
                        SpeenButton(action: {}, isActive: true, text: "AUTO SPEEN", imageName: "AutoSpin")
                    }
                    .frame(width: (ContentView().frameWidth-20)/2)
                    
                    
                }
                .aspectRatio(contentMode: .fit)
                .minimumScaleFactor(0.5)
                
                
                
                Spacer()
                
            } //MARK: end of main vertical stack
            .padding([.leading, .trailing])
            .background(alignment: .bottom) {
                Image("Background 0")
                                       .resizable()
                                       .edgesIgnoringSafeArea(.all)
                                       .aspectRatio(contentMode: .fill)
                                       .frame(height: ContentView().frameHeight)
            }
            .navigationBarHidden(true)

            if isPause{
                PausePage(continueAction: {self.isPause.toggle()}, infoAction: {self.selectionView = "Info"}, menuAction: {
                    userData.selectedElement = nil
                    self.presentationMode.wrappedValue.dismiss()
                }).transition(.opacity.animation(.linear))
            }
            if isChoosed{
                SelectElementPage( closeButtonAction: {isChoosed.toggle()})
            }
            NavigationLink(tag: "Info", selection: $selectionView) {
                InfoPage()
            } label: {
                //
            }
        }

    }
}

struct GameViewPage_Previews: PreviewProvider {
    static var previews: some View {
        GameViewPage(gameScene: GameScene())
            .environmentObject(UserData())
    }
}
