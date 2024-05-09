import Foundation

class UserDataManager {
    static let shared = UserDataManager()

    private let coinsKey = "Coins"

    var coins: Int {
        get {
            return UserDefaults.standard.integer(forKey: coinsKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: coinsKey)
        }
    }
    
    
    private let x2bonus = "x2"

    var x2: Int {
        get {
            return UserDefaults.standard.integer(forKey: x2bonus)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: x2bonus)
        }
    }
    private let x5bonus = "x5"

    var x5: Int {
        get {
            return UserDefaults.standard.integer(forKey: x5bonus)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: x5bonus)
        }
    }
    private let x10bonus = "x10"

    var x10: Int {
        get {
            return UserDefaults.standard.integer(forKey: x10bonus)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: x10bonus)
        }
    }
    
    
    private let bgKey = "EnabledBG"

    var enabledBG: String {
        get {
            return UserDefaults.standard.string(forKey: bgKey) ?? "bg0"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: bgKey)
        }
    }
    
    private let bgArrayKey = "bgArray"

    var arrayBG: [String] {
        get {
            return UserDefaults.standard.array(forKey: bgArrayKey) as? [String] ?? []
        }
        set {
            UserDefaults.standard.set(newValue, forKey: bgArrayKey)
        }
    }
    
    
    private init() {
           if UserDefaults.standard.object(forKey: bgKey) == nil {
               coins = 150
               x2 = 3
               x5 = 2
               x10 = 1
               enabledBG = "bg0"
               arrayBG = []
           }
       }
}
