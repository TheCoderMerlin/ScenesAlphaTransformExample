import Foundation
import Igis
import Scenes

class BackgroundLayer : Layer {
    let backgroundImage : ImageEntity

    init() {
        guard let url = URL(string:"https://upload.wikimedia.org/wikipedia/commons/3/31/The_Spitzer_Space_Telescope%27s_view_of_W40.jpg") else {
            fatalError("Failed to create URL for BackgroundLayer")
        }
        backgroundImage = ImageEntity(sourceURL:url, renderMode:.destinationPoint(Point()))

        super.init(name:"Background")
        
        insert(entity:backgroundImage, at:.front)
    }
}
