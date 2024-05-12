//
//  GameViewPage.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 28.04.2024.
//

import SwiftUI
import SpriteKit

struct GameViewPage: View {
    
    let gameScene : GameScene
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var userData: UserData
    let sceneWidth = UIScreen.main.bounds.width*0.9
    var setBet: Bool = true
    @State private var isPause = false
    @State private var showChoosePage = false
    @State private var selectionView : String? = nil
    @State private var isSpeen : Bool = false
    @State private var isAutoSpeen : Bool = false
    @State private var isWinnerPage: Bool = false
    
    @State private var winnings : Int = 0
    @State private var winBonus : Bool = false
    @State private var bomb : Bool = false
    @State private var freeSpeens : Int = 0
    
    
    private var selectedCellsCount: Int {
    
        return gameScene.selectedFrames.count
        
    }
    
    
    var bonusX2 : Bool = true
    var bonusX5 : Bool = true
    var bonusX10 : Bool = true
    @State private var bonuses: Bonuses?
    
    @State private var bet = 0
    
    @State private var chooseON : Bool = true
    
    @State private var selectON : Bool = true
    
    @State private var betON : Bool = true
    
    @State private var bonusON: Bool = true
    
    @State private var speenON = false
    
    @State private var isSpeenON = false
    

    func update(){
        if userData.selectedElement != nil && bet > 0  && !isAutoSpeen && gameScene.selectedFrames.count > 0{
            isSpeenON = true
        } else {
            isSpeenON = false
        }
    }

    
    

    
    var body: some View {
       
        
        ZStack{
            
            VStack(spacing:0){   //MARK: main vertical stack
                
                HStack(spacing: 0){ //MARK: top bar
                    
                    Button {
                        self.isPause.toggle()
                        
                    } label: {
                        TopBarIcon(imageName: "PauseBTN")
                    }

                    Spacer()
                    Freespins(value: userData.freeSpins, action: {
                        for selectFrame in gameScene.selectedFrames{
                            selectFrame.removeFromParent()
                        }
                        gameScene.selectedFrames = []
                        gameScene.randomFrame()
                        UserDataManager.shared.numberOfSpeens += 1
                        userData.selectedElement = userData.elements.randomElement()?.0
                        speenStart()
                        bet = 100
                        gameScene.autoSpeen(afterSpeen: {
                            speenStop()
                        })
                        userData.freeSpins -= 1
                    })
                    
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
                if userData.selectedElement == nil{
                    HeaderText(text: "Choose your key element")
                } else if gameScene.selectedFrames.count < 1{
                    HeaderText(text: "Select your tiles")
                } else if betON{
                    HeaderText(text: "Set your bet")
                } else {
                    HeaderText(text: "Speen")
                }
                
                
                ZStack{
                    
                   SpriteView(scene: gameScene, options: [.allowsTransparency])
                    
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .onTapGesture(perform: {update()})
                        
                        
                    Button {
                        if userData.selectedElement != nil{
                            gameScene.createGrid()
                            gameScene.createFrameElements()
                        }
                        

                    } label: {
                        Image(!isSpeenON ? "Update" : "UpdateNotActive")

                    }
                    .padding(.leading,  sceneWidth*0.85)
                    .padding(.bottom, sceneWidth*1.05)
                    .disabled(isSpeenON)
                    

                    
                    
                }
                .padding(.all,0)
                .frame(height: ContentView().frameWidth)
                
                HStack(spacing:0){
                    VStack(spacing: 5){
                        HStack(alignment: .center, spacing: 0){
                            X2Button(isActive : betON , text: "x2", action: {
                                if bonuses == .x2 {
                                    bonuses = nil
                                } else {
                                    bonuses = .x2
                                }
                                
                            }, value: userData.x2Bonus, bonus: bonuses == .x2)
                            X2Button(isActive: betON, text: "x5", action: {
                                if bonuses == .x5 {
                                    bonuses = nil
                                } else {
                                    bonuses = .x5
                                }
                                
                            },value: userData.x5Bonus, bonus: bonuses == .x5)
                            X2Button(isActive: betON, text: "x10", action: {
                                if bonuses == .x10 {
                                    bonuses = nil
                                } else {
                                    bonuses = .x10
                                }
                                
                            },value: userData.x10Bonus, bonus: bonuses == .x10)
                        }
                        
                        
                        ChooseElementButton(isActive: chooseON, action: {
                            showChoosePage.toggle()
                            
                        }, isChoosed: userData.selectedElement == nil, elementName: userData.selectedElement)
                    }
                    .frame(width: (ContentView().frameWidth-20)/2)
                    
                    Spacer()
                    
                    VStack{
                        BetView(isActive: betON, bet: bet, activeMinus: {
                            if bet  < 10{
                                bet -= 10 - (10 - bet)
                            } else {
                                bet-=10
                            }
                            
                            update()
                            
                        }, activePlus: {
                            if (userData.coins - bet) < 10{
                                bet += userData.coins - bet
                            } else if bet < userData.coins{
                                bet+=10
                            }
                            
                            update()
                        })
                        ZStack{
                            
                            if isSpeen {
                                SpeenButton(action: {
                                    gameScene.stopSpeen {
                                        
                                        speenStop()
                                    }
                                }, isActive: !speenON, text: "STOP", imageName: "Speen")
                            } else {
                                SpeenButton(action: {
                                    UserDataManager.shared.numberOfSpeens += 1
                                    speenStart()
                                    gameScene.speen()
                                    userData.coins -= bet
                                }, isActive: isSpeenON, text: "SPEEN", imageName: "Speen")
                            }
                        }
                        
                        
                        SpeenButton(action: {
                            if !isSpeen{
                                UserDataManager.shared.numberOfSpeens += 1
                                speenStart()
                                userData.coins -= bet
                                gameScene.autoSpeen(afterSpeen: {
                                    speenStop()
                                })
                            } else {
                                gameScene.stopSpeen {
                                    speenStop()
                                }
                            }
                            
                            betON  = false
                            
                        }, isActive: isSpeenON , text: "AUTO SPEEN", imageName: "AutoSpin")
                        
                    }
                    
                    
                    
                }
                .aspectRatio(contentMode: .fit)
                .minimumScaleFactor(0.5)
                .padding(.all, 0)
                
                
                
                Spacer()
                
            } //MARK: end of main vertical stack
            .padding([.leading, .trailing])
            .background(alignment: .bottom) {
                Image("\(userData.enabledBG)true")
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
            if showChoosePage{
                SelectElementPage( gameScene: GameScene(), isSelectAction: {
                    gameScene.createFrameElements()
                    gameScene.isSelect = true
                }, closeButtonAction: {showChoosePage.toggle()})
            }
            
            if isWinnerPage{
                GameWin(winCoins: winnings, winBonus: winBonus , freeSpeens: freeSpeens, menuButtonAction: {
                    
                    self.presentationMode.wrappedValue.dismiss()
                    
                }, againOrBonusAction: {
                    if winBonus {
                        selectionView = "Bonus"
                        winBonus = false
                    }   else {
                        isWinnerPage = false
                        bet = 0
                        chooseON = true
                        gameScene.isSelect = true
                        isAutoSpeen = false
                    }
                    
                })
            }
            NavigationLink(tag: "Info", selection: $selectionView) {
                InfoPage()
            } label: {
                //
            }
            
            NavigationLink(tag: "Bonus", selection: $selectionView) {
                BonusGamePage()
            } label: {
                //
            }
            if userData.firstStart {
                GuidePage(gameScene: GameScene(), firstBtnAction: {
                    userData.firstStart = false
                }, secondButtonAction: {
                    userData.firstStart = false
                })
            }
          
        }
        
    }
    func endGame(){
        var matchCount : Int = 0
        var matchWithBomb : Int = 0
        var xValue : Int = 0
        for element in userData.elements{
            if element.0 == userData.selectedElement{
                xValue = Int(element.1.dropFirst() ) ?? 2
            }
        }
        freeSpeens = 0
        bomb = false
        winBonus = false
        for element in gameScene.selectedElements{
            if element == userData.selectedElement{
                matchCount += 1
            }
            if element == "Bonus game"{
                winBonus = true
            }
            if element == "Bomb"{
                bomb = true
            }
            if element == "Free speens"{
                freeSpeens += 1 * (bonuses?.rawValue ?? 1)
                userData.freeSpins += 1 * (bonuses?.rawValue ?? 1)
            }
        }
        
        if bomb {
            
            for element in gameScene.elementsArray{
                if element.name == userData.selectedElement {
                    matchWithBomb += 1
                }
            }
            
            winnings = Int(bet  * matchWithBomb * xValue * (bonuses?.rawValue ?? 1))
            
            if winnings > UserDataManager.shared.allTimeBest{
                UserDataManager.shared.allTimeBest = winnings
            }
            if winnings > UserDataManager.shared.todayBest {
                UserDataManager.shared.todayBest = winnings
            }
            isWinnerPage = true
            userData.coins += winnings
            
            
        }else if matchCount > 0 || freeSpeens > 0 || winBonus {
            
            winnings = Int(bet / gameScene.selectedElements.count * matchCount * xValue * (bonuses?.rawValue ?? 1))
                isWinnerPage = true
                userData.coins += winnings
            
            if winnings > UserDataManager.shared.allTimeBest{
                UserDataManager.shared.allTimeBest = winnings
            }
            if winnings > UserDataManager.shared.todayBest {
                UserDataManager.shared.todayBest = winnings
            }
            
        } else {
            
        }
        
    }
    
    func speenStart(){
        if bonuses != nil{
            if bonuses == .x2 {
                userData.x2Bonus -= 1
            } else if bonuses == .x5 {
                userData.x5Bonus -= 1
            } else if bonuses == .x10{
                userData.x10Bonus -= 1
            }
        }
        gameScene.removeFrames()
        betON = false
        isSpeen = true
        chooseON = false
    }
    
    func speenStop(){
        endGame()
        isSpeen = false
        betON = true
        chooseON = true
        gameScene.createFrameElements()
        isSpeenON = false
        bonuses = nil
        bet = 0
    }
}

struct GameViewPage_Previews: PreviewProvider {
    static var previews: some View {
        GameViewPage(gameScene: GameScene())
            .environmentObject(UserData())
    }
}
