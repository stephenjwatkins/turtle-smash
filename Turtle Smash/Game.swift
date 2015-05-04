import Foundation
import UIKit
import AudioToolbox

class Game {
    
    typealias onOverResponder = () -> ()
    
    var score: Int = 0
    var smashersGrid: SmashersGrid?
    var view: GameView
    var round: Round?
    var onOverFn: onOverResponder?
    var isPendingOver: Bool = false
    
    init(view: GameView) {
        self.view = view
    }
    
    func start() {
        self.isPendingOver = false
        Round.Intervals.Current = Round.Intervals.Start
        self.newRound()
    }
    
    func press(smasher: Smasher) {
        self.scored()
        
        let highlightedSmashers = self.smashersGrid!.getSmashersWithState(Smasher.States.Highlighted)
        if highlightedSmashers.count == 0 {
            for smasher in self.smashersGrid!.getSmashersWithState(Smasher.States.Pressed) {
                smasher.blinkHighlight()
            }
            self.stopRound()
            delay(0.73) {
                self.newRound()
            }
        }
    }
    
    func stopRound() {
        if self.round == nil {
            return
        }
        self.round!.done()
        self.round = nil
    }
    
    func newRound() {
        if self.round != nil {
            return
        }
        self.round = Round(game: self)
        self.round!.start()
    }
    
    func scored() {
        score++
        self.view.scoreLabel.update(self.score)
    }
    
    func invalidPress() {
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        for smasher in self.smashersGrid!.getSmashersWithState(Smasher.States.Highlighted) {
            let turtleSmasher = (smasher.layers["TurtleHead"]! as SmasherTurtleHead)
            turtleSmasher.imageNode!.texture = turtleSmasher.turtleHappyTexture!
        }
        self.isPendingOver = true
        self.round!.done()
    }
    
    func over() {
        self.isPendingOver = true
        self.round!.done()
        
        ScoreManager.saveNewScore(score)
        self.view.progressView!.stopProgress()

        self.doOnOver()
    }
    
    func doOnOver() {
        if self.onOverFn != nil {
            self.onOverFn!()
        }
    }
    
    func onOver(success:()->()) {
        self.onOverFn = success
    }
    
}