//
//  SmasherOuterCircle.swift
//  Turtle Smash
//
//  Created by Stephen Watkins on 1/24/15.
//  Copyright (c) 2015 Stephen Watkins. All rights reserved.
//

import Foundation
import SpriteKit

class SmasherOuterCircle : SKShapeNode, SmasherProtocol {
    
    override init() {
        super.init()
        
        self.strokeColor = Colors["DarkGreen"]!
        self.lineWidth = 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func pressBegins() {
    }
    
    func pressEnds() {
        self.strokeColor = Colors["PrimaryAccent"]!
    }
    
    func highlight() {
    }
    
    func reset() {
        self.strokeColor = Colors["DarkGreen"]!
    }
    
    func invalidPress() {
        self.strokeColor = Colors["Invalid"]!
        self.blink(Colors["Invalid"]!)
    }
    
    func blink(color: UIColor, count: Int = 3) {
        if count == 0 {
            return
        }
        
        delay(0.1) {
            self.strokeColor = UIColor.clearColor()
            delay(0.1) {
                self.strokeColor = color
                self.blink(color, count: count - 1)
            }
        }
    }
    
}