//
//  ScoreView.swift
//  Turtle Smash
//
//  Created by Stephen Watkins on 1/24/15.
//  Copyright (c) 2015 Stephen Watkins. All rights reserved.
//

import Foundation
import UIKit

class ScoreView : UIView {
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var lastScoreLabel: UILabel!
    @IBOutlet weak var bestScoreLabel: UILabel!
    
    func refreshScoreLabels() {
        self.lastScoreLabel!.text = String(ScoreManager.getLastScore()!)
        self.bestScoreLabel!.text = String(ScoreManager.getHighScore()!)
    }
    
}