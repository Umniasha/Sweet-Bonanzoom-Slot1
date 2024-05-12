import Foundation

class UserDataManager {
    static let shared = UserDataManager()
    
    var todayDate: Date {
        return Date()
    }
    
    private let numberOfSpeensKey = "numberOfSpeensKey"
    
    var numberOfSpeens : Int {
        get {
            return UserDefaults.standard.integer(forKey: numberOfSpeensKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: numberOfSpeensKey)
        }
    }
    
    private let todayBestKey = "todayBestKey"
    
    var todayBest : Int {
        get {
            return UserDefaults.standard.integer(forKey: todayBestKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: todayBestKey)
        }
    }
    
    private let allTimeBestKey = "allTimeBestKey"
    
    var allTimeBest : Int {
        get {
            return UserDefaults.standard.integer(forKey: allTimeBestKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: allTimeBestKey)
        }
    }
    
    
    private let todayOpenKey = "todayOpen"
    
    var todayOpen: Bool {
        get {
            return UserDefaults.standard.bool(forKey: todayOpenKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: todayOpenKey)
        }
    }
    
    private let lastStartTimeKey = "lastStart"
    
    var lastStartDate: Date? {
        get {
            return UserDefaults.standard.object(forKey: lastStartTimeKey) as? Date
        }
        set {
            UserDefaults.standard.set(newValue, forKey: lastStartTimeKey)
        }
    }
   
    private let daysInARowKey = "DayInTheRow"
    
    var daysInARow : Int {
        get {
            return UserDefaults.standard.integer(forKey: daysInARowKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: daysInARowKey)
        }
    }
    
    private let firstStartKey = "FirstStart"
    
    var firstStart: Bool {
        get {
            return UserDefaults.standard.bool(forKey: firstStartKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: firstStartKey)
        }
    }
    
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
    
    private let freeSpinsKey = "freeSpins"

    var freeSpins: Int {
        get {
            return UserDefaults.standard.integer(forKey: freeSpinsKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: freeSpinsKey)
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
               freeSpins = 1
               firstStart = true
               lastStartDate = todayDate
               todayOpen = false
               daysInARow = 0
               todayBest = 0
               allTimeBest = 0
               numberOfSpeens = 0
           }
        
        if let lastStartDate = lastStartDate {
            if lastStartDate.daysDifference(to: todayDate) == 1 {
                self.lastStartDate = todayDate
                if daysInARow < 4 {
                    daysInARow += 1
                }
                todayBest = 0
                todayOpen = false
            } else if lastStartDate.daysDifference(to: todayDate) > 1 {
                daysInARow = 0
                self.lastStartDate = todayDate
                todayOpen = false
                todayBest = 0
            }
        }
        
       }
}

extension Date {
    func daysDifference(to date: Date) -> Int {
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: self)
        let endDate = calendar.startOfDay(for: date)
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        return components.day ?? 0
    }
}
