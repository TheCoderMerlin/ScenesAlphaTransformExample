import Scenes

class MainScene : Scene {
    // Declare the layers that will be included in this scene
    let backgroundLayer : Layer
    let rectangleLayer : Layer

    override init() {
        backgroundLayer = BackgroundLayer()
        rectangleLayer = RectangleLayer()
        
        super.init()

        insert(layer:backgroundLayer, at:.front)
        insert(layer:rectangleLayer, at:.front)
    }
    
}
