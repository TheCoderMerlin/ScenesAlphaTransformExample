import Scenes
import Igis
import Foundation

class ImageEntity : RenderableEntityBase {
    let image : Image

    init(sourceURL:URL, renderMode:Image.RenderMode) {
        image = Image(sourceURL:sourceURL)
        image.renderMode = renderMode
    }

    override func setup(canvas:Canvas) {
        canvas.setup(image)
    }

    override func render(canvas:Canvas) {
        if image.isReady {
            canvas.render(image)
        }
    }
}
