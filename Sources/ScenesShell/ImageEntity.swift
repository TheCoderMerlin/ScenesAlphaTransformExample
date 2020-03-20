import Scenes
import Igis
import Foundation

class ImageEntity : RenderableEntity {
    let image : Image

    init(sourceURL:URL, renderMode:Image.RenderMode) {
        image = Image(sourceURL:sourceURL)
        image.renderMode = renderMode
        super.init(name:"Image")
    }

    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(image)
    }

    override func render(canvas:Canvas) {
        if image.isReady {
            canvas.render(image)
        }
    }
}
