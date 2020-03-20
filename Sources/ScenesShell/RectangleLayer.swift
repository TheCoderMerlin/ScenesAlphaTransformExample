import Scenes
import Igis
import Foundation

class RectangleLayer : Layer {
    var radians = 0.0

    init() {
        super.init(name:"Rectangle")

        for _ in 0 ..< Int.random(in:10 ... 20) {
            let topLeft = Point(x:Int.random(in:0 ... 2000), y:Int.random(in:0 ... 2000))
            let size = Size(width:Int.random(in:50 ... 500), height:Int.random(in:50 ... 500))
            let delta = Int.random(in:5 ... 20)
            let velocity = Bool.random() ?
              Point(x:delta, y:0) :
              Point(x:0, y:delta)
            let strokeStyle = StrokeStyle(color:Color(.red))
            let fillStyle = FillStyle(color:Color(.orange))
            let lineWidth = LineWidth(width:5)
            insert(entity:RectangleEntity(rect:Rect(topLeft:topLeft, size:size), velocity:velocity,
                                          strokeStyle:strokeStyle, fillStyle:fillStyle, lineWidth:lineWidth),
                   at:.front)
        }

        guard let fillURL = URL(string:"https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Io_highest_resolution_true_color.jpg/240px-Io_highest_resolution_true_color.jpg") else {
            fatalError("Unable to create URL")
        }
        let patternRectangleEntity = PatternRectangleEntity(rect:Rect(topLeft:Point(x:500, y:500), size:Size(width:300, height:300)),
                                                            velocity:Point(),
                                                            strokeStyle:StrokeStyle(color:Color(.red)),
                                                            fillURL:fillURL,
                                                            lineWidth:LineWidth(width:10))
        insert(entity:patternRectangleEntity, at:.front)

        setAlpha(alpha:Alpha(alphaValue:0.5))
    }

    override func preCalculate(canvas:Canvas) {
        guard let canvasSize = canvas.canvasSize else {
            fatalError("canvasSize is required for preCalculate")
        }
        let center = Point(x:canvasSize.width/2, y:canvasSize.height/2)
        let preTranslate = Transform(translate:DoublePoint(x:Double(center.x), y:Double(center.y)))
        let rotate = Transform(rotateRadians:radians)
        let postTranslate = Transform(translate:DoublePoint(x:Double(-center.x), y:Double(-center.y)))
        setTransforms(transforms:[preTranslate, rotate, postTranslate])
        radians += 1.0 * Double.pi / 180.0
    }
}
