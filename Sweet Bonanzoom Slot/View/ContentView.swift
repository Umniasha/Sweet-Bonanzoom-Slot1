import SwiftUI
import SpriteKit



struct ContentView: View {
    @State private var isFirstWelcomeViewShowing = true
    let frameWidth = UIScreen.main.bounds.width
    let frameHeight = UIScreen.main.bounds.height + 30
    var body: some View {
//        MainMenuPage()
        ZStack {
                  FirstWelcomePage(isFirstWelcomeViewShowing: $isFirstWelcomeViewShowing)
                      .offset(x: isFirstWelcomeViewShowing ? 0 : -UIScreen.main.bounds.width)

                  SecondWelcomePage(isFirstWelcomeViewShowing: $isFirstWelcomeViewShowing)
                      .offset(x: isFirstWelcomeViewShowing ? UIScreen.main.bounds.width : 0)
              }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
