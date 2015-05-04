//
//  PlayViewController.swift
//  Turtle Smash
//
//  Created by Stephen Watkins on 1/5/15.
//  Copyright (c) 2015 Stephen Watkins. All rights reserved.
//

import Foundation
import UIKit

class PlayViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.playButton.addTarget(
            self,
            action: "onPlayButtonPressed",
            forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func onPlayButtonPressed() {
        self.performSegueWithIdentifier("openGame", sender: self)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}