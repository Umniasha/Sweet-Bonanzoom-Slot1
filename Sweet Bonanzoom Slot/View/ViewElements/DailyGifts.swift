import SwiftUI

struct DailyGifts: View {
    @EnvironmentObject var userData: UserData
    @State private var open = false
    var bonusArray = [500, 1000, 2000, 3000, 5000]
    
    var body: some View {
        ZStack {
            Image("GiftLine")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            
            HStack {
                ForEach (1..<6) { i in
                    if UserDataManager.shared.daysInARow + 1 > i && i < 5{
                        BoxButton(openBox: true, boxAction: {}, readyToActive: false, imageOpenBox: "OpenBox\(i)", imageCloseBox: "ClosedBox\(i)")
                            .padding([.leading,.trailing],4)
                    }
                    if UserDataManager.shared.daysInARow + 1 == i  {
                        if !UserDataManager.shared.todayOpen {
                            BoxButton(openBox: open, boxAction: {
                                open = true
                                UserDataManager.shared.todayOpen = true
                                userData.coins += bonusArray[i-1]
                            }, readyToActive: true, imageOpenBox: "OpenBox\(i)", imageCloseBox: "ClosedBox\(i)")
                                .padding([.leading,.trailing],4)
                        } else {
                            BoxButton(openBox: true, boxAction: {}, readyToActive:false, imageOpenBox: "OpenBox\(i)", imageCloseBox: "ClosedBox\(i)")
                                .padding([.leading,.trailing],4)
                        }
                        
                    } 
                    if UserDataManager.shared.daysInARow + 1 < i && UserDataManager.shared.daysInARow < 4 {
                        BoxButton(openBox: false, boxAction: {}, readyToActive: false, imageOpenBox: "OpenBox\(i)", imageCloseBox: "ClosedBox\(i)")
                            .padding([.leading,.trailing],4)
                    }
                    
                    if UserDataManager.shared.daysInARow >= 4 {
                        
                    }
                    
                    
                }
            }
        }
        
    }
    
}
    
    
   

struct DailyGifts_Previews: PreviewProvider {
    static var previews: some View {
        DailyGifts()
    }
}
