import Scenes
import Igis

class RectangleEntity : RenderableEntity {
    let rectangle : Rectangle
    let velocity : Point
    let strokeStyle : StrokeStyle
    let fillStyle : FillStyle
    let lineWidth : LineWidth

    init(rect:Rect, velocity:Point, strokeStyle:StrokeStyle, fillStyle:FillStyle, lineWidth:LineWidth) {
        self.rectangle = Rectangle(rect:rect, fillMode:.fillAndStroke)
        self.velocity = velocity
        self.strokeStyle = strokeStyle
        self.fillStyle = fillStyle
        self.lineWidth = lineWidth
        super.init(name:"Rectangle")
    }

    override func calculate(canvasSize:Size) {
        let canvasRect = Rect(topLeft:Point(), size:canvasSize)
        let containmentSet = canvasRect.containment(target:rectangle.rect)

        if containmentSet.contains(.beyondRight) {
            rectangle.rect.topLeft.moveTo(x:-rectangle.rect.size.width, y:rectangle.rect.topLeft.y)
        }
        if containmentSet.contains(.beyondBottom) {
            rectangle.rect.topLeft.moveTo(x:rectangle.rect.topLeft.x, y:-rectangle.rect.size.height)
        }
        rectangle.rect.topLeft.moveBy(offset:velocity)
    }

    override func render(canvas:Canvas) {
        canvas.render(strokeStyle, fillStyle, lineWidth, rectangle)
    }
}
