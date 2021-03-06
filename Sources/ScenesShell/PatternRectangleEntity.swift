import Scenes
import Igis
import Foundation

class PatternRectangleEntity : RenderableEntity {
    let rectangle : Rectangle
    let velocity : Point
    let strokeStyle : StrokeStyle
    let fillImage : Image
    let fillPattern : Pattern
    let fillStyle : FillStyle
    let lineWidth : LineWidth

    init(rect:Rect, velocity:Point, strokeStyle:StrokeStyle, fillURL:URL, lineWidth:LineWidth) {
        self.rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
        self.velocity = velocity
        self.strokeStyle = strokeStyle
        self.fillImage = Image(sourceURL:fillURL)
        self.fillPattern = Pattern(image:fillImage, repetition:.repeated)
        self.fillStyle = FillStyle(pattern:self.fillPattern)
        self.lineWidth = lineWidth
        super.init(name:"Pattern")
    }

    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(fillImage, fillPattern)
    }

    override func calculate(canvasSize:Size) {
        let canvasRect = Rect(topLeft:Point(), size:canvasSize)
        let containmentSet = canvasRect.containment(target:rectangle.rect)

        if containmentSet.contains(.beyondRight) {
            rectangle.rect.topLeft = Point(x:-rectangle.rect.size.width, y:rectangle.rect.topLeft.y)
        }
        if containmentSet.contains(.beyondBottom) {
            rectangle.rect.topLeft = Point(x:rectangle.rect.topLeft.x, y:-rectangle.rect.size.height)
        }
        rectangle.rect.topLeft += velocity
    }

    override func render(canvas:Canvas) {
        if fillPattern.isReady {
            canvas.render(strokeStyle, fillStyle, lineWidth, rectangle)
        }
    }
}
