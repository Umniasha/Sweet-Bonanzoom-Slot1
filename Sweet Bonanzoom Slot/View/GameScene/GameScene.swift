
import SwiftUI
import SpriteKit

struct GameScene: UIViewRepresentable {
    func makeUIView(context: Context) -> SKView {
        let view = SKView()
        let scene = GameSKScene(size: UIScreen.main.bounds.size)
        view.presentScene(scene)
        return view
    }
    
    func updateUIView(_ uiView: SKView, context: Context) {
        
    }
}

class GameSKScene: SKScene {
    override func didMove(to view: SKView) {
        
        let bg = SKSpriteNode(imageNamed: "GameSceneBG")
        bg.size = scene!.size
        bg.name = "GameBG"
        bg.position = CGPoint(x: size.width / 2, y: size.height / 2)
        bg.zPosition = 1
        addChild(bg)
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    
}
struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        GameScene()
            .edgesIgnoringSafeArea(.all)
    }
}
