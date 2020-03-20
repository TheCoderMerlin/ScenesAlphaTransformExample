import Scenes

class MainScene : Scene {
    // Declare the layers that will be included in this scene
    let backgroundLayer : Layer
    let rectangleLayer : Layer

    init() {
        backgroundLayer = BackgroundLayer()
        rectangleLayer = RectangleLayer()
        
        super.init(name:"Main")

        insert(layer:backgroundLayer, at:.front)
        insert(layer:rectangleLayer, at:.front)
    }
    
}
