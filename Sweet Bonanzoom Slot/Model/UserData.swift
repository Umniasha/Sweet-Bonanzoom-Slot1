//
//  UserData.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 28.04.2024.
//

import Foundation


class UserData: ObservableObject {
    let userDataManager = UserDataManager.shared

      @Published var coins: Int {
          didSet {
              userDataManager.coins = coins
          }
      }

      init() {
          self.coins = userDataManager.coins
          self.x2Bonus = userDataManager.x2
          self.x5Bonus = userDataManager.x5
          self.x10Bonus = userDataManager.x10
          self.enabledBG = userDataManager.enabledBG
          self.boughtBG = userDataManager.arrayBG
          self.freeSpins = userDataManager.freeSpins
          self.firstStart = userDataManager.firstStart
      }
    
    @Published var x2Bonus: Int {
        didSet {
            userDataManager.x2 = x2Bonus
        }
    }
    @Published var x5Bonus: Int {
        didSet {
            userDataManager.x5 = x5Bonus
        }
    }
    @Published var x10Bonus: Int {
        didSet {
            userDataManager.x10 = x10Bonus
        }
    }
    
    @Published var enabledBG : String {
        didSet {
            userDataManager.enabledBG = enabledBG
        }
    }
    @Published var boughtBG : [String]{
        didSet {
            userDataManager.arrayBG = boughtBG
        }
    }
    
    @Published var freeSpins : Int {
        didSet {
            userDataManager.freeSpins = freeSpins
        }
    }
    
    @Published var firstStart : Bool {
        didSet {
            userDataManager.firstStart = firstStart
        }
    }
    
    var startDate: Date {
            get {
                return UserDefaults.standard.object(forKey: "StartDate") as? Date ?? Date()
            }
            set {
                UserDefaults.standard.set(newValue, forKey: "StartDate")
            }
        }

        // Количество игровых дней
        var daysPlayed: Int {
            get {
                return UserDefaults.standard.integer(forKey: "DaysPlayed")
            }
            set {
                UserDefaults.standard.set(newValue, forKey: "DaysPlayed")
            }
        }

        // Метод для обновления данных при начале новой игровой сессии
        func startNewGameSession() {
            startDate = Date() // Устанавливаем дату начала игры на текущую дату
            daysPlayed = 0 // Обнуляем количество игровых дней
        }

    @Published var bet: Int = 0
    @Published var selectedElement: String?
    let elements : [ (String,String, String)] = [("Apple","x2", "Very Common"),
                                                 ("Banana","x3", "Common"),
                                                 ("Plum","x4", "Common"),
                                                 ("Watermelon","x5","Uncommon"),
                                                 ("Grapes","x6","Uncommon"),
                                                 ("Purple candy","x7", "Rare"),
                                                 ("Blue candy","x8", "Rare"),
                                                 ("Green candy","x12", "Very rare"),
                                                 ("Red candy","x20", "Ultra rare")
                                                ]
    
}



enum Bonuses : Int{
    case x2 = 2
    case x5 = 5
    case x10 = 10
}

