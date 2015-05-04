//
//  SmasherProtocol.swift
//  Turtle Smash
//
//  Created by Stephen Watkins on 1/24/15.
//  Copyright (c) 2015 Stephen Watkins. All rights reserved.
//

import Foundation
import SpriteKit

@objc protocol SmasherProtocol {
    func pressBegins()
    func pressEnds()
    func highlight()
    func invalidPress()
    func reset()
}