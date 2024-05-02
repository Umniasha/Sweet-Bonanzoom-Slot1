
import SwiftUI
import SpriteKit


struct GameView: View {
    var scene: SKScene
    let sceneWidth = UIScreen.main.bounds.width
    let sceneHeight = UIScreen.main.bounds.width
    var body: some View {
        SpriteView(scene: scene, options: [.allowsTransparency])
            .frame(width: sceneWidth, height: sceneHeight)
    }
}

class GameScene: SKScene {
    let sceneWidth: Double = 0.86
    let sceneHeight: Double = 1
    let numRows = 6
    let numCols = 5
    var bg = SKSpriteNode()
    var bgFrame = SKSpriteNode()
    var elementsArray = [SKSpriteNode]()
    var nameArray = [String]()
    var selectTiles : Bool = true
    
    override func didMove(to view: SKView) {
        play()
        
        
        
    }
    func play(){
        scene?.removeAllChildren()
        elementsArray = []
        nameArray = []
        backgroundColor = .clear
        bg = SKSpriteNode(imageNamed: "GameSceneBG")
        bg.size =  CGSize(width: 0.86, height: 1)
        bg.name = "GameBG"
        bg.position = CGPoint(x: size.width / 2, y: size.height / 2)
        bg.zPosition = -1
        addChild(bg)
        
        bgFrame = SKSpriteNode(imageNamed: "GameFrame")
        bgFrame.size =  CGSize(width: 0.88, height: 1)
        bgFrame.name = "GameBG"
        bgFrame.position = CGPoint(x: size.width / 2, y: size.height / 2)
        bgFrame.zPosition = 1
        addChild(bgFrame)
        
        elementsArray = []
        
        createGrid()

        if selectTiles{
            for element in elementsArray {
                let frame = SKSpriteNode(imageNamed: "ElementFrameGS")
                frame.size = CGSize(width: sceneWidth*0.16, height: sceneWidth*0.16)
                frame.zPosition=2
                element.addChild(frame)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        
        if let node = elementsArray.first(where: {$0.contains(touchLocation)}){
            node.removeAllChildren()
            let frame = SKSpriteNode(imageNamed: "SelectElementFrameGS")
            frame.size = CGSize(width: sceneWidth*0.16, height: sceneWidth*0.16)
            frame.zPosition=2
            node.addChild(frame)
            
        }
    }
    
    
    func letSpeen(){
        var shuffledNames = nameArray.shuffled()
        var i = 0
        var j = 0.1
        _ = Timer.scheduledTimer(withTimeInterval: j, repeats: true, block: { timer in
            if shuffledNames.isEmpty {
                
                self.fillNameArray()
                shuffledNames = self.nameArray.shuffled()
            }
            
            let name = shuffledNames.removeFirst()
            let texture = SKTexture(imageNamed: name)

            let fadeOut = SKAction.fadeOut(withDuration: 0.3)
            let changeTexture = SKAction.setTexture(texture)
            let fadeIn = SKAction.fadeIn(withDuration: 0.3)
            let textureChangeAction = SKAction.sequence([fadeOut, changeTexture, fadeIn])

            self.elementsArray[i].run(textureChangeAction)

            self.elementsArray[i].name = name

            i += 1
            j += 0.5
            
            if i == self.elementsArray.count {
                i = 0
            }
            if j >= 45 {
                timer.invalidate()
            }
        })
    }

    
    func fillNameArray(){
        nameArray = []
        var array = [String]()
        for i in 0..<9{
                array.append("Apple")
            if i < 8{
                array.append("Banana")
            }
            if i < 7{
                array.append("Grapes")
            }
            if i < 6{
                array.append("Watermelon")
            }
            if i < 5{
                array.append("Plum")
            }
            if i < 4{
                array.append("Purple candy")
            }
            if i < 3{
                array.append("Blue candy")
            }
            if i < 2{
                array.append("Green candy")
            }
            if i < 1{
                array.append("Red candy")
                array.append("Bomb")
                array.append("Bonus game")
                array.append("Free speens")
            }
            
        }
        for _ in 0..<30 {
            array.shuffle()
            let name = array.removeFirst()
            nameArray.append(name)
            //print(name + "\n")
        }
        
    }
    
    func createGrid(){
        fillNameArray()
        
        let beginPosition = CGPoint(x: sceneWidth*0.225, y: sceneHeight*0.87)
        let cellSize = CGSize(width: sceneWidth*0.16, height: sceneWidth*0.16)
        let spacingX = cellSize.width * 1.1
        let spacingY = cellSize.height * 1.08
        var array = nameArray
        var position = beginPosition
        
        for _ in 0..<numCols{
            for _ in 0..<numRows{
                let imageName = array.removeFirst()
                let cell = SKSpriteNode(imageNamed: imageName)
                cell.size = cellSize
                cell.position = position
                cell.name = imageName
                elementsArray.append(cell)
                addChild(cell)
                position.y -= spacingY
            }
            position.y = beginPosition.y
            position.x += spacingX
        }
    }
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        GameViewPage(gameScene: GameScene())
            .environmentObject(UserData())
            
    }
}
