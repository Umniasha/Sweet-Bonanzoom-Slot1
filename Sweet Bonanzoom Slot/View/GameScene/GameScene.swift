
import SwiftUI
import SpriteKit


struct GameView: View {
    var scene: SKScene
    
    var body: some View {
        SpriteView(scene: scene, options: [.allowsTransparency])
            .frame(width: UIScreen.main.bounds.width-40, height: UIScreen.main.bounds.height/2)
    }
}

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        // Настройка игровой сцены
        
        // Установка прозрачного фона
        backgroundColor = .clear
        
        // Добавление прямоугольника
        let bg = SKSpriteNode(imageNamed: "GameSceneBG")
        bg.size =  scene!.size
        bg.name = "GameBG"
        bg.position = CGPoint(x: size.width / 2, y: size.height / 2)
        bg.zPosition = 1
        addChild(bg)
    }
}
struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        GameView(scene: GameScene())
            
    }
}
