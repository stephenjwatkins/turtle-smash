//
//  SmashersGrid.swift
//  Turtle Smash
//
//  Created by Stephen Watkins on 1/24/15.
//  Copyright (c) 2015 Stephen Watkins. All rights reserved.
//

import Foundation
import UIKit

class SmashersGrid {
    
    struct Config {
        static let Rows: Int = 3
        static let Cols: Int = 3
    }
    
    var scene: SmashersScene
    var smashers: [Int: Smasher] = [:]
    
    class func initWithScene(scene: SmashersScene) -> SmashersGrid {
        return SmashersGrid(fromScene: scene)
    }
    
    init(fromScene scene: SmashersScene) {
        self.scene = scene;
    }
    
    func createSmashers() {
        for var row = 1; row <= Config.Rows; row++ {
            for var col = 1; col <= Config.Cols; col++ {
                self.addSmasher(Smasher(), row: row, col: col)
            }
        }
    }
    
    func addSmasher(smasher: Smasher, row: Int, col: Int) {
        let smashersWidth = smasher.frame.width * CGFloat(Config.Cols)
        let gutter = (self.scene.frame.width - smashersWidth) / CGFloat(Config.Cols - 1)
        let _row: Int = [Int](1...Config.Rows).reverse()[row - 1]
        let index: Int = ((row - 1) * 3) + col
        
        smasher.position = CGPoint(
            x: (CGFloat(col - 1) * smasher.frame.width) + (CGFloat(col - 1) * gutter),
            y: (CGFloat(_row - 1) * smasher.frame.height) + (CGFloat(_row - 1) * gutter)
        )
        smasher.name = String(index)
        
        self.smashers[index] = smasher
        
        self.scene.addChild(smasher)
    }
    
    func getSmashersWithState(state: String) -> [Smasher] {
        return self.smashers.values.array.filter { $0.state == state }
    }
    
    func randomSmashersFromRange(current: Double, start: Double, end: Double) -> [Smasher] {
        
        let smasherArr: [Smasher] = self.smashers.values.array
        let randomThreshold = UInt32(7)
        var indices: [Int] = []
        
        let ratio = (start - current) / (start - end)
        let factor = Int(ratio * Double(randomThreshold - 1))
        let prevFactor = Int(max(0, factor - 1))
        let nextFactor = Int(min(smasherArr.count - 1, factor + 1))
        
        for _ in 0...2 {
            indices.append(0)
        }
        for _ in 0...2 {
            indices.append(1)
        }
        for _ in 0...10 {
            indices.append(prevFactor)
        }
        for _ in 0...15 {
            indices.append(factor)
        }
        for _ in 0...1 {
            indices.append(nextFactor)
        }
        
        let randomIndiceIndex = Int(arc4random_uniform(UInt32(indices.count)))
        let randomSmasherCount = indices[randomIndiceIndex] + 1
        
        // Generate an array of all circle indices and shuffle the array.
        // Grab the first x up unto randomCircleCount.
        
        var randomSmashers: [Smasher] = smasherArr
        randomSmashers.shuffle()
        
        return [Smasher](randomSmashers[0..<randomSmasherCount])
    }
    
}