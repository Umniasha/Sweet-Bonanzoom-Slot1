//
//  GameViewPage.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 28.04.2024.
//

import SwiftUI
import SpriteKit

struct GameViewPage: View {
    
    var scene: SKScene
    let sceneWidth = UIScreen.main.bounds.width*0.9
    @State private var readyGame: Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var setBet: Bool = true
    @State private var isPause = false
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
                    TopBarIcon(imageName: "TopShop")
                    
                    ScoreFrame()
                    
                }
                if (ContentView().frameHeight / ContentView().frameWidth) > 1.8 {
                    HeaderText(text: "Set your bet")
                }
                
                
                ZStack{
                    
                   SpriteView(scene: scene, options: [.allowsTransparency])
                        .frame(width: sceneWidth, height: sceneWidth*1.16)
                        
                    Image("GameFrame")
                        .resizable()
                        .frame(width: sceneWidth, height: sceneWidth*1.16)
                    Button {
                        //
                    } label: {
                        Image(setBet ? "Update" : "UpdateNotActive")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                    }
                    .padding(.leading,  UIScreen.main.bounds.width-80)
                    .padding(.bottom, (UIScreen.main.bounds.width-40)*1.1)
                    .disabled(!setBet)
                    

                    
                    
                }
                .aspectRatio(contentMode: .fit)
                .minimumScaleFactor(0.5)
                
                HStack(spacing:0){
                    VStack(spacing: 10){
                        HStack(alignment: .center, spacing: 0){
                            X2Button(isActive: true, text: "x2", action: {print("")})
                            X2Button(isActive: true, text: "x5", action: {print("")})
                            X2Button(isActive: true, text: "x10", action: {print("")})
                        }
                        
                        
                        ChooseElementButton(isActive: true, action: {self.readyGame.toggle()}, isChoosed: readyGame, elementName: "Info6")
                    }
                    .frame(width: (ContentView().frameWidth-20)/2)
                    Spacer()
                    VStack{
                        BetView(isActive: true, activeMinus: {}, activePlus: {})
                        SpeenButton(isActive: true, text: "SPEEN", imageName: "Speen")
                        SpeenButton(isActive: true, text: "AUTO SPEEN", imageName: "AutoSpin")
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
                    self.presentationMode.wrappedValue.dismiss()
                }).transition(.opacity.animation(.linear))
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
        GameViewPage(scene: GameScene())
            .environmentObject(UserData())
    }
}
