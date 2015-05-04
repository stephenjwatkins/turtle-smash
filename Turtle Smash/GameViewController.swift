//
//  GameViewController.swift
//  Turtle Smash
//
//  Created by Stephen Watkins on 1/5/15.
//  Copyright (c) 2015 Stephen Watkins. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let thisView = self.view as GameView
        let game = GameManager.newGame(thisView)
        game.onOver({
            delay(0.35) {
                self.performSegueWithIdentifier("showScore", sender: self)
            }
        })
        
        if SettingsManager.get("alreadyShowedHelper") == nil {
            delay(0.5) {
                self.showHelper()
            }
        }
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func hideHelper(gotItButton: UIButton) {
        UIView.animateWithDuration(0.35, animations: {
            gotItButton.superview!.frame = CGRectMake(self.view.frame.width, 0, self.view.frame.width, self.view.frame.height)
        },
        completion: {
            (isFinished: Bool) in
            gotItButton.superview!.removeFromSuperview()
            SettingsManager.set("alreadyShowedHelper", value: true)
            GameManager.currentGame!.start()
        })
    }
    
    func showHelper() {
        let myView = NSBundle.mainBundle().loadNibNamed("HelpScreen", owner: nil, options: nil)[0] as UIView
        myView.frame = CGRectMake(self.view.frame.width, 0, self.view.frame.width, self.view.frame.height)
        
        self.view.addSubview(myView)
        
        // Slide in the subview into view from right to left
        UIView.animateWithDuration(0.35, animations: { () -> Void in
            myView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        })
        
        if let gotItButton = myView.viewWithTag(1) {
            (gotItButton as UIButton).addTarget(self, action: "hideHelper:", forControlEvents: UIControlEvents.TouchUpInside)
        }
    }
}
