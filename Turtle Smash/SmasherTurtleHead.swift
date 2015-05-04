//
//  SmasherTurtleHead.swift
//  Turtle Smash
//
//  Created by Stephen Watkins on 1/24/15.
//  Copyright (c) 2015 Stephen Watkins. All rights reserved.
//

import Foundation
import SpriteKit

class SmasherTurtleHead : SKShapeNode, SmasherProtocol {
    
    var imageNode: SKSpriteNode?
    var turtleTexture: SKTexture?
    var turtleSmashedTexture: SKTexture?
    var turtleHappyTexture: SKTexture?
    var turtleConcernedTexture: SKTexture?
    
    override init() {
        super.init()
        
        self.lineWidth = 0
        
        self.turtleTexture = SKTexture(imageNamed: "turtle-head.png")
        self.turtleSmashedTexture = SKTexture(imageNamed: "turtle-head-smashed.png")
        self.turtleHappyTexture = SKTexture(imageNamed: "turtle-head-happy.png")
        self.turtleConcernedTexture = SKTexture(imageNamed: "turtle-head-concerned.png")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func pressBegins() {
        self.imageNode!.size = SmasherSizes["TurtleHead"]!.scale(1.0)
        self.imageNode!.texture = self.turtleConcernedTexture!
    }
    
    func pressEnds() {
        self.imageNode!.size = SmasherSizes["TurtleHead"]!.scale(1.0)
        self.imageNode!.texture = self.turtleSmashedTexture!
    }
    
    func highlight() {
        self.imageNode = SKSpriteNode(texture: turtleTexture)
        self.imageNode!.size = SmasherSizes["TurtleHead"]!
        self.imageNode!.position = SmasherSizes["TurtleHead"]!.centerPoint()
        
        self.addChild(self.imageNode!)
    }
    
    func reset() {
        if self.imageNode != nil {
            self.removeChildrenInArray([self.imageNode!])
            self.imageNode!.texture = self.turtleTexture!
        }
    }
    
    func invalidPress() {
    }
    
}