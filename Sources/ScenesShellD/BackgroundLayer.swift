import Scenes
import Igis
import Foundation

class BackgroundLayer : Layer {
    let backgroundImageEntity : ImageEntity

    override init() {
        guard let url = URL(string:"https://upload.wikimedia.org/wikipedia/commons/3/31/The_Spitzer_Space_Telescope%27s_view_of_W40.jpg") else {
            fatalError("Failed to create URL for BackgroundLayer")
        }
        backgroundImageEntity = ImageEntity(sourceURL:url, renderMode:.destinationPoint(Point()))

        super.init()
        
        insert(entity:backgroundImageEntity, at:.front)
    }
}
