import SwiftUI

struct BonusGamePage: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var userData: UserData
    let bonusItems: [(bonus: Bonuses, angle: ClosedRange<Double>)] = [
        (.x2, 0.0...7.35),
        (.x5, 7.35...14.7),
        (.x10, 14.7...22.05),
        (.x2, 22.05...29.4),
        (.x5, 29.4...36.75),
        (.x2, 36.75...44.1),
        (.x10, 44.1...51.45),
        (.x5, 51.45...58.8),
        (.x2, 58.8...66.15),
        (.x5, 66.15...73.5),
        (.x2, 73.5...80.85),
        (.x10, 80.85...88.2),
        (.x5, 88.2...95.55),
        (.x2, 95.55...102.9),
        (.x5, 102.9...110.25),
        (.x2, 110.25...117.6),
        (.x10, 117.6...124.95),
        (.x5, 124.95...132.3),
        (.x10, 132.3...139.65),
        (.x2, 139.65...147.0),
        (.x5, 147.0...154.35),
        (.x2, 154.35...161.7),
        (.x5, 161.7...169.05),
        (.x10, 169.05...176.4),
        (.x2, 176.4...183.75),
        (.x5, 183.75...191.1),
        (.x2, 191.1...198.45),
        (.x10, 198.45...205.8),
        (.x5, 205.8...213.15),
        (.x2, 213.15...220.5),
        (.x5, 220.5...227.85),
        (.x2, 227.85...235.2),
        (.x5, 235.2...242.55),
        (.x2, 242.55...249.9),
        (.x10, 249.9...257.25),
        (.x2, 257.25...264.6),
        (.x5, 264.6...271.95),
        (.x10, 271.95...279.3),
        (.x2, 279.3...286.65),
        (.x5, 286.65...294.0),
        (.x2, 294.0...301.35),
        (.x5, 301.35...308.7),
        (.x2, 308.7...316.05),
        (.x10, 316.05...323.4),
        (.x2, 323.4...330.75),
        (.x5, 330.75...338.1),
        (.x2, 338.1...345.45),
        (.x10, 345.45...352.8),
        (.x5, 352.8...360.0)
    ]
    
    @State private var angle: Double = 0.0
    @State private var isSpinning: Bool = false
    @State private var bonus: String = ""
    @State private var selectedBonusIndex: Int?
    @State private var isEndSpeen = false
    @State private var buttonText = "SPEEN"
    
    @State private var currentAngle: Double = 0.0
    private let spinInterval: TimeInterval = 0.05
    
    var body: some View {
        VStack (spacing: 0){
            HStack{
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    TopBarIcon(imageName: "BackBTN")
                }

                Spacer()
                
                ScoreFrame()
            }
            .padding([.leading, .trailing])
            
            Image("BonusGame 1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: ContentView().frameWidth*0.7)
            
            ZStack {
                
                Image("FortuneBack")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ContentView().frameWidth*0.95)
                
                Image("Vector")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ContentView().frameWidth*0.81)
                
                Image("FortuneCircle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ContentView().frameWidth*0.8)
                    .rotationEffect(.degrees(angle))
                
                Image("Group")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ContentView().frameWidth*0.2)
                
                if isEndSpeen {
                    Image("x\(bonus)")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: ContentView().frameWidth*0.3)
                }
                
                Image("Triangle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ContentView().frameWidth*0.18)
                    .padding(.top,-ContentView().frameWidth*0.55 )
                
            }
            
                    SpeenButton(action: {
                        if isEndSpeen && !isSpinning{
                            self.presentationMode.wrappedValue.dismiss()
                       } else if isSpinning{
                            stopSpinning()
                        } else if !isSpinning {
                            startSpinning()
                            buttonText = "STOP"
                        }
                    }, isActive: true, text: !isEndSpeen ? buttonText : "TAKE" , imageName: "Speen")
                
                
            Spacer()
        }
        .background(alignment: .bottom) {
            Image("\(userData.enabledBG)true")
                   .resizable()
                   .edgesIgnoringSafeArea(.all)
                   .aspectRatio(contentMode: .fill)
                   .frame(width: ContentView().frameWidth)
        }
        .navigationBarHidden(true)
    }
    
    func startSpinning() {
        isSpinning = true
        
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            
            withAnimation(Animation.linear) {
                currentAngle -= 7.0
            }
            angle = currentAngle
            if currentAngle <= -360{
                currentAngle = 0
            }
            
            if !isSpinning {
                timer.invalidate()
                    stopSpinning()
                
            }
           
        }
    }
    
    func stopSpinning() {
        isSpinning = false
        for (index, item) in bonusItems.enumerated() {
            if item.angle.contains(-currentAngle) {
                selectedBonusIndex = index
                bonus = "\(item.bonus.rawValue)"
                if bonus == "2"{
                    userData.x2Bonus += 1
                } else if bonus == "5"{
                    userData.x5Bonus += 1
                } else if bonus == "10"{
                    userData.x10Bonus += 1
                }
                isEndSpeen = true
                break
            }
        }
    }
}



struct BonusGamePage_Previews: PreviewProvider {
    static var previews: some View {
        BonusGamePage()
            .environmentObject(UserData())
    }
}
