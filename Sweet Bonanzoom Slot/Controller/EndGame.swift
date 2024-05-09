////
////  EndGame.swift
////  Sweet Bonanzoom Slot
////
////  Created by Oleg Arnaut  on 08.05.2024.
////
//
//import Foundation
//
//
//func endGame(userData : UserData, gameScene: GameScene, bet: Int,bonus: Bonuses?, onPage: ()->Void) -> Int{
//    var winnings = 0
//    var winBonus = false
//    var bomb = false
//    var freeSpeens = false
//    var matchCount : Int = 0
//    var matchWithBomb : Int = 0
//    var xValue : Int = 0
//    for element in userData.elements{
//        if element.0 == userData.selectedElement{
//            xValue = Int(element.1.dropFirst() ) ?? 2
//        }
//    }
//    for element in gameScene.selectedElements{
//        if element == userData.selectedElement{
//            matchCount += 1
//        }
//        if element == "Bonus game"{
//            winBonus = true
//        }
//        if element == "Bomb"{
//            bomb = true
//        }
//        if element == "Free speens"{
//            freeSpeens = true
//        }
//    }
//    
//    if bomb {
//        
//        for element in gameScene.elementsArray{
//            if element.name == userData.selectedElement {
//                matchWithBomb += 1
//            }
//        }
//        
//        winnings = Int(bet  * matchWithBomb * xValue * (bonus?.rawValue ?? 1))
//        onPage()
//        userData.coins += winnings
//        return winnings
//        
//    }else if matchCount > 0 && !bomb && !freeSpeens{
//        return winnings
////        winnings = Int(bet / gameScene.selectedElements.count * matchCount * xValue * (bonuses?.rawValue ?? 1))
////        isWinnerPage = true
////        userData.coins += winnings
//        
//    } else {
//            return winnings
//            userData.coins -= bet
//    }
//    
//}
