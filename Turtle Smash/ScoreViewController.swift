//
//  ScoreViewController.swift
//  Turtle Smash
//
//  Created by Stephen Watkins on 1/24/15.
//  Copyright (c) 2015 Stephen Watkins. All rights reserved.
//

import Foundation
import UIKit

class ScoreViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scoreView = self.view as ScoreView
        scoreView.playButton!.addTarget(
            self,
            action: "onPlayButtonPressed",
            forControlEvents: UIControlEvents.TouchUpInside)
        
        scoreView.refreshScoreLabels()
    }
    
    func onPlayButtonPressed() {
        self.performSegueWithIdentifier("reopenGame", sender: self)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}
