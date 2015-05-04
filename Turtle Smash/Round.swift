//
//  Round.swift
//  Turtle Smash
//
//  Created by Stephen Watkins on 1/24/15.
//  Copyright (c) 2015 Stephen Watkins. All rights reserved.
//

import Foundation
import AudioToolbox

class Round {
    
    struct Intervals {
        static var Threshold: Double = 1.8
        static var Start: Double = 10.0
        static var Current: Double = Intervals.Start
    }
    
    var game: Game
    var timer: NSTimer?
    
    init(game: Game) {
        self.game = game
    }
    
    @objc func expire() {
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        self.game.over()
    }
    
    func done() {
        self.game.view.progressView!.stopProgress()
        self.timer!.invalidate()
    }
    
    func start() {
        // Reset progress view color
        self.game.view.progressView!.setColor(Colors["DarkGreen"]!)
        
        // Decrease the time interval with each new round
        Intervals.Current = max(Intervals.Threshold, Intervals.Current - 0.2)
        
        // Reset smashers
        for smasher in self.game.smashersGrid!.smashers.values.array {
            smasher.reset()
        }
        
        // Highlight smashers
        let randomSmashers = self.game.smashersGrid!.randomSmashersFromRange(
            Intervals.Current,
            start: Intervals.Start,
            end: Intervals.Threshold)
        
        for smasher in randomSmashers {
            smasher.highlight()
        }
        
        // Run progress animation
        self.game.view.progressView!.animateProgress(Intervals.Current)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(
            Intervals.Current,
            target: self,
            selector: Selector("expire"),
            userInfo: nil,
            repeats: false
        )
    }
    
}