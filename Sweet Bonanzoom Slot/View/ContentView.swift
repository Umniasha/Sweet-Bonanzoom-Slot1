import SwiftUI
import SpriteKit



struct ContentView: View {
    @State private var isFirstWelcomeViewShowing = true
    @State private var showMenuPage = false
    let frameWidth = UIScreen.main.bounds.width
    let frameHeight = UIScreen.main.bounds.height
    
    
    var body: some View {
        
        ZStack {
            MainMenuPage()
            if !showMenuPage && UserDataManager.shared.firstStart{
                FirstWelcomePage(isFirstWelcomeViewShowing: $isFirstWelcomeViewShowing)
                      .offset(x: isFirstWelcomeViewShowing ? 0 : -UIScreen.main.bounds.width)

                SecondWelcomePage(showMenuPage: $showMenuPage)
                      .offset(x: isFirstWelcomeViewShowing ? UIScreen.main.bounds.width : 0)
                
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
        
    }
}
