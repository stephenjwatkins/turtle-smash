import SpriteKit

let SmasherSizes: [String: CGSize] = [
    "OuterCircle": CGSize(width: 64.0, height: 64.0),
    "InnerCircle": CGSize(width: 54.0, height: 54.0),
    "TurtleHead": CGSize(width: 34.0, height: 31.0),
]

class Smasher : SKShapeNode, SmasherProtocol {
    
    struct States {
        static let Inactive: String = "inactive"
        static let Highlighted: String = "highlighted"
        static let Pressed: String = "pressed"
        static let Invalid: String = "invalid"
    }
    
    var layers: [String : SKNode] = [:]
    var state: String = States.Inactive
    
    override init() {
        super.init()
        
        // Create the outer circle
        let outerRadius = (SmasherSizes["OuterCircle"]!.width / 2) - 1.0
        self.layers["OuterCircle"] = SmasherOuterCircle(circleOfRadius: outerRadius)
        self.layers["OuterCircle"]!.position = SmasherSizes["OuterCircle"]!.centerPoint()
        
        // Create the inner circle
        let innerRadius = SmasherSizes["InnerCircle"]!.width / 2
        self.layers["InnerCircle"] = SmasherInnerCircle(circleOfRadius: innerRadius)
        self.layers["OuterCircle"]!.addChild(self.layers["InnerCircle"]!)
        
        // Create the turtle head
        self.layers["TurtleHead"] = SmasherTurtleHead(rect: CGRect(
            origin: CGPoint(x: 0.0, y: 0.0),
            size: SmasherSizes["TurtleHead"]!
        ))
        self.layers["TurtleHead"]!.position = CGPoint(
            x: SmasherSizes["TurtleHead"]!.width / -2.0,
            y: SmasherSizes["TurtleHead"]!.height / -2.0
        )
        self.layers["InnerCircle"]!.addChild(self.layers["TurtleHead"]!)
        
        // Configure this node
        self.path = UIBezierPath(
            rect: CGRect(
                origin: CGPoint(x: 0.0, y: 0.0),
                size: SmasherSizes["OuterCircle"]!
            )
        ).CGPath
        self.lineWidth = 0
        
        self.addChild(self.layers["OuterCircle"]!)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    class func getFromChild(node: SKNode) -> Smasher {
        if node is Smasher {
            return node as Smasher
        }
        
        if let parentNode = node.parent {
            return Smasher.getFromChild(parentNode)
        }
        
        fatalError("Wrong smasher type encountered.")
    }
    
    func pressBegins() {
        self.state = States.Pressed
        for (kind, layer) in layers {
            (layer as SmasherProtocol).pressBegins()
        }
    }
    
    func pressEnds() {
        for (kind, layer) in layers {
            (layer as SmasherProtocol).pressEnds()
        }
    }
    
    func highlight() {
        self.state = States.Highlighted
        for (kind, layer) in layers {
            (layer as SmasherProtocol).highlight()
        }
    }
    
    func reset() {
        self.state = States.Inactive
        for (kind, layer) in layers {
            (layer as SmasherProtocol).reset()
        }
    }
    
    func invalidPress() {
        self.state = States.Invalid
        for (kind, layer) in layers {
            (layer as SmasherProtocol).invalidPress()
        }
    }
    
    func blinkHighlight() {
        (self.layers["OuterCircle"]! as SmasherOuterCircle).blink(Colors["PrimaryAccent"]!, count: 2)
    }
    
}
