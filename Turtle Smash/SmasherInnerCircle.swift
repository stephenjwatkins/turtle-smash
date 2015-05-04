//
//  SmasherInnerCircle.swift
//  Turtle Smash
//
//  Created by Stephen Watkins on 1/24/15.
//  Copyright (c) 2015 Stephen Watkins. All rights reserved.
//

import Foundation
import SpriteKit

class SmasherInnerCircle : SKShapeNode, SmasherProtocol {
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func pressBegins() {
    }
    
    func pressEnds() {
        self.fillColor = Colors["DarkGreen"]!.colorWithAlphaComponent(0.65)
        //self.fillColor = UIColor.clearColor()
        //self.fillColor = Colors["PrimaryAccent"]!
    }
    
    func highlight() {
        self.fillColor = Colors["DarkGreen"]!
    }
    
    func reset() {
        self.fillColor = UIColor.clearColor()
    }
    
    func invalidPress() {
    }
    
}