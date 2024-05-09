import SwiftUI

struct DailyGifts: View {
    @EnvironmentObject var userData: UserData
    @State private var currentChestIndex: Int = 0
    private let chestsCount: Int = 5
    private let secondsInDay: TimeInterval = 86400 // 24 часа в секундах
    private let rewardAmounts = [500, 1000, 2000, 3000, 5000]
    @State private var isChestOpened: [Bool] = Array(repeating: false, count: 5)
    @State private var isChestAvailable: [Bool] = Array(repeating: false, count: 5)
    @State private var isInitialized: Bool = false
    
    var body: some View {
        ZStack {
            Image("GiftLine")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            
            HStack {
                ForEach(0..<chestsCount, id: \.self) { index in
                    Button(action: {
                        openChest(at: index)
                    }) {
                        Image(isChestOpened[index] ? "OpenBox\(index + 1)" : isChestAvailable[index] ? "ClosedBox\(index + 1)" : "ClosedBox\(index + 1)")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                    .disabled(isChestOpened[index] || !isChestAvailable[index] || index != currentChestIndex)
                    Spacer()
                }
            }
        }
        .onAppear(perform: {
            if !isInitialized {
                checkLastChestOpenTime()
                isInitialized = true
            }
        })
    }
    
    func checkLastChestOpenTime() {
        let lastOpenTime = UserDefaults.standard.double(forKey: "LastChestOpenTime")
        let currentTime = Date().timeIntervalSince1970
        let elapsedTime = currentTime - lastOpenTime
        
        print("Last open time:", lastOpenTime)
        print("Current time:", currentTime)
        print("Elapsed time:", elapsedTime)
        
        if elapsedTime >= secondsInDay {
            // Прошло более 24 часов, открываем первый сундук
            currentChestIndex = 0
            isChestOpened = Array(repeating: false, count: 5)
            isChestAvailable = Array(repeating: false, count: 5)
            let daysPlayed = UserDefaults.standard.integer(forKey: "DaysPlayed")
            if daysPlayed < chestsCount {
                isChestAvailable[daysPlayed] = true
            }
        } else {
            // Прошло менее 24 часов, проверяем, открыт ли каждый сундук
            for index in 0..<chestsCount {
                if UserDefaults.standard.bool(forKey: "Chest\(index)Opened") {
                    // Сундук уже открыт
                    isChestOpened[index] = true
                    isChestAvailable[index] = false
                } else {
                    // Сундук доступен для открытия, если прошло более 24 часов с открытия предыдущего сундука
                    if index == 0 {
                        isChestAvailable[index] = elapsedTime >= secondsInDay
                    } else {
                        isChestAvailable[index] = isChestOpened[index - 1]
                    }
                }
            }
            
            if let lastIndex = isChestOpened.lastIndex(of: true) {
                currentChestIndex = lastIndex + 1 < chestsCount ? lastIndex + 1 : 0
            }
        }
    }
    
    func openChest(at index: Int) {
        UserDefaults.standard.set(true, forKey: "Chest\(index)Opened")
        UserDefaults.standard.set(Date().timeIntervalSince1970, forKey: "LastChestOpenTime")
        // Обновляем состояние, что сундук открыт
        isChestOpened[index] = true
        isChestAvailable[index] = false
        let rewardAmount = rewardAmounts[index]
        userData.coins += rewardAmount
        let daysPlayed = UserDefaults.standard.integer(forKey: "DaysPlayed") + 1
        UserDefaults.standard.set(daysPlayed, forKey: "DaysPlayed")
    }
}

struct DailyGifts_Previews: PreviewProvider {
    static var previews: some View {
        DailyGifts()
    }
}


